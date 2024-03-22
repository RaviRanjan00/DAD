package com.adidas.serenityDefinitions;

import com.adidas.cucumberSteps.common.CommonSteps;
import com.adidas.cucumberSteps.PostArticlesSteps;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import lombok.extern.slf4j.Slf4j;
import net.thucydides.core.annotations.Steps;

@Slf4j
public class PostArticlesDefinitions {

    @Steps
    PostArticlesSteps postArticlesSteps;
    @Steps
    CommonSteps commonSteps;

    @When("I use this {int} to send POST request")
    public void iUseThisRangeToSendPostRequest(int range) {
        postArticlesSteps.sendPostRequest(range);
    }

    @When("I use this wrong {string} to send POST request")
    public void iUseThisWrongToSendPOSTRequest(String range) {
        postArticlesSteps.sendPostRequestWithWrongRange(range);
    }

    @When("I use this {int} to send POST request with params")
    public void iUseThisRangeToSendPostRequestWithParams(int range, DataTable table) {
        postArticlesSteps.sendPostRequestWithParams(range, table);
    }

    @Then("I Validate POST Response by json schema")
    public void validateResponse() {
        commonSteps.validateResponseByJsonSchema("schemavalidators/PostResponseScema.json");
    }

    @Then("I Validate POST Response body not null")
    public void iValidateResponseBodyNotNull() {
        postArticlesSteps.validateResponseNotNullBody();
        // todo add some validation
    }

    @When("I use this {int} to send POST request for {string} and {string}")
    public void iUseThisRangeToSendPOSTRequestForAnd(int range, String endpoint, String articleNumber) {
        postArticlesSteps.sendPostRequestWithEndpoint(range, endpoint, articleNumber);
    }

    @When("I use this {int} to send POST request with params and API Key")
    public void iUseThisRangeToSendPOSTRequestWithParamsAndAPIKey(int range, DataTable table) {
        postArticlesSteps.sendPostRequestWithParamsAndApiKey(range, table);
    }

    @When("I use this {int} to send POST Access Private request using API Key")
    public void iUseThisRangeToSendPOSTAccessPrivateRequestUsingAPIKey(int range) {
        postArticlesSteps.sendPostRequestForAccessPrivateWithApiKey(range);
    }

    @When("I use this {int} to send POST request with params and API Key {string} & {string}")
    public void iUseThisRangeToSendPOSTRequestWithParamsAndAPIKey(int range, String xApiKey, String adidasApiKey, DataTable table) {
        postArticlesSteps.sendPostRequestWithXApiKeyAndAdidasApiKey(range, table, xApiKey, adidasApiKey);
    }

    @When("I use this {int} to send POST Access Private request using API Key {string} & {string}")
    public void iUseThisRangeToSendPOSTAccessPrivateRequestUsingAPIKey(int range, String xApiKey, String adidasApiKey) {
        postArticlesSteps.sendPostRequestForAccessPrivateWithXApiKeyAndAdidasApiKey(range, xApiKey, adidasApiKey);
    }

    @Then("I Validate Articles Response body having fields {string}")
    public void iValidateArticlesResponseBodyHavingFields(String fields) {
        postArticlesSteps.validateGetResponseBodyFieldsAreNotNull(fields);
    }

    @Then("I validate {string} value in response as {string}")
    public void iValidateValueInResponseAs(String field, String dirty) {
        postArticlesSteps.validateFieldValue(field, dirty);
    }

    @When("I use this {int} to send POST request with Incorrect Content-Type")
    public void iUseThisRangeToSendPOSTRequestWithIncorrectContentType(int range) {
        postArticlesSteps.sendPostRequestWithIncorrectContentType(range);
    }

    @Then("I Validate POST Response by json schema {string}")
    public void validateResponse(String schema) {
        commonSteps.validateResponseByJsonSchema("schemavalidators/" + schema);
    }

    @Then("I Validate POST Response body having fields {string}")
    public void iValidatePOSTResponseBodyHavingFields(String fields) {
        PostArticlesSteps.validatePostResponseBodyFieldsAreNotNull(fields);
    }
}
