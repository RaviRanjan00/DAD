#!groovy
import groovy.json.JsonSlurper
import org.jenkinsci.plugins.workflow.steps.FlowInterruptedException

import java.text.SimpleDateFormat

// Jenkins config ---------------------------------------------------{
final def testNode = "ubuntu_java-17_pea-testing" // Do not modify

// GIT config ------------------------------------------------------{
final def gitRepo = "https://bitbucket.tools.3stripes.net/scm/dam/asset-trafficker-api-component-api-tests" //UPDATE ACCORDING TO YOUR NEEDS
//final def gitBranch = "develop" //UPDATE ACCORDING TO YOUR NEEDS

// Test Pipeline config
def projectName = "asset-trafficker-api-component-api-tests" //UPDATE ACCORDING TO YOUR NEEDS

//Report portal parameters
//def rpUrl = "https://testreportingportal.tools.3stripes.net" //DO NOT MODIFY
//def rpCredentials = "test-reporting-portal-pea-test_engineering"//UPDATE ACCORDING TO YOUR NEEDS

String testPlan = "Asset Trafficker Smoke Test - Test Plan" //UPDATE ACCORDING TO YOUR NEEDS
def credentials = "adidas_ci_svc" //UPDATE ACCORDING TO YOUR NEEDS

def cucumberResultsFile = "cucumber-results.json" //DO NOT MODIFY
def cucumberResultsDir = "target/results" //DO NOT MODIFY

def date = new Date()
def sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss")

managedFiles = []

//email
def emailAddress = "ravi.ranjan2@adidas.com; mkrtich.stepanyan@externals.adidas.com; ignacio.fernandezdebobadilla@adidas.com;" //UPDATE ACCORDING TO YOUR NEEDS

final def featuresDir = "src/test/resources/features" //DO NOT MODIFY
String featuresPath = "" //DO NOT MODIFY picked below



String testToRun = ""


boolean timeOutRaised = false

//Sonar information
//final def sonarPropertiesDir = "./sonar-project.properties" //UPDATE ACCORDING TO YOUR NEEDS. If you will not use sonar, write <<final def sonarPropertiesDir = "">>

def reportingPortalReport = "" //DO NOT MODIFY

@Library(["GlobalJenkinsLibrary@master", "TaaSWrapper@master"]) _

//Pipeline
node(testNode) {
    try {
        timeout(time: 30, unit: 'MINUTES') {
            currentBuild.result = "SUCCESS"

            featuresPath = featuresDir

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
                                -Dcucumber.filter.tags=@smoke\
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
                    sendNotifications.sendEmailTimeout(emailAddress, 'Smoke Test Report: Asset Trafficker API execution timeout !')
                } else {
                    String[] fileContents = [readFile('target/cucumber-report.json')]
                    sendNotifications.sendEmailWithSubject(reportAnalyzer, emailAddress, fileContents, 'Smoke Test execution report Asset Trafficker',false)
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
