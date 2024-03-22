#!groovy
import org.jenkinsci.plugins.workflow.steps.FlowInterruptedException

import java.text.SimpleDateFormat

// Jenkins config ---------------------------------------------------{
final def testNode = "ubuntu_java-17_pea-testing" // Do not modify

// GIT config -------------------------------------------------------{
final def gitRepo = "https://bitbucket.tools.3stripes.net/scm/dam/asset-trafficker-api-component-api-tests" //UPDATE ACCORDING TO YOUR NEEDS

// Test Pipeline config
def projectName = "asset-trafficker-api-component-api-tests" //UPDATE ACCORDING TO YOUR NEEDS

def cucumberResultsFile = "cucumber-results.json" //DO NOT MODIFY
def cucumberResultsDir = "target/results" //DO NOT MODIFY

def date = new Date()
def sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss")

// JIRA data:
String jiraEnvironment = ""
String jiraSummary = ""
String jiraDescription = ""
String featuresPath = "" //DO NOT MODIFY picked below
String testCases = env.testCases
String testCasesToExecute = ""

def emailAddress = "ravi.ranjan2@adidas.com; mkrtich.stepanyan@externals.adidas.com; ignacio.fernandezdebobadilla@adidas.com;" //UPDATE ACCORDING TO YOUR NEEDS

def tags = ""

final def featuresDirJenkins = "src/test/resources/features" //DO NOT MODIFY
final def xrayImportUrl = "https://jira.tools.3stripes.net/rest/raven/1.0/import/execution/cucumber" //DO NOT MODIFY
final def xrayImportHeader = "-H 'Content-Type: application/json' -H 'Cache-Control: no-cache'" //DO NOT MODIFY
final def xrayImportData = "@target/cucumber-report.json" //DO NOT MODIFY
final def xrayImportOutput = "target/xray-response.json" //DO NOT MODIFY
final def xrayAddTestCaseToTestPlanUrl = "https://jira.tools.3stripes.net/rest/raven/1.0/api/testplan/"


String putData = ""
String jiraTransitionData = ""
boolean timeOutRaised = false

@Library(["GlobalJenkinsLibrary@master", "TaaSWrapper@master"]) _

//Pipeline
node(testNode) {
    try {
        timeout(time: 30, unit: 'MINUTES') {
            currentBuild.result = "SUCCESS"
            if (env.environment == 'dev') {
                echo "Selected environment is DEV"
                jiraEnvironment = "DEV"
            } else {
                echo "Selected environment is STAGING"
                jiraEnvironment = "STG"
            }
            if (testCases != "") {
                featuresPath = featuresDirJenkins
                // Test to execute are comma separated. We need to ensure no spaces among commas
                // Then we add corresponding tag for selecting them in code
                testCasesToExecute = testCases.replaceAll(" ", "")

                tags = testCasesToExecute.replace("\\s", "").replace("PDM", "@TEST_PDM")
                // tags in cucumber are not working if comma separated, they need to be split by 'and' keyword
                tags = tags.replace(",", " or ")
                echo "Selected test cases are $testCases"
                echo "tags to be executed are $tags"
            } else {
                echo "No testCases provided"
                withCredentials([string(credentialsId: 'ms_teams_DAD20_channel_team', variable: 'MSTEAMS_CREDENTIALS')]) {
                    office365ConnectorSend(
                            message: "CI FAILURE in Retrieving Test case from Jenkins job: " + '</BR>' + BUILD_URL,
                            webhookUrl: MSTEAMS_CREDENTIALS,
                            color: 'danger'
                    )
                }
                currentBuild.result = 'ABORTED'
                error("Build aborted because of no test case provided")
            }
            if (env.testPlan == "") {
                echo "No testPlan provided"
                withCredentials([string(credentialsId: 'ms_teams_DAD20_channel_team', variable: 'MSTEAMS_CREDENTIALS')]) {
                    office365ConnectorSend(
                            message: "CI FAILURE in Retrieving Test Plan from Jenkins job: " + '</BR>' + BUILD_URL,
                            webhookUrl: MSTEAMS_CREDENTIALS,
                            color: 'danger'
                    )
                }
                currentBuild.result = 'ABORTED'
                error("Build aborted because of no test plan provided")
            } else {
                echo "Selected testPlan is $env.testPlan"
            }

            jiraSummary = "Test Execution of: $testCases " + sdf.format(date)
            jiraDescription = "Test Execution of $testCases for testPlan $env.testPlan"
            // Data to edit JIRA test execution ticket
            putData = "{\"fields\": {\"summary\": \"$jiraSummary\",\"description\": \"$jiraDescription\",\"labels\":\
                   [\"PDM-DAD2.0\"],\"customfield_11405\":\
                   [\"$jiraEnvironment\"],\"components\": [ {\"name\": \"DAD2.0_AssetTrafficker_ATAPI\"}]}}"

            // Data to edit transition to 'closed' status in JIRA
            jiraTransitionData = "{ \
            \"update\": { \
                        \"comment\": [ \
                        { \
                            \"add\": { \
                            \"body\": \"Closed via automated process.\" \
                            } \
                        } \
                        ] \
            }, \
            \"transition\": { \
                \"id\": \"51\" \
            }, \
            \"fields\": { \
                \"resolution\": { \
                    \"name\": \"Done\" \
                } \
            } \
        }"
            // In order to link testCase(s) to jira Test execution body in jira request needs to be parsed correspondingly
            def listOfTestCases = testCasesToExecute.split(',').collect { it as String }
            def listToJson = []
            for (i in listOfTestCases) {
                listToJson.add("\"" + i + "\"")
            }

            jiraBodyToLinkTestToTestPlan =
                    "{\"add\": ${listToJson}}"


            stage("Pulling Automation Code") {
                try {
                    echo "DATE: " + sdf.format(date)
                    checkout scm
                }
                catch (FlowInterruptedException err) {
                    timeOutRaised = true
                }
                catch (Exception error) {
                    echo "Caught: " + error
                    currentBuild.result = "FAILURE"

                    withCredentials([string(credentialsId: 'ms_teams_DAD20_channel_team', variable: 'MSTEAMS_CREDENTIALS')]) {
                        office365ConnectorSend(
                                message: "CI FAILURE in Retrieving data from SCM for BUILD_URL: " + '</BR>' + BUILD_URL,
                                webhookUrl: MSTEAMS_CREDENTIALS,
                                color: 'danger'
                        )
                    }
                }
            }

            stage("Fetch API Spec from Swagger") {
                flows.swaggerHub.fetch(
                        oas: '3.0.0',
                        org: 'adidas',
                        name: 'dad-asset-trafficker',
                        version: '2.0.2',
                        format: 'json',
                        file: 'adidas-dad-asset-trafficker-2.0.2-resolved.json',
                        credentials: 'svc_pdm_api_swagger_hub_token'
                )
            }

            
            stage("Executing Test(s) Case(s): ${testCasesToExecute} in environment: ${env.environment}") {
                try {
                    withCredentials([
                            string(credentialsId: 'at_db_pass', variable: 'at_db_pass'),
                            string(credentialsId: 'svc_dad_dev_ta1', variable: 'svc_dad_dev_ta1'),
                            string(credentialsId: 'svc_dad_test95all', variable: 'svc_dad_test95all'),
                            string(credentialsId: 'svc_dad_test_dst', variable: 'svc_dad_test_dst'),
                            string(credentialsId: 'svc_dad_test_rpst', variable: 'svc_dad_test_rpst'),
                            string(credentialsId: 'svc_dad_test_rst', variable: 'svc_dad_test_rst'),
                            string(credentialsId: 'svc_dad_test_ust', variable: 'svc_dad_test_ust')
                    ]) {
                        sh "mvn clean test serenity:aggregate -Dcucumber.features='${featuresPath}' \
                                -DsetProxy=true -Dhttps.proxyHost=10.127.254.25 -Dhttps.proxyPort=8080 \
                                -Dcucumber.filter.tags=${tags} \
                                -Dat_db_pass='$at_db_pass'\
                                -Dsvc.ta1_password='$svc_dad_dev_ta1'\
                                -Dsvc.rst_password='$svc_dad_test_rst'\
                                -Dsvc.ust_password='$svc_dad_test_ust'\
                                -Dsvc.dst_password='$svc_dad_test_dst'\
                                -Dsvc.rpst_password='$svc_dad_test_rpst'\
                                -Dsvc.all_95_password='$svc_dad_test95all'\
                                -Denv='${env.environment}'"
                    }
                }
                catch (FlowInterruptedException err) {
                    timeOutRaised = true
                }
                catch (Exception e) {
                    echo "Caught: " + e
                    currentBuild.result = "UNSTABLE"
                    withCredentials([string(credentialsId: 'ms_teams_DAD20_channel_team', variable: 'MSTEAMS_CREDENTIALS')]) {
                        office365ConnectorSend(
                                message: "CI unstable due to issues while executing test scenarios for BUILD_URL: " + '</BR>' + BUILD_URL,
                                webhookUrl: MSTEAMS_CREDENTIALS,
                                color: '#FFA500'
                        )
                    }
                }
            }

            stage("Publishing Reports") {
                try {
                    report.serenity()
                    report.cucumber()
                }
                catch (FlowInterruptedException err) {
                    timeOutRaised = true
                }
                catch (Exception e) {
                    echo "Caught: " + e
                    currentBuild.result = "UNSTABLE"
                    withCredentials([string(credentialsId: 'ms_teams_DAD20_channel_team', variable: 'MSTEAMS_CREDENTIALS')]) {
                        office365ConnectorSend(
                                message: "CI unstable due to issues while publishing test reports for BUILD_URL: " + '</BR>' + BUILD_URL,
                                webhookUrl: MSTEAMS_CREDENTIALS,
                                color: '#FFA500'
                        )
                    }
                }
            }

            stage("Exporting Test Results") {
                try {
                    withCredentials([usernamePassword(
                            credentialsId: 'svc_pdm_jira_credentials',
                            usernameVariable: 'JIRAUSERNAME',
                            passwordVariable: 'JIRAPASS'
                    )]) {
                        //Create a test execution key
                        sh "curl -X POST ${xrayImportUrl} ${xrayImportHeader} -u ${JIRAUSERNAME}:${JIRAPASS} -d ${xrayImportData} -o ${xrayImportOutput}"
                    }
                    def props = readJSON file: xrayImportOutput
                    def executionKey = props.testExecIssue.key

                    echo '[Xray] Test Execution will be: ' + executionKey
                    //Linking test execution to test plan
                    //Creating json data for Xray
                    sh "echo '{\"add\": [\"$executionKey\"]}' > target/data.json"

                    withCredentials([
                            usernamePassword(
                                    credentialsId: 'svc_pdm_jira_credentials',
                                    usernameVariable: 'JIRAUSERNAME',
                                    passwordVariable: 'JIRAPASS'
                            )
                    ]) {
                        // Add test case to Test Plan
                        def urlTestCaseToTestPlan = xrayAddTestCaseToTestPlanUrl + env.testPlan + '/test'
                        sh "echo '$jiraBodyToLinkTestToTestPlan' > jiraBodyToLinkTestToTestPlan.json"
                        def jiraAddTestcaseToTestPlan = '@jiraBodyToLinkTestToTestPlan.json'
                        sh "curl -X POST $urlTestCaseToTestPlan $xrayImportHeader -u $JIRAUSERNAME:$JIRAPASS -d $jiraAddTestcaseToTestPlan"

                        currentBuild.description = "<b>Test Execution: <a href='https://jira.tools.3stripes.net/browse/${executionKey}'> ${executionKey} </a></b></br>"
                        currentBuild.description = currentBuild.description + "<b>Test Cases: ${testCases} </b></br>"


                        //Linking Test Plan and Test Execution
                        def url = 'https://jira.tools.3stripes.net/rest/raven/1.0/api/testplan/' + env.testPlanJira + '/testexecution'
                        def data = '@target/data.json'
                        sh "curl -X POST $url $xrayImportHeader -u $JIRAUSERNAME:$JIRAPASS -d $data"
                        //Editing Test Execution attributes example
                        def urlExecution = 'https://jira.tools.3stripes.net/rest/api/2/issue/' + executionKey
                        https://jira.tools.3stripes.net/rest/api/2/issue/PDM-2520/transitions
                        sh "echo '$putData' > putData.json"
                        def pData = '@putData.json'
                        sh "curl -X PUT $urlExecution $xrayImportHeader -u $JIRAUSERNAME:$JIRAPASS -d $pData"
                        // Editing transition status of test execution to closed
                        def urlTransition = urlExecution + '/transitions'
                        sh "echo '$jiraTransitionData' > jiraTransitionIssue.json"
                        def jiraTransitionDataIssue = '@jiraTransitionIssue.json'
                        sh "curl -X POST $urlTransition $xrayImportHeader -u $JIRAUSERNAME:$JIRAPASS -d $jiraTransitionDataIssue"
                    }
                }
                catch (FlowInterruptedException err) {
                    timeOutRaised = true
                }
                catch (Exception e) {
                    echo "Caught: " + e
                    currentBuild.result = "UNSTABLE"
                    withCredentials([string(credentialsId: 'ms_teams_DAD20_channel_team', variable: 'MSTEAMS_CREDENTIALS')]) {
                        office365ConnectorSend(
                                message: "CI unstable due to issues while Exporting test results for BUILD_URL: " + '</BR>' + BUILD_URL,
                                webhookUrl: MSTEAMS_CREDENTIALS,
                                color: '#FFA500'
                        )
                    }

                }
            }
        }
    }
    catch (Exception err) {
        timeOutRaised = true
    }
    finally {
        stage("Sending Notifications") {
            try {
                def sendNotifications = load("jenkinsfiles/utils/sendNotifications.groovy")
                if (timeOutRaised) {
                    sendNotifications.sendEmailTimeout(emailAddress, 'Test Report: Asset Trafficker API execution timeout !')
                } else {
                    String[] fileContents = [readFile('target/cucumber-report.json')]
                    sendNotifications.sendEmailWithSubject(reportAnalyzer, emailAddress, fileContents, 'Test execution report Asset Trafficker', true)
                }
            }
            catch (FlowInterruptedException err) {
                timeOutRaised = true
            }
            catch (Exception e) {
                echo "Caught: " + e
                currentBuild.result = "UNSTABLE"
                withCredentials([string(credentialsId: 'ms_teams_DAD20_channel_team', variable: 'MSTEAMS_CREDENTIALS')]) {
                    office365ConnectorSend(message: "CI unstable for BUILD_URL: " + '</BR>' + BUILD_URL,
                            webhookUrl: MSTEAMS_CREDENTIALS,
                            color: '#FFA500')
                }
            }
        }
    }
}