#!groovy

def sendEmailWithSubject(reportAnalyzer, emailAddress, fileContents, subject, exportResults) {
    String fails = ""
    String linkElements = ""

    def reportInfo = reportAnalyzer.recordReportInfo(fileContents)
    Map links
    links = ["SERENITY": BUILD_URL + "Serenity_20BDD_20Report", "CUCUMBER": BUILD_URL + "cucumber-html-reports"]
    if (exportResults){
        links.put("JIRA": meta.constants.JIRA_URL + "/browse/" + env.testPlanJira)
    }

    // if (!sonarPropertiesDir.isEmpty()) links.put("SONAR", meta.constants.SONAR_URL + "/dashboard?id=" + reportAnalyzer.getSonarProject(sonarPropertiesDir) + "%3A" + gitBranch)
    links.each({ link ->
        linkElements += "<a href=\"" + link.value + "\">" + link.key + "</a></BR>"
    })
    fails = reportAnalyzer.failsTable(reportInfo.getFailedTests())
    echo "Fails: '${fails}'"
    String statusCount = reportAnalyzer.getPassedFailedSkipped(reportInfo.getStatusMap())
    emailext body: reportAnalyzer.getMailNotificationBody(linkElements, statusCount, fails),
            subject: subject,
            to: emailAddress,
            mimeType: 'text/html'
    // Set your MS Teams webhook URL as a Text Secret in Jenkins
    withCredentials([string(credentialsId: 'ms_teams_DAD20_channel_team', variable: 'MSTEAMS_CREDENTIALS')]) {
        office365ConnectorSend(message: '**Test Automation job completed.**</BR>'
                + linkElements + '</BR>' + statusCount + '</BR>' + fails + '</BR>',
                webhookUrl: MSTEAMS_CREDENTIALS,
                color: 'good')
    }
}

def sendEmailTimeout(emailAddress, subject) {
    emailext body: "Timeout during TestExecution: \n$BUILD_URL",
            subject: subject,
            to: emailAddress,
            mimeType: 'text/html'
    // Set your MS Teams webhook URL as a Text Secret in Jenkins

    withCredentials([string(credentialsId: 'ms_teams_DAD20_channel_team', variable: 'MSTEAMS_CREDENTIALS')]) {
        office365ConnectorSend(message: 'Test Automation job failed due to Timeout',
                webhookUrl: MSTEAMS_CREDENTIALS,
                color: 'danger')
    }
}

return this

