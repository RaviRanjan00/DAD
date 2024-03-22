package com.adidas.serenityDefinitions;

import com.adidas.cucumberSteps.common.CommonSteps;
import com.adidas.cucumberSteps.PutArticlesSteps;
import com.adidas.cucumberSteps.common.DatabaseSteps;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import lombok.extern.slf4j.Slf4j;
import net.thucydides.core.annotations.Steps;

@Slf4j
public class PutArticlesDefinitions {

    @Steps
    PutArticlesSteps putArticlesSteps;
    @Steps
    CommonSteps commonSteps;

    @When("I use this {int} to send PUT request")
    public void iUseThisRangeToSendPutRequest(int range, DataTable body) {
        putArticlesSteps.sendPutRequest(range, body);
    }

    @Then("I Validate PUT Response by json schema")
    public void validateResponse() {
        commonSteps.validateResponseByJsonSchema("schemavalidators/PutResponseScema.json");
    }

    @Then("I Validate PUT Response body")
    public void iValidateResponseBody() {
        putArticlesSteps.validateResponseBody();
    }

    @When("I use this {int} to send PUT request and {string}")
    public void iUseThisRangeToSendPUTRequestAnd(int range, String articleNumber) {
        putArticlesSteps.sendPutRequestWithArticleNumber(range, articleNumber);
    }

    @When("I use this {int} to send PUT request for incorrect content type")
    public void iUseThisRangeToSendPUTRequestForIncorrectContentType(int range, DataTable body) {
        putArticlesSteps.sendPutRequestWithIncorrectContentType(range, body);
    }

    @Then("I Validate PUT Response body not null")
    public void iValidatePUTResponseBodyNotNull() {
        putArticlesSteps.validateResponseBodyNotNull();
    }
}
