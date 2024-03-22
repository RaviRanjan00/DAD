package com.adidas.serenityDefinitions.common;

import com.adidas.cucumberSteps.DeleteArticlesSteps;
import com.adidas.cucumberSteps.PatchArticlesSteps;
import com.adidas.cucumberSteps.PutArticlesSteps;
import com.adidas.cucumberSteps.common.CommonSteps;
import com.adidas.dataproviders.UserDataProvider;
import com.adidas.dataproviders.model.User;
import com.adidas.pojos.get.GetArticlesRoot;
import com.adidas.restAssured.api.ResponseUtils;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import lombok.extern.slf4j.Slf4j;
import net.serenitybdd.core.Serenity;
import net.thucydides.core.annotations.Steps;
import org.assertj.core.api.Assertions;

@Slf4j
public class CommonDefinitions {

    @Steps
    CommonSteps commonSteps;
    @Steps
    PutArticlesSteps putArticlesSteps;
    @Steps
    PatchArticlesSteps patchArticlesSteps;
    @Steps
    DeleteArticlesSteps deleteArticlesSteps;
    String updatedToken;

    @Given("I get access token for {string} user")
    public void i_get_access_token(String userType) {
        User user = UserDataProvider.getUser(userType);
        String accessToken = user.getAccessToken();
        if (accessToken == null) {
            accessToken = commonSteps.getAccessToken(userType);
            user.setAccessToken(accessToken);

        }
        Serenity.setSessionVariable("token").to("Bearer " + accessToken);
        accessToken = commonSteps.getAccessToken(userType);
        Serenity.setSessionVariable("newToken").to("Bearer " + accessToken);

    }

    @Then("I validate status code {int}")
    public void iValidateStatusCodeExpectedStatusCode(int expectedStatusCode) {
        commonSteps.validateStatusCode(expectedStatusCode);
    }

    @When("I send {string} request for {int} range and token {string}")
    public void ISendRequestForRangeAndToken(String requestMethod, int range, String token) {
        commonSteps.sendRequestWithProvidedToken(requestMethod, range, token);
    }

    @Then("change the token {string} data of {string} to {string} data")
    public void changeTheTokenPayloadDataOfToData(String tokenBody, String user1, String user2) {
        String[] firstToken = UserDataProvider.getUser(user1).getAccessToken().split("\\.");
        String[] secondToken = UserDataProvider.getUser(user2).getAccessToken().split("\\.");
        if (tokenBody.equals("payload")) {
            updatedToken = "Bearer " + firstToken[0] + "." + secondToken[1] + "." + firstToken[2];
            Serenity.setSessionVariable("token").to(updatedToken);
        } else if (tokenBody.equals("signature")) {
            updatedToken = "Bearer " + firstToken[0] + "." + firstToken[0] + "." + secondToken[2];
            Serenity.setSessionVariable("token").to(updatedToken);
        } else {
            log.error("incorrect tokenBody selected");
        }

    }

    @And("send {string} request with this {int}")
    public void sendRequestWithThisRange(String requestMethod, int range) {
        commonSteps.sendRequestWithProvidedToken(requestMethod, range, updatedToken);

    }

    @And("I send {string} request with this {int} with updated token")
    public void ISendRequestWithThisRangeWithUpdatedToken(String method, int range, DataTable body) {
        switch (method) {
            case "PUT" -> putArticlesSteps.sendPutRequest(range, body);
            case "PATCH" -> patchArticlesSteps.sendPatchRequest(range, body);
            case "DELETE" -> deleteArticlesSteps.sendDeleteRequest(range, body);
            default -> log.error("incorrect method selected");
        }
    }

    @Then("make some changes in token {string} data of {string} data")
    public void makeSomeChangesInTokenDataOfData(String tokenBody, String user) {
        String[] Token = UserDataProvider.getUser(user).getAccessToken().split("\\.");
        switch (tokenBody) {
            case "payload" -> {
                updatedToken = "Bearer " + Token[0] + "." + Token[1] + "abcde" + "." + Token[2];
                Serenity.setSessionVariable("token").to(updatedToken);
            }
            case "signature" -> {
                updatedToken = "Bearer " + Token[0] + "." + Token[1] + "." + Token[2] + "abcde";
                Serenity.setSessionVariable("token").to(updatedToken);
            }
            case "header" -> {
                updatedToken = "Bearer " + Token[0] + "abcde" + "." + Token[1] + "abcde" + "." + Token[2];
                Serenity.setSessionVariable("token").to(updatedToken);
            }
            default -> log.error("incorrect tokenBody selected");
        }
    }

    @Then("change the token {string} data of old {string} with new {string} user data")
    public void changeTheTokenDataOfOldWithNewUserData(String tokenBody, String olduser, String newuser) {
        String[] firstToken = UserDataProvider.getUser(olduser).getAccessToken().split("\\.");
        String newToken = Serenity.sessionVariableCalled("newToken");
        String[] secondToken = newToken.split("\\.");
        if (tokenBody.equals("payload")) {
            updatedToken = "Bearer " + secondToken[0] + "." + firstToken[1] + "." + secondToken[2];
            Serenity.setSessionVariable("token").to(updatedToken);
        } else if (tokenBody.equals("signature")) {
            updatedToken = "Bearer " + secondToken[0] + "." + secondToken[0] + "." + firstToken[2];
            Serenity.setSessionVariable("token").to(updatedToken);
        } else {
            log.error("incorrect tokenBody selected");
        }
    }

    @Then("I validate Deliveries and Metadata fields are empty in response for articles")
    public void iValidateDeliveriesAndMetadataFieldsAreEmptyInResponseForArticles() {
        GetArticlesRoot responseAsObject = ResponseUtils.getResponseAsObject(GetArticlesRoot.class);
        for (int i = 0; i < responseAsObject._embedded().articles().size(); i++) {
            Assertions.assertThat(responseAsObject._embedded().articles().get(i)._embedded().deliveries()).isEmpty();
            Assertions.assertThat(responseAsObject._embedded().articles().get(i)._embedded().metadata()).isEmpty();
        }
    }

    @Then("I validate the Negative response body for {int}")
    public void iValidateTheNegativeResponseBodyForExpectedStatusCode(int statusCode) {
        commonSteps.validateNegativeResponseBody(statusCode);
    }

    @When("I send {string} request for {string} with {int} and {string} and token {string}")
    public void iSendRequestForWithRangeAndAndToken(String requestMethod, String endpoint, int range, String articleNumber, String token) {
        commonSteps.sendEndpointAndRequestWithProvidedToken(requestMethod, endpoint, articleNumber, range, token);
    }

    @When("I use this {string} and {int} to send {string} request for {string} with incorrect contentType")
    public void iUseThisAndRangeToSendRequestForWithIncorrectContentType(String endpoint, int range, String requestMethod, String articleNumber) {
        commonSteps.sendIncorrectContentTypeForEndpoint(endpoint, range, requestMethod, articleNumber);
    }

    @Then("I Validate Response by json schema {string}")
    public void iValidateResponseByJsonSchema(String schema) {
        commonSteps.validateResponseByJsonSchema("schemavalidators/" + schema);
    }
}
