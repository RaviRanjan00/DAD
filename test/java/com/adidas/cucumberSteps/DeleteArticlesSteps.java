package com.adidas.cucumberSteps;

import com.adidas.config.Configuration;
import com.adidas.cucumberSteps.common.CommonSteps;
import com.adidas.dataproviders.specifications.RequestSpecificationProvider;
import com.adidas.pojos.delete.DeleteArticlesRoot;
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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
public class DeleteArticlesSteps {

    protected static OpenApiValidationFilter validationFilter;
    protected static PropertiesReader props = Configuration.props;
    private static RequestSpecification spec;

    @Steps
    CommonSteps commonSteps;

    public void sendDeleteRequest(int range, DataTable table) {
        String endpoint = Configuration.getEndpointByRange(range);
        RequestSpecification spec = RequestSpecificationProvider.getRequestSpecification("DELETE");

        List<Map<String, String>> body = table.asMaps(String.class, String.class);
        Map<String, List<Map<String, String>>> articles;

        if (body.get(0).containsKey("articleNumber") && body.get(0).get("articleNumber") != null) {
            articles = processArticleNumber(body.get(0).get("articleNumber"));
        } else {
            articles = Map.of("articles", body);
        }

        String requestBody = RequestUtils.getJsonStringByObject(articles);
        RequestUtils.delete(spec, endpoint, requestBody);
    }

    private Map<String, List<Map<String, String>>> processArticleNumber(String articleNumberPath) {
        if (articleNumberPath.contains(".txt")) {
            List<Map<String, String>> articleNumberList = new ArrayList<>();
            try (InputStream in = this.getClass().getResourceAsStream(articleNumberPath);
                 BufferedReader reader = new BufferedReader(new InputStreamReader(in))) {
                String txtFile;
                while ((txtFile = reader.readLine()) != null) {
                    Map<String, String> articleMap = new HashMap<>();
                    articleMap.put("articleNumber", txtFile);
                    articleNumberList.add(articleMap);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
            return Map.of("articles", articleNumberList);
        } else {
            return Map.of("articles", List.of(Map.of("articleNumber", articleNumberPath)));
        }
    }
    @Step
    public void validateResponseBody() {
        DeleteArticlesRoot responseAsObject = ResponseUtils.getResponseAsObject(DeleteArticlesRoot.class);
        // TODO: 08.08.23 add some response body validation
    }

    @Step
    public void sendDeleteRequestWithArticleNumber(int range, String articleNumber) {
        String endpoint = Configuration.getEndpointByRange(range);
        RequestSpecification spec = RequestSpecificationProvider.getRequestSpecification("PUT");
        Map<String, Object> body = Map.of("articles", List.of(Map.of("articleNumber", articleNumber)));
        String requestBody = RequestUtils.getJsonStringByObject(body);
        RequestUtils.delete(spec, endpoint, requestBody);
    }

    @Step
    public void sendDeleteRequestWithEndpoint(int range, String method, String articleNumber) {
        String endpoint = Configuration.getEndpointByRangeAndArticleNumberManualMode(range, articleNumber);
        RequestSpecification spec = RequestSpecificationProvider.getRequestSpecification(method);
        switch (method) {
            case "GET" -> RequestUtils.get(spec, endpoint);
            case "POST" -> RequestUtils.post(spec, endpoint);
            case "DELETE" -> RequestUtils.delete(spec, endpoint);
            default -> {
                log.error("Unknown method" + method);
                throw new IllegalArgumentException("Wrong/ missed method" + getClass().toString());
            }
        }
    }

    public void sendDeleteRequestWithEndpointAndArticleNumber(int range, String endpoint, String articleNumber) {
        RequestSpecification spec = RequestSpecificationProvider.getRequestSpecificationWithoutContentType();
        RequestUtils.delete(spec, switch (endpoint) {
            case "range_articles" -> Configuration.getEndpointByRange(range);
            case "range_articles_by_article_number" -> Configuration.getEndpointByRangeAndArticleNumber(range, articleNumber);
            case "range_articles_by_article_number_manual_mode" -> Configuration.getEndpointByRangeAndArticleNumberManualMode(range, articleNumber);
            default -> {
                log.error("Unknown endpoint" + endpoint);
                throw new IllegalArgumentException("Wrong/ missed endpoint");
            }
        });
    }

    public void sendRequestWithProvidedToken(String requestMethod, int range, String token, String articleNumber) {
        String endpoint = Configuration.getEndpointByRangeAndArticleNumber(range, articleNumber);
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
    @Step
    public void validateDeleteResponseBodyAgainAfterDeletingOneTime() {
        DeleteArticlesRoot responseAsObject = ResponseUtils.getResponseAsObject(DeleteArticlesRoot.class);
        Assertions.assertThat(responseAsObject.totalCount()).isEqualTo(0).withFailMessage("Response code not matched");
        Assertions.assertThat(responseAsObject._embedded().articles()).isEmpty();

    }

}