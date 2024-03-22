package com.adidas.serenityDefinitions;

import com.adidas.cucumberSteps.PatchArticlesSteps;
import com.adidas.cucumberSteps.common.CommonSteps;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import lombok.extern.slf4j.Slf4j;
import net.thucydides.core.annotations.Steps;

@Slf4j
public class PatchArticlesDefinitions {

    @Steps
    CommonSteps commonSteps;
    @Steps
    PatchArticlesSteps patchArticlesSteps;

    @When("I use this {int} to send PATCH request")
    public void iUseThisRangeToSendPatchRequest(int range, DataTable body) {
        patchArticlesSteps.sendPatchRequest(range, body);
    }

    @Then("I Validate PATCH Response by json schema")
    public void iValidatePatchResponseByJsonSchema() {
        commonSteps.validateResponseByJsonSchema("schemavalidators/PatchResponseScema.json");
    }

    @Then("I Validate PATCH Response body")
    public void iValidatePatchResponseBody() {
        patchArticlesSteps.validateResponseBody();
    }

    @When("I use this {int} to send PATCH request with {string}")
    public void iUseThisRangeToSendPATCHRequestWith(int range, String articleNumber, DataTable body) {
        patchArticlesSteps.sendPatchRequestWithArticleNumber(range, body, articleNumber);
    }

    @When("I use this {int} and {string} to send PATCH request with Incorrect Content-Type")
    public void iUseThisRangeAndToSendPATCHRequestWithIncorrectContentType(int range, String articleNumber, DataTable body) {
        patchArticlesSteps.sendPatchRequestWithIncorrectContentType(range, articleNumber, body);
    }
}
