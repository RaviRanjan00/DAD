package com.adidas.cucumberSteps;

import com.adidas.config.Configuration;
import com.adidas.cucumberSteps.common.CommonSteps;
import com.adidas.cucumberSteps.common.DatabaseSteps;
import com.adidas.dataproviders.specifications.RequestSpecificationProvider;
import com.adidas.db.entity.MarvinClientArticles;
import com.adidas.pojos.put.PutArticlesRoot;
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
public class PutArticlesSteps {

    protected static OpenApiValidationFilter validationFilter;
    protected static PropertiesReader props = Configuration.props;
    private static RequestSpecification spec;

    @Steps
    CommonSteps commonSteps;


    public PutArticlesSteps() {
    }

    @Step
    public void sendPutRequest(int range, DataTable table) {
        String endpoint = Configuration.getEndpointByRange(range);
        RequestSpecification spec = RequestSpecificationProvider.getRequestSpecification("PUT");
        List<Map<String, String>> body = table.asMaps(String.class, String.class);

        Map<String, List<Map<String, String>>> articles;
        String requestBody;

        if (body.get(0).containsKey("articleNumber") && body.get(0).get("articleNumber") != null && body.get(0).get("articleNumber").contains(".txt")) {
            articles = processArticleNumber(body.get(0).get("articleNumber"));
        } else {
            articles = Map.of("articles", body);
        }

        requestBody = RequestUtils.getJsonStringByObject(articles);
        RequestUtils.put(spec, endpoint, requestBody);
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
        PutArticlesRoot responseAsObject = ResponseUtils.getResponseAsObject(PutArticlesRoot.class);
        // TODO: 08.08.23 add some response body validation
    }

    @Step
    public void validateResponseBodyNotNull(){
        PutArticlesRoot responseAsObject = ResponseUtils.getResponseAsObject(PutArticlesRoot.class);

        Assertions.assertThat(responseAsObject.totalCount()).isNotNull();
        if (responseAsObject.totalCount() > 0) {
            for (int i = 0; i < responseAsObject._embedded().articles().size(); i++) {
                Assertions.assertThat(responseAsObject._embedded().articles().get(i).articleNumber()).isNotNull();
                Assertions.assertThat(responseAsObject._embedded().articles().get(i).dirty()).isNotNull();
                Assertions.assertThat(responseAsObject._embedded().articles().get(i).highPriority()).isNotNull();
                Assertions.assertThat(responseAsObject._embedded().articles().get(i).isPublic()).isNotNull();
                Assertions.assertThat(responseAsObject._embedded().articles().get(i).launchUtc()).isNotNull();
                Assertions.assertThat(responseAsObject._embedded().articles().get(i).manualMode()).isNotNull();
            }
        } else {
            log.info("No Article is available");
        }
    }

    @Step
    public void sendPutRequestWithArticleNumber(int range, String articleNumber) {
        String endpoint = Configuration.getEndpointByRange(range);
        RequestSpecification spec = RequestSpecificationProvider.getRequestSpecification("PUT");
        Map<String, Object> body = new HashMap<>();
        List<Map<String, String>> articles = new ArrayList<>();
        Map<String, String> article = new HashMap<>();
        article.put("articleNumber", articleNumber);
        articles.add(article);
        body.put("articles", articles);
        String requestBody = RequestUtils.getJsonStringByObject(body);
        RequestUtils.put(spec, endpoint, requestBody);

    }

    public void sendPutRequestWithIncorrectContentType(int range, DataTable table ) {
        String endpoint = Configuration.getEndpointByRange(range);
        RequestSpecification spec = RequestSpecificationProvider.getRequestSpecificationWithWrongContentType("PUT");
        List<Map<String, String>> body = table.asMaps(String.class, String.class);
        Map<String, List<Map<String, String>>> articles= Map.of("articles", body);
        String requestBody = RequestUtils.getJsonStringByObject(articles);
        RequestUtils.put(spec, endpoint, requestBody);
    }
}