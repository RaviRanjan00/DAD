#!groovy

// Jenkins config ---------------------------------------------------{
final def testNode = "${env.NODE}" //DO NOT MODIFY

@Library(["GlobalJenkinsLibrary@master", "TaaSWrapper@2.0.0"]) _

//Pipeline
node(testNode) {
    try {
        currentBuild.result = "SUCCESS"

        stage("Pulling Automation Code") {
            checkout scm
        }

        stage("Checking Code Quality") {
            withSonarQubeEnv('PROD') {
                tools.maven.run(
                        goal: "clean sonar:sonar -Dsonar.branch='${env.BRANCH_NAME}'"
                )
            }
        }

    } catch (error) {
        echo "Caught: ${error}"
        currentBuild.result = "FAILURE"
    }
}