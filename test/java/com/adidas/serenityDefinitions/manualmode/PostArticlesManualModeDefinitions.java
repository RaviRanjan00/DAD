package com.adidas.serenityDefinitions.manualmode;

import com.adidas.cucumberSteps.manualmode.PostArticlesManualModeSteps;
import com.adidas.cucumberSteps.common.CommonSteps;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import lombok.extern.slf4j.Slf4j;
import net.thucydides.core.annotations.Steps;

@Slf4j
public class PostArticlesManualModeDefinitions {

    @Steps
    PostArticlesManualModeSteps postArticlesManualModeSteps;
    @Steps
    CommonSteps commonSteps;

    @When("I use this {int} and this {string} to send POST Manual Mode request")
    public void iUseThisRangeAndArticleNumberToSendGetManualModeRequest(int range, String articleNumber) {
        postArticlesManualModeSteps.sendPostManualModeRequest(range, articleNumber);
    }

    @Then("I Validate POST Manual Mode Response body")
    public void iValidateResponseBody() {
        // todo add some validation
    }

    @Then("I Validate POST Manual Mode Response by json schema")
    public void validateResponse() {
    }
}
