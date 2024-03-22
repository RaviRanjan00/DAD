package com.adidas.serenityDefinitions.common;

import com.adidas.cucumberSteps.common.DatabaseSteps;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.Then;
import net.thucydides.core.annotations.Steps;
import org.springframework.stereotype.Component;

@Component
public class DatabaseDefinitions {
    @Steps
    DatabaseSteps databaseSteps;

    @Then("I validate the data in DB for {int}")
    public void iValidateTheDataInDBForRange(int range) {
        databaseSteps.validateDataWithDb(range);
    }

    @Then("I validate the data in DB for {int} and articleNumbers")
    public void iValidateTheDataInDBForRangeAndArticleNumbers(int range, DataTable body) {
        databaseSteps.validateDataWithDbWithArticleNumber(range, body);

    }
    @Then("I validate the data removed in DB for {int} and {string}")
    public void iValidateTheDataRemovedInDBForRangeAnd(int range, String articleNumber) {
        databaseSteps.validateDataRemovedFromDbWithRangeAndArticleNumber(range, articleNumber);
    }


    @Then("I validate the data in DB for {int} and {string}")
    public void iValidateTheDataInDBForRangeAnd(int range, String articleNumber) {
        databaseSteps.validateDataInDbWithRangeAndArticleNumber(range, articleNumber);
    }

    @Then("I validate {string} field in DB for {int}")
    public void iValidateFieldInDBForRange(String field, int range) {
        databaseSteps.validateFieldsWithDb(range, field);
    }

    @Then("I validate Deliveries and Metadata fields in DB for {int} with {int}")
    public void iValidateDeliveriesAndMetadataFieldsInDBForRangeWithScope(int range, int scope) {
        databaseSteps.validateDeliveriesAndMetaWithDb(range, scope);
    }

    @Then("I validate Deliveries and Metadata fields in DB for {int} with incorrect {int}")
    public void iValidateDeliveriesAndMetadataFieldsInDBForRangeWithIncorrectScope(int range, int scope) {
        databaseSteps.validateDeliveriesAndMetaWithIncorrectScope(range, scope);
    }

    @Then("I validate response body with the data in DB for {int} and {string} of range_articles_by_article_number endpoint")
    public void iValidateResponseBodyWithTheDataInDBForRangeAndOfRange_articles_by_article_numberEndpoint(int range, String articleNumber) {
        databaseSteps.validateDataWithDbForRangeArticlesArticleNumber(range, articleNumber);
    }

    @Then("I validate Deliveries data in response body with the data in DB for {int} and {int}")
    public void iValidateDeliveriesDataInResponseBodyWithTheDataInDBForRangeAndScope(int range, int scope) {
        databaseSteps.validateDeliveriesResponseWithDb(range, scope);

    }

    @Then("I validate Metadata data in response body with the data in DB for {int} and {int}")
    public void iValidateMetadataDataInResponseBodyWithTheDataInDBForRangeAndScope(int range, int scope) {
        databaseSteps.validateMetadataResponseWithDb(range, scope);
    }

    @Then("I validate Articles response body with the data in DB for {int}")
    public void iValidateArticlesResponseBodyWithTheDataInDBForRange(int range) {
        databaseSteps.validateDataWithDbForRangeArticles(range);
    }

    @Then("I Validate skipped {int} Article Numbers in response with DB for {int}")
    public void iValidateSkippedSkipArticleNumbersInResponseWithDBForRange(int skip, int range) {
        databaseSteps.validateSkippedArticleNumberWithDb(skip,range);
    }


    @Then("I validate {string} value in response in {string} order with db for {int}")
    public void iValidateValueInResponseInOrderWithDbForRange(String field, String order, int range) {
        databaseSteps.validateFieldValueInOrder(field, order, range);
    }

    @Then("I Validate Deliveries fields in DB for {int} and {int}")
    public void iValidateDeliveriesFieldsInDBWithRangeAndScope(int range, int scope) {
        databaseSteps.validateDeliveriesResponseWithDbForManualMode(range, scope);
    }

    @Then("I validate the data in DB for {int} with provided data")
    public void iValidateTheDataInDBForRangeWithProvidedData(int range, DataTable body) {
        databaseSteps.validateDataInDbWithProvidedData(range, body);

    }

    @Then("I validate the data in DB for {int} with response body")
    public void iValidateTheDataInDBForRangeWithResponseBody(int range, DataTable body) {
        databaseSteps.validateDataInDbWithResponseBody(range, body);
    }

}
