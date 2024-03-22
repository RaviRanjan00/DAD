package com.adidas.cucumberSteps.common;

import com.adidas.config.Configuration;
import com.adidas.dataproviders.specifications.RequestSpecificationProvider;
import com.adidas.pojos.NegativeResponseBody.NegativeResponseBody;
import com.adidas.restAssured.api.RequestUtils;
import com.adidas.restAssured.api.ResponseUtils;
import com.adidas.utils.PropertiesReader;
import com.atlassian.oai.validator.restassured.OpenApiValidationFilter;
import io.restassured.specification.RequestSpecification;
import lombok.extern.slf4j.Slf4j;
import net.thucydides.core.annotations.Step;
import org.assertj.core.api.Assertions;

import java.util.List;

@Slf4j
public class CommonSteps {

    protected static OpenApiValidationFilter validationFilter;
    protected static PropertiesReader props = Configuration.props;
    private RequestSpecification spec;


    public CommonSteps() {
        log.info("Specs are created. Base URL is");
    }


    @Step
    public void validateStatusCode(int expectedStatusCode) {
        log.info("Validating Status Code: Expected status code should be {}", expectedStatusCode);
        int actualStatusCode = ResponseUtils.getStatusCode();
        log.info("Actual status code is {}", actualStatusCode);
        Assertions.assertThat(
                actualStatusCode
        ).isEqualTo(
                expectedStatusCode
        ).withFailMessage("Wrong Response Status Code");
    }

    @Step
    public void validateResponseByJsonSchema(String jsonSchema) {
        ResponseUtils.validateResponseUsingJsonSchema(jsonSchema);
    }

    @Step
    public String getAccessToken(String userType) {
        log.info("Trying to get Access Token");
        RequestSpecification spec = RequestSpecificationProvider.getTokenRequestSpecification(userType);

        RequestUtils.get(spec, "/token");
        String access_token = ResponseUtils.getJsonStringValue("access_token");
        if (access_token == null) {
            log.error("Please check credentials in property files");
            throw new RuntimeException("Please check credentials in property files");
        }
        log.info("Token is - {}", access_token);
        return access_token;
    }

    @Step
    public void sendRequestWithProvidedToken(String requestMethod, int range, String token) {
        String endpoint = Configuration.getEndpointByRange(range);
        RequestSpecification spec = RequestSpecificationProvider.getRequestSpecificationWithoutToken(requestMethod);
        spec.header("Authorization", token);

        switch (requestMethod) {
            case "GET" -> RequestUtils.get(spec, endpoint);
            case "ACCESS_PRIVATE" -> {
                endpoint = Configuration.getAccessPrivateEndpointByRange(range);
                RequestUtils.post(spec, endpoint);
            }
            case "POST" -> RequestUtils.post(spec, endpoint);
            case "DELETE" -> RequestUtils.delete(spec, endpoint);
            default -> throw new RuntimeException("Please provide correct request method");
        }
    }

    @Step
    public void validateNegativeResponseBody(int statusCode) {
        NegativeResponseBody responseAsObject = ResponseUtils.getResponseAsObject(NegativeResponseBody.class);

        switch (statusCode) {
            case 400 -> validateResponse(responseAsObject, 400, "Bad_Request");
            case 404 -> validateResponse(responseAsObject, 404, "Not found", "Not_found");
            case 401 -> validateResponse(responseAsObject, 401, "Unauthorized");
            case 403 -> validateResponse(responseAsObject, 403, "Forbidden");
            case 415 -> validateResponse(responseAsObject, 415, "Unsupported Media Type");
            default -> {
                log.error("Unknown status Code: " + statusCode);
                throw new IllegalArgumentException("Wrong or missed statusCode");
            }
        }
    }

    private void validateResponse(NegativeResponseBody response, int expectedStatusCode, String... expectedTitles) {
        Assertions.assertThat(response.status).isEqualTo(expectedStatusCode).withFailMessage("Response code not matched");
        Assertions.assertThat(List.of(expectedTitles).contains(response.title)).withFailMessage("Response message not matched");
    }

    @Step
    public void sendEndpointAndRequestWithProvidedToken(String requestMethod, String endPoint, String articleNumber, int range, String token) {
        String endpoint = determineEndpoint(endPoint, articleNumber, range);

        RequestSpecification spec = RequestSpecificationProvider.getRequestSpecificationWithoutContentTypeAndToken();
        spec.header("Authorization", token);

        switch (requestMethod) {
            case "GET" -> RequestUtils.get(spec, endpoint);
            case "ACCESS_PRIVATE" -> {
                endpoint = Configuration.getAccessPrivateEndpointByRange(range);
                RequestUtils.post(spec, endpoint);
            }
            case "POST" -> RequestUtils.post(spec, endpoint);
            case "DELETE" -> RequestUtils.delete(spec, endpoint);
            default -> throw new RuntimeException("Please provide correct request method");
        }
    }

    private String determineEndpoint(String endPoint, String articleNumber, int range) {
        switch (endPoint) {
            case "range_articles":
                return Configuration.getEndpointByRange(range);
            case "range_articles_by_article_number_manual_mode":
                return Configuration.getEndpointByRangeAndArticleNumberManualMode(range, articleNumber);
            case "range_articles_by_article_number":
                return Configuration.getEndpointByRangeAndArticleNumber(range, articleNumber);
            case "range_access_private":
                return Configuration.getAccessPrivateEndpointByRange(range);
            default:
                log.error("Unknown endpoint: " + endPoint);
                throw new IllegalArgumentException("Wrong or missed endpoint");
        }
    }

    @Step
    public void sendIncorrectContentTypeForEndpoint(String endPoint, int range, String requestMethod, String articleNumber) {
        String endpoint = determineEndpoint(endPoint, articleNumber, range);
        RequestSpecification spec = RequestSpecificationProvider.getRequestSpecificationWithWrongContentType(requestMethod);
        switch (requestMethod) {
            case "GET" -> RequestUtils.get(spec, endpoint);
            case "POST" -> RequestUtils.post(spec, endpoint);
            case "DELETE" -> RequestUtils.delete(spec, endpoint);
            default -> throw new RuntimeException("Please provide correct request method");
        }
    }
}
