package com.adidas.serenityDefinitions.accessprivate;

import com.adidas.cucumberSteps.accessprivate.PostAccessPrivateSteps;
import com.adidas.cucumberSteps.common.CommonSteps;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import lombok.extern.slf4j.Slf4j;
import net.thucydides.core.annotations.Steps;

@Slf4j
public class PostAccessPrivateDefinitions {

    @Steps
    PostAccessPrivateSteps postAccessPrivateSteps;
    @Steps
    CommonSteps commonSteps;

    @When("I use this {int} to send POST Access Private request")
    public void iUseThisRangeToSendPostAccessPrivateRequest(int range) {
        postAccessPrivateSteps.sendPostAccessPrivateRequest(range);
    }

    @Then("I Validate POST Access Private Response body for {string} user and {int} range")
    public void iValidatePOSTAccessPrivateResponseBodyForUserAndRangeRange(String userType, int range) {
        postAccessPrivateSteps.validateResponseBody(userType, String.valueOf(range));
    }

    @Then("I Validate POST Access Private Response by json schema")
    public void validateResponse() {
        commonSteps.validateResponseByJsonSchema("schemavalidators/AccessPrivateSchema.json");
    }
}
