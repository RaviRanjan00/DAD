package com.adidas.serenityDefinitions.manualmode;

import com.adidas.cucumberSteps.manualmode.GetArticlesManualModeSteps;
import com.adidas.cucumberSteps.common.CommonSteps;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import lombok.extern.slf4j.Slf4j;
import net.thucydides.core.annotations.Steps;

@Slf4j
public class GetArticlesManualModeDefinitions {

    @Steps
    GetArticlesManualModeSteps getArticlesManualModeSteps;
    @Steps
    CommonSteps commonSteps;

    @When("I use this {int} and this {string} to send GET Manual Mode request")
    public void iUseThisRangeAndArticleNumberToSendGetManualModeRequest(int range, String articleNumber) {
        getArticlesManualModeSteps.sendGetManualModeRequest(range, articleNumber);
    }

    @Then("I Validate GET Manual Mode Response body")
    public void iValidateResponseBody() {
        // todo add some validation
    }

    @Then("I Validate GET Manual Mode Response by json schema")
    public void validateResponse() {
    }
}
