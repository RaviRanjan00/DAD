#!groovy
import groovy.json.JsonSlurper
import org.jenkinsci.plugins.workflow.steps.FlowInterruptedException

import java.text.SimpleDateFormat

// Jenkins config ---------------------------------------------------{
final def testNode = "ubuntu_java-17_pea-testing" // Do not modify

// GIT config -------------------------------------------------------{
final def gitRepo = "https://bitbucket.tools.3stripes.net/scm/dam/asset-trafficker-api-component-api-tests" //UPDATE ACCORDING TO YOUR NEEDS
//final def gitBranch = "develop" //UPDATE ACCORDING TO YOUR NEEDS

// Test Pipeline config
def projectName = "asset-trafficker-api-component-api-tests" //UPDATE ACCORDING TO YOUR NEEDS

//Report portal parameters
//def rpUrl = "https://testreportingportal.tools.3stripes.net" //DO NOT MODIFY
//def rpCredentials = "test-reporting-portal-pea-test_engineering"//UPDATE ACCORDING TO YOUR NEEDS

String testPlan = "Asset Trafficker * Regression Test - Test Plan" //UPDATE ACCORDING TO YOUR NEEDS
def credentials = "adidas_ci_svc" //UPDATE ACCORDING TO YOUR NEEDS

def cucumberResultsFile = "cucumber-results.json" //DO NOT MODIFY
def cucumberResultsDir = "target/results" //DO NOT MODIFY

def date = new Date()
def sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss")

// JIRA data:
String jiraEnvironment = ""
String jiraSummary = ""
String jiraDescription = ""

String testPlanRegression = "@regression"
String testPlanGetAssets = "@get"
String testPlanDeleteAssets = "@delete"
String testPlanPostAssets = "@post"
String testPlanPutAssets = "@put"
String testPlanPatchAssets = "@patch"
String testPlanAuthentication = "@authentication"
String testPlanAuthorization = "@authorization"
String testPlanAccessPrivate = "@accessprivate"

managedFiles = []

//email
def emailAddress = "ravi.ranjan2@adidas.com;ignacio.fernandezdebobadilla@adidas.com;akshat.srivastava@adidas.com;shreya.singh@adidas.com" //UPDATE ACCORDING TO YOUR NEEDS

final def featuresDir = "src/test/resources/features" //DO NOT MODIFY
String featuresPath = "" //DO NOT MODIFY picked below
final def xrayImportUrl = "https://jira.tools.3stripes.net/rest/raven/1.0/import/execution/cucumber" //DO NOT MODIFY
final def xrayImportHeader = "-H 'Content-Type: application/json' -H 'Cache-Control: no-cache'" //DO NOT MODIFY
final def xrayImportData = "@target/cucumber-report.json" //DO NOT MODIFY
final def xrayImportOutput = "target/xray-response.json" //DO NOT MODIFY

String putData = ""
String jiraTransitionData = ""
String jiraRegressionTags = ""
String testToRun = ""

// Optional to export results to Jira according to execution parameters in Jenkins
boolean exportResults = exportResultsToJira.toBoolean()
boolean timeOutRaised = false

//Sonar information
//final def sonarPropertiesDir = "./sonar-project.properties" //UPDATE ACCORDING TO YOUR NEEDS. If you will not use sonar, write <<final def sonarPropertiesDir = "">>

def reportingPortalReport = "" //DO NOT MODIFY

@Library(["GlobalJenkinsLibrary@master", "TaaSWrapper@master"]) _

//Pipeline
node(testNode) {
    try {
        timeout(time: 50, unit: 'MINUTES') {
            currentBuild.result = "SUCCESS"
            if (env.environment == 'dev') {
                echo "Selected environment is DEV"
                jiraEnvironment = "DEV"

            } else {
                echo "Selected environment is STAGING"
                jiraEnvironment = "STG"
                           }
            switch (env.cucumberTags) {
                case testPlanRegression:
                    testPlan = testPlan.replace("*", "Global")
                    featuresPath = featuresDir
                    jiraRegressionTags = "ATAPI_Regression"
                    break
                case testPlanGetAssets:
                    testPlan = testPlan.replace("*", "Get Assets")
                    featuresPath = featuresDir + "/get"
                    jiraRegressionTags = "ATAPI_Get"
                    break
                case testPlanDeleteAssets:
                    testPlan = testPlan.replace("*", "Delete Assets")
                    featuresPath = featuresDir + "/delete"
                    jiraRegressionTags = "ATAPI_Delete"
                    break
                case testPlanPostAssets:
                    testPlan = testPlan.replace("*", "Post Assets")
                    featuresPath = featuresDir + "/post"
                    jiraRegressionTags = "ATAPI_Post"
                    break
                case testPlanPutAssets:
                    testPlan = testPlan.replace("*", "Put Assets")
                    featuresPath = featuresDir + "/put"
                    jiraRegressionTags = "ATAPI_Put"
                    break
                case testPlanPatchAssets:
                    testPlan = testPlan.replace("*", "Patch Assets")
                    featuresPath = featuresDir + "/patch"
                    jiraRegressionTags = "ATAPI_Patch"
                    break
                case testPlanPatchAssets:
                    testPlan = testPlan.replace("*", "Authenticate Assets")
                    featuresPath = featuresDir + "/auth"
                    jiraRegressionTags = "ATAPI_Auth"
                    break
                case testPlanPatchAssets:
                    testPlan = testPlan.replace("*", "Authorization Assets")
                    featuresPath = featuresDir + "/auth"
                    jiraRegressionTags = "ATAPI_Auth"
                    break
                case testPlanPatchAssets:
                    testPlan = testPlan.replace("*", "AccessPrivate")
                    featuresPath = featuresDir + "/auth"
                    jiraRegressionTags = "ATAPI_Auth"
                    break
                default:
                    testPlan = "Asset Trafficker Regression Global Test - Plan"
                    featuresPath = featuresDir
                    jiraRegressionTags = "ATAPI_Regression"
                    break
            }

            jiraSummary = "Test Execution of: $testPlan on " + sdf.format(date)
            jiraDescription = "Test Execution of $testPlan"
            // Data to edit JIRA test execution ticket
            putData = "{\"fields\": {\"summary\": \"$jiraSummary\",\"description\": \"$jiraDescription\",\"labels\":\
                   [\"PDM-DAD2.0\",\"$jiraRegressionTags\"],\"customfield_11405\":\
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

            stage("Executing Test Plan") {
                currentBuild.description = "<b>Test Plan:</b> ${testPlan}<br/><b>Test Environment:</b> ${env.environment}<br/>"
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
                                -Dcucumber.filter.tags=${env.cucumberTags} \
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
                    currentBuild.result = "FAILURE"
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
                    currentBuild.result = "FAILURE"
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

            stage("Post Test Results") {
                def pros = readFile('target/cucumber-report.json')
                def results = getTestResults(pros)
                if (results.get("failed") == 0) {
                    currentBuild.result = "SUCCESS"
                }
                if (results.get("compromised") > 0) {
                    currentBuild.result = "UNSTABLE"
                }
                if (results.get("failed") > 0) {
                    currentBuild.result = "FAILED"
                }
                echo "[TEST_RESULTS] Tests steps passed, ${results.get("passed")}"
                echo "[TEST_RESULTS] Tests steps compromised, ${results.get("compromised")}"
                echo "[TEST_RESULTS] Tests steps failed, ${results.get("failed")}"

                // Optional send results to jira
                if (exportResults) {
                    echo "Sending results to jira"
                    try {
                        withCredentials([
                                usernamePassword(
                                        credentialsId: 'svc_pdm_jira_credentials',
                                        usernameVariable: 'JIRAUSERNAME',
                                        passwordVariable: 'JIRAPASS'
                                )
                        ])
                        {
                            sh "curl -X POST ${xrayImportUrl} ${xrayImportHeader} -u ${JIRAUSERNAME}:${JIRAPASS} -d ${xrayImportData} -o ${xrayImportOutput}"
                            //Getting created execution key
                        }
                        def props = readJSON file: xrayImportOutput
                        def executionKey = props.testExecIssue.key

                        echo '[Xray] Test Execution will be: ' + executionKey
                        currentBuild.description = currentBuild.description + "<b>Test Execution: <a href='https://jira.tools.3stripes.net/browse/${executionKey}'> ${executionKey} </a></b></br>"

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
                            //Linking Test Plan and Test Execution
                            def url = 'https://jira.tools.3stripes.net/rest/raven/1.0/api/testplan/' + env.testPlanJira + '/testexecution'
                            def data = '@target/data.json'
                            sh "curl -X POST $url $xrayImportHeader -u $JIRAUSERNAME:$JIRAPASS -d $data"
                            //Editing Test Execution attributes example
                            def urlExecution = 'https://jira.tools.3stripes.net/rest/api/2/issue/' + executionKey
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
                        currentBuild.result = "FAILURE"
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
    }
    catch (FlowInterruptedException err) {
        timeOutRaised = true
        currentBuild.result = "FAILURE"
    }
    finally {
        stage("Sending Notifications") {
            try {
                def sendNotifications = load("jenkinsfiles/utils/sendNotifications.groovy")
                if (timeOutRaised) {
                    sendNotifications.sendEmailTimeout(emailAddress, 'Test Report: Asset Trafficker API execution timeout !')
                } else {
                    String[] fileContents = [readFile('target/cucumber-report.json')]
                    sendNotifications.sendEmailWithSubject(reportAnalyzer, emailAddress, fileContents, 'Test execution report Asset Trafficker',exportResults)
                }
            }
            catch (FlowInterruptedException err) {
                timeOutRaised = true
                currentBuild.result = "FAILURE"
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

def getTestResults(json_string) {
    def list = []
    def mjson = (new JsonSlurper()).parseText(json_string)
    for (def itt : mjson) {
        for (def elem : itt.elements) {
            for (def st : elem.steps) {
                list.add(st.result.status)
            }
        }
    }
    def result = [:]
    result.put("passed", list.findAll { it == "passed" }.size())
    result.put("failed", list.findAll { it == "failed" }.size())
    result.put("compromised", list.findAll { it == "compromised" }.size())
    return result
}