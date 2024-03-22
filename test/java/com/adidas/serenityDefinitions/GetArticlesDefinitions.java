package com.adidas.serenityDefinitions;

import com.adidas.cucumberSteps.GetArticlesSteps;
import com.adidas.cucumberSteps.common.CommonSteps;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import lombok.extern.slf4j.Slf4j;
import net.thucydides.core.annotations.Steps;

@Slf4j
public class GetArticlesDefinitions {

    @Steps
    GetArticlesSteps getArticlesSteps;
    @Steps
    CommonSteps commonSteps;

    @When("I use this {int} to send GET request")
    public void iUseThisRangeToSendGetRequest(int range) {
        getArticlesSteps.sendGetRequest(range);
    }

    @When("I use this {int} to send GET request with params")
    public void iUseThisRangeToSendGetRequestWithParams(int range, DataTable params) {
        getArticlesSteps.sendGetRequestWithParams(range, params);
    }

    @Then("I Validate GET Response body")
    public void iValidateResponseBody() {
        getArticlesSteps.validateResponseBody();
        // todo add some validation
    }

    @Then("I Validate GET Response by json schema {string}")
    public void validateResponse(String schema) {
        commonSteps.validateResponseByJsonSchema("schemavalidators/" + schema);
    }

    @Then("I use this {int} to send GET request for {string} which are deleted")
    public void iUseThisRangeToSendGETRequestForWhichAreDeleted(int range, String endpoint, DataTable body) {
        getArticlesSteps.sendGetRequestWithEndpoint(range, endpoint, body);
    }

    @When("I use this {int} to send GET request with {string} article number")
    public void iUseThisRangeToSendGetRequestWithArticleNumber(int range, String articleNumber) {
        getArticlesSteps.sendGetRequestWithEndpoint(range, articleNumber);
    }

    @When("I use this {int} to send GET request for endpoint {string} and articleNumber {string}")
    public void iUseThisRangeToSendGETRequestForEndpointAndArticleNumber(int range, String endpoint, String articleNumber) {
        getArticlesSteps.sendGetRequest(range, endpoint, articleNumber);
    }

    @When("I use this {int} to send GET request for {string} and {string} using API Key")
    public void iUseThisRangeToSendGETRequestForAndUsingAPIKey(int range, String endpoint, String articleNumber) {
        getArticlesSteps.sendGetRequestWithApiKey(range, endpoint, articleNumber);
    }

    @When("I use this {int} to send GET request for {string} and {string} using API Key {string} & {string}")
    public void iUseThisRangeToSendGETRequestForAndUsingAPIKey(int range, String endpoint, String articleNumber, String xApiKey, String adidasApiKey) {
        getArticlesSteps.sendGetRequestWithXApiKeyAndAdidasApiKey(range, endpoint, articleNumber, xApiKey, adidasApiKey);
    }

    @When("I use this {int} to send GET request for endpoint and articleNumber {string} with params")
    public void iUseThisRangeToSendGETRequestForEndpointAndArticleNumberWithParams(int range, String articleNumber, DataTable body) {
        getArticlesSteps.sendGetRequestWithParamsForRangeArticlesArticleNumber(range, articleNumber, body);
    }

    @Then("I Validate GET Response body having fields {string}")
    public void iValidateGETResponseBodyHavingFields(String fields) {
        getArticlesSteps.validateResponseBodyWithFields(fields);
    }

    @When("I send {string} request for {int} range and token {string} for manual mode with {string}")
    public void iSendRequestForRangeRangeAndTokenForManualMode(String requestMethod, int range, String token, String articleNumber) {
        getArticlesSteps.sendRequestWithProvidedToken(requestMethod, range,token, articleNumber);
    }
}
