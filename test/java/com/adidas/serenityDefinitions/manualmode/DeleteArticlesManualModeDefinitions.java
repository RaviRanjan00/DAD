package com.adidas.serenityDefinitions.manualmode;

import com.adidas.cucumberSteps.manualmode.DeleteArticlesManualModeSteps;
import com.adidas.cucumberSteps.common.CommonSteps;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import lombok.extern.slf4j.Slf4j;
import net.thucydides.core.annotations.Steps;

@Slf4j
public class DeleteArticlesManualModeDefinitions {

    @Steps
    DeleteArticlesManualModeSteps deleteArticlesManualModeSteps;
    @Steps
    CommonSteps commonSteps;

    @When("I use this {int} and this {string} to send DELETE Manual Mode request")
    public void iUseThisRangeAndArticleNumberToSendGetManualModeRequest(int range, String articleNumber) {
        deleteArticlesManualModeSteps.sendDeleteManualModeRequest(range, articleNumber);
    }

    @Then("I Validate DELETE Manual Mode Response body")
    public void iValidateResponseBody() {
        // todo add some validation
    }

    @Then("I Validate DELETE Manual Mode Response by json schema")
    public void validateResponse() {
    }

    @When("I use this {int} and this {string} to send DELETE Manual Mode request with no content type")
    public void iUseThisRangeAndThisToSendDELETEManualModeRequestWithNoContentType(int range, String articleNumber) {
        deleteArticlesManualModeSteps.sendDeleteManualModeRequestWithoutContentType(range, articleNumber);
    }
}
