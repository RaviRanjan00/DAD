package com.adidas.cucumberSteps;

import com.adidas.config.Configuration;
import com.adidas.cucumberSteps.common.CommonSteps;
import com.adidas.dataproviders.specifications.RequestSpecificationProvider;
import com.adidas.pojos.get.GetArticleNumberRoot;
import com.adidas.pojos.get.GetArticlesRoot;
import com.adidas.restAssured.api.RequestUtils;
import com.adidas.restAssured.api.ResponseUtils;
import com.adidas.utils.PropertiesReader;
import com.atlassian.oai.validator.restassured.OpenApiValidationFilter;
import io.cucumber.datatable.DataTable;
import io.restassured.specification.RequestSpecification;
import lombok.extern.slf4j.Slf4j;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.annotations.Steps;
import org.assertj.core.api.Assertions;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.*;

@Slf4j
public class GetArticlesSteps {

    protected static OpenApiValidationFilter validationFilter;
    protected static PropertiesReader props = Configuration.props;
    private static RequestSpecification spec;

    @Steps
    CommonSteps commonSteps;

    public GetArticlesSteps() {
    }

    @Step
    public void sendGetRequest(int range) {
        String endpoint = Configuration.getEndpointByRange(range);
        RequestSpecification spec = RequestSpecificationProvider.getRequestSpecification("GET");
        RequestUtils.get(spec, endpoint);
    }

    @Step
    public void sendGetRequestWithParams(int range, DataTable table) {
        List<List<String>> rows = table.asLists(String.class);
        List<Map<String, String>> paramsList = table.asMaps(String.class, String.class);
        String endpoint = Configuration.getEndpointByRange(range);
        RequestSpecification spec = RequestSpecificationProvider.getRequestSpecification("GET");
        RequestUtils.get(spec, endpoint, paramsList.get(0));
    }

    @Step
    public void validateResponseBody() {
        GetArticlesRoot responseAsObject = ResponseUtils.getResponseAsObject(GetArticlesRoot.class);
        // TODO: 08.08.23 add some response body validation
    }

    public void sendGetRequestWithEndpoint(int range, String endpoint, DataTable table) {
        List<Map<String, String>> body = table.asMaps(String.class, String.class);

        for (Map<String, String> row : body) {
            String articleNumber = row.get("articleNumber");

            if (articleNumber != null && articleNumber.contains(".txt")) {
                processArticleNumberFile(range, endpoint, articleNumber, row);
            } else {
                String endpoint_ = Configuration.getEndpointByRangeAndArticleNumber(range, endpoint, articleNumber);
                sendGetRequest(endpoint_, row);
            }
        }
    }

    private void processArticleNumberFile(int range, String endpoint, String articleNumber, Map<String, String> row) {
        try (InputStream in = this.getClass().getResourceAsStream(articleNumber);
             BufferedReader reader = new BufferedReader(new InputStreamReader(in))) {

            String txtFile;
            while ((txtFile = reader.readLine()) != null) {
                String endpoint_ = Configuration.getEndpointByRangeAndArticleNumber(range, endpoint, txtFile);
                sendGetRequest(endpoint_, row);
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void sendGetRequest(String endpoint, Map<String, String> row) {
        RequestSpecification spec = RequestSpecificationProvider.getRequestSpecification("GET");
        RequestUtils.get(spec, endpoint);
        commonSteps.validateStatusCode(Integer.parseInt(row.get("statusCode")));
    }



    @Step
    public void sendGetRequestWithEndpoint(int range, String articleNumber) {
        String endpoint = Configuration.getEndpointByRangeAndArticleNumber(range, articleNumber);
        RequestSpecification spec = RequestSpecificationProvider.getRequestSpecification("GET");
        RequestUtils.get(spec, endpoint);
    }

    @Step
    public void sendGetRequest(int range, String endpoint, String articleNumber) {
        RequestSpecification spec = RequestSpecificationProvider.getRequestSpecification("GET");
        RequestUtils.get(spec, switch (endpoint) {
            case "range_articles" -> Configuration.getEndpointByRange(range);
            case "range_articles_by_article_number" ->
                    Configuration.getEndpointByRangeAndArticleNumber(range, articleNumber);
            case "range_articles_by_article_number_manual_mode" ->
                    Configuration.getEndpointByRangeAndArticleNumberManualMode(range, articleNumber);
            default -> {
                log.error("Unknown endpoint" + endpoint);
                throw new IllegalArgumentException("Wrong/ missed endpoint");
            }
        });
    }

    @Step
    public void sendGetRequestWithApiKey(int range, String endpoint, String articleNumber) {
        RequestSpecification spec = RequestSpecificationProvider.getRequestSpecificationWithApiKey("GET");
        RequestUtils.get(spec, switch (endpoint) {
            case "range_articles" -> Configuration.getEndpointByRange(range);
            case "range_articles_by_article_number" ->
                    Configuration.getEndpointByRangeAndArticleNumber(range, articleNumber);
            case "range_articles_by_article_number_manual_mode" ->
                    Configuration.getEndpointByRangeAndArticleNumberManualMode(range, articleNumber);
            default -> {
                log.error("Unknown endpoint" + endpoint);
                throw new IllegalArgumentException("Wrong/ missed endpoint");
            }
        });
    }

    @Step
    public void sendGetRequestWithXApiKeyAndAdidasApiKey(int range, String endpoint, String articleNumber, String xApiKey, String adidasApiKey) {
        RequestSpecification spec = RequestSpecificationProvider.getRequestSpecificationWithGivenApiKey("GET", xApiKey, adidasApiKey);
        RequestUtils.get(spec, switch (endpoint) {
            case "range_articles" -> Configuration.getEndpointByRange(range);
            case "range_articles_by_article_number" ->
                    Configuration.getEndpointByRangeAndArticleNumber(range, articleNumber);
            case "range_articles_by_article_number_manual_mode" ->
                    Configuration.getEndpointByRangeAndArticleNumberManualMode(range, articleNumber);
            default -> {
                log.error("Unknown endpoint" + endpoint);
                throw new IllegalArgumentException("Wrong/ missed endpoint");
            }
        });
    }

    @Step
    public void sendGetRequestWithParamsForRangeArticlesArticleNumber(int range, String articleNumber, DataTable table) {
        List<Map<String, String>> paramsList = table.asMaps(String.class, String.class);
        String endpoint = Configuration.getEndpointByRangeAndArticleNumber(range, articleNumber);
        RequestSpecification spec = RequestSpecificationProvider.getRequestSpecification("GET");
        RequestUtils.get(spec, endpoint, paramsList.get(0));
    }

    @Step
    public void validateResponseBodyWithFields(String fields) {
        GetArticleNumberRoot responseAsObject = ResponseUtils.getResponseAsObject(GetArticleNumberRoot.class);
        for (String field : Arrays.asList("articleNumber", "dirty", "highPriority", "public", "launchUtc", "attempt", "manualMode", "manualModeUser", "manualModeState", "deliveries", "metadata")) {
            if (fields.contains(field)) {
                switch (field) {
                    case "articleNumber" -> Assertions.assertThat(responseAsObject.getArticleNumber()).isNotNull();
                    case "dirty" -> Assertions.assertThat(responseAsObject.isDirty()).isNotNull();
                    case "highPriority" -> Assertions.assertThat(responseAsObject.isHighPriority()).isNotNull();
                    case "public" -> Assertions.assertThat(responseAsObject.isPublic()).isNotNull();
                    case "launchUtc" -> Assertions.assertThat(responseAsObject.getLaunchUtc()).isNotNull();
                    case "attempt" -> Assertions.assertThat(responseAsObject.getAttempt()).isNotNull();
                    case "manualMode" -> Assertions.assertThat(responseAsObject.isManualMode()).isNotNull();
                    case "manualModeUser" -> Assertions.assertThat(responseAsObject.getManualModeState()).isNotNull();
                    case "manualModeState" -> Assertions.assertThat(responseAsObject.getManualModeUser()).isNotNull();
                    case "deliveries" ->
                            Assertions.assertThat(responseAsObject.get_embedded().deliveries()).isNotNull();
                    case "metadata" -> Assertions.assertThat(responseAsObject.get_embedded().metadata()).isNotNull();
                }
            }
        }
    }

    @Step
    public void sendRequestWithProvidedToken(String requestMethod, int range, String token, String articleNumber) {
        String endpoint = Configuration.getEndpointByRangeAndArticleNumberManualMode(range, articleNumber);
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
            default -> throw new RuntimeException("Please provide correct requst method");
        }
    }
}
