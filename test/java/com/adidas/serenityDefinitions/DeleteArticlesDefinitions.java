package com.adidas.serenityDefinitions;

import com.adidas.cucumberSteps.DeleteArticlesSteps;
import com.adidas.cucumberSteps.common.CommonSteps;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import lombok.extern.slf4j.Slf4j;
import net.thucydides.core.annotations.Steps;

@Slf4j
public class DeleteArticlesDefinitions {

    @Steps
    DeleteArticlesSteps deleteArticlesSteps;
    @Steps
    CommonSteps commonSteps;

    @When("I use this {int} to send DELETE request")
    public void iUseThisRangeToSendDeleteRequest(int range, DataTable body) {
        deleteArticlesSteps.sendDeleteRequest(range, body);
    }

    @Then("I Validate DELETE Response by json schema")
    public void iValidateDELETEResponseByJsonSchema() {
        commonSteps.validateResponseByJsonSchema("schemavalidators/DeleteResponseSchema.json");
    }

    @Then("I Validate DELETE Response body")
    public void iValidateDeleteResponseBody() {
        deleteArticlesSteps.validateResponseBody();
    }

    @When("I use this {int} to send DELETE request {string}")
    public void iUseThisRangeToSendDELETERequest(int range, String articleNumber) {
        deleteArticlesSteps.sendDeleteRequestWithArticleNumber(range, articleNumber);
    }

    @When("I use this {int} to send {string} request for manualMode and {string}")
    public void iUseThisRangeToSendRequestForManualModeAnd(int range, String method, String articleNumber) {
        deleteArticlesSteps.sendDeleteRequestWithEndpoint(range, method, articleNumber);
    }

    @When("I use this {int} to send DELETE request for endpoint {string} and articleNumber {string}")
    public void iUseThisRangeToSendGETRequestForEndpointAndArticleNumber(int range, String endpoint, String articleNumber) {
        deleteArticlesSteps.sendDeleteRequestWithEndpointAndArticleNumber(range, endpoint, articleNumber);
    }

    @When("I send {string} request for {int} range and token {string} with articleNumber {string}")
    public void iSendRequestForRangeAndTokenWithArticleNumber(String requestMethod, int range, String token, String articleNumber) {
        deleteArticlesSteps.sendRequestWithProvidedToken(requestMethod, range, token, articleNumber);
    }

    @Then("I validate DELETE response body again after deleting the articles")
    public void iValidateDELETEResponseBodyAgainAfterDeletingTheArticles() {
        deleteArticlesSteps.validateDeleteResponseBodyAgainAfterDeletingOneTime();
    }
}
