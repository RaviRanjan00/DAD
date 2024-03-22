package com.adidas.cucumberSteps;

import com.adidas.config.Configuration;
import com.adidas.cucumberSteps.common.CommonSteps;
import com.adidas.dataproviders.specifications.RequestSpecificationProvider;
import com.adidas.pojos.get.GetArticlesRoot;
import com.adidas.pojos.post.PostArticleNumberRoot;
import com.adidas.pojos.post.PostArticlesRoot;
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
public class PostArticlesSteps {

    protected static OpenApiValidationFilter validationFilter;
    protected static PropertiesReader props = Configuration.props;
    private static RequestSpecification spec;

    @Steps
    CommonSteps commonSteps;

    public PostArticlesSteps() {
    }

    @Step
    public void sendPostRequest(int range) {
        String endpoint = Configuration.getEndpointByRange(range);
        RequestSpecification spec = RequestSpecificationProvider.getRequestSpecification("POST");
        RequestUtils.post(spec, endpoint);
    }
    @Step
    public void sendPostRequestWithWrongRange(String range) {
        String endpoint = Configuration.getEndpointByWrongRange(range);
        RequestSpecification spec = RequestSpecificationProvider.getRequestSpecification("POST");
        RequestUtils.post(spec, endpoint);
    }

    @Step
    public void sendPostRequestWithParams(int range, DataTable table) {
        String endpoint = Configuration.getEndpointByRange(range);
        RequestSpecification spec = RequestSpecificationProvider.getRequestSpecification("POST");
        List<Map<String, String>> paramsList = table.asMaps(String.class, String.class);
        if (paramsList.get(0).containsKey("$filter") && paramsList.get(0).get("$filter") != null){
            if (paramsList.get(0).get("$filter").contains(".txt")) {
                InputStream in = this.getClass().getResourceAsStream(paramsList.get(0).get("$filter"));
                BufferedReader reader = new BufferedReader(new InputStreamReader(in));
                String txtFile;
                List<String> articles = new ArrayList<>();
                try {
                    while ((txtFile = reader.readLine()) != null) {
                        articles.add(txtFile);
                    }
                    StringBuilder filter = new StringBuilder("(");
                    for (int i = 0; i < articles.size(); i++) {
                        filter.append("articleNumber eq '").append(articles.get(i)).append("'");
                        if (i < articles.size() - 1) {
                            filter.append(" OR ");
                        }
                    }
                    filter.append(")");
                    List<Map<String, String>> newParamsList = new ArrayList<>();
                    HashMap<String, String> fields = new HashMap<>();
                    if (paramsList.get(0).keySet().contains("$top")) {
                        fields.put("$top", paramsList.get(0).get("$top"));
                        newParamsList.add(fields);
                    }
                    fields.put("$filter", filter.toString());
                    newParamsList.add(fields);
                    RequestUtils.post(spec, endpoint, newParamsList.get(0));
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            else{
                RequestUtils.post(spec, endpoint, paramsList.get(0));
            }
        }
        else {
            RequestUtils.post(spec, endpoint, paramsList.get(0));
        }
    }

    @Step
    public void validateResponseNotNullBody() {
        PostArticlesRoot responseAsObject = ResponseUtils.getResponseAsObject(PostArticlesRoot.class);
        Assertions.assertThat(responseAsObject.totalCount()).isNotNull();
        if (responseAsObject.totalCount() > 0) {
            for (int i = 0; i < responseAsObject._embedded().articles().size(); i++) {
                Assertions.assertThat(responseAsObject._embedded().articles().get(i).articleNumber()).isNotNull();
                Assertions.assertThat(responseAsObject._embedded().articles().get(i).dirty()).isNotNull();
                Assertions.assertThat(responseAsObject._embedded().articles().get(i).highPriority()).isNotNull();
                Assertions.assertThat(responseAsObject._embedded().articles().get(i).ispPublic()).isNotNull();
                Assertions.assertThat(responseAsObject._embedded().articles().get(i).launchUtc()).isNotNull();
                Assertions.assertThat(responseAsObject._embedded().articles().get(i).manualMode()).isNotNull();
                if (responseAsObject._embedded().articles().get(i).manualMode() == true) {
                    Assertions.assertThat(responseAsObject._embedded().articles().get(i).manualModeUser()).isNotNull();
                }
            }
        } else {
            log.info("No Article is available");
        }

    }

    @Step
    public void sendPostRequestWithEndpoint(int range, String endpoint, String articleNumber) {
        RequestSpecification spec = RequestSpecificationProvider.getRequestSpecificationForEndpoint("POST", endpoint);
        RequestUtils.post(spec,
                switch (endpoint) {
                    case "range_articles" -> Configuration.getEndpointByRange(range);
                    case "range_articles_by_article_number_manual_mode" ->
                            Configuration.getEndpointByRangeAndArticleNumberManualMode(range, articleNumber);
                    default -> {
                        log.error("Unknown endpoint" + endpoint);
                        throw new IllegalArgumentException("Wrong/ missed endpoint");
                    }
                }
        );
    }

    @Step
    public void sendPostRequestWithParamsAndApiKey(int range, DataTable table) {
        String endpoint = Configuration.getEndpointByRange(range);
        RequestSpecification spec = RequestSpecificationProvider.getRequestSpecificationWithApiKey("POST");
        List<Map<String, String>> paramsList = table.asMaps(String.class, String.class);
        RequestUtils.post(spec, endpoint, paramsList.get(0));
    }

    @Step
    public void sendPostRequestForAccessPrivateWithApiKey(int range) {
        String endpoint = Configuration.getAccessPrivateEndpointByRange(range);
        RequestSpecification spec = RequestSpecificationProvider.getRequestSpecificationWithApiKey("POST");
        RequestUtils.post(spec, endpoint);
    }

    @Step
    public void sendPostRequestWithXApiKeyAndAdidasApiKey(int range, DataTable table, String xApiKey, String adidasApiKey) {
        String endpoint = Configuration.getEndpointByRange(range);
        RequestSpecification spec = RequestSpecificationProvider.getRequestSpecificationWithGivenApiKey("POST", xApiKey, adidasApiKey);
        List<Map<String, String>> paramsList = table.asMaps(String.class, String.class);
        RequestUtils.post(spec, endpoint, paramsList.get(0));
    }

    @Step
    public void sendPostRequestForAccessPrivateWithXApiKeyAndAdidasApiKey(int range, String xApiKey, String adidasApiKey) {
        String endpoint = Configuration.getAccessPrivateEndpointByRange(range);
        RequestSpecification spec = RequestSpecificationProvider.getRequestSpecificationWithGivenApiKey("POST", xApiKey, adidasApiKey);
        RequestUtils.post(spec, endpoint);
    }

    @Step
    public void validateGetResponseBodyFieldsAreNotNull(String fields) {
        GetArticlesRoot responseAsObject = ResponseUtils.getResponseAsObject(GetArticlesRoot.class);
        List<String> myList = new ArrayList<String>(Arrays.asList(fields.split(",")));
        for (int i = 0; i < responseAsObject._embedded().articles().size(); i++) {
            for (String field : myList){
                switch (field) {
                     case "articleNumber":
                          Assertions.assertThat(responseAsObject._embedded().articles().get(i).articleNumber()).isNotNull();
                          break;
                     case "dirty":
                          Assertions.assertThat(responseAsObject._embedded().articles().get(i).dirty()).isNotNull();
                          break;
                     case "highPriority":
                          Assertions.assertThat(responseAsObject._embedded().articles().get(i).highPriority()).isNotNull();
                          break;
                     case "public":
                          Assertions.assertThat(responseAsObject._embedded().articles().get(i).ispPublic()).isNotNull();
                          break;
                     case "launchUtc":
                          Assertions.assertThat(responseAsObject._embedded().articles().get(i).launchUtc()).isNotNull();
                          break;
                     case "manualMode":
                          Assertions.assertThat(responseAsObject._embedded().articles().get(i).manualMode()).isNotNull();
                          break;
                     case "manualModeUser":
                          Assertions.assertThat(responseAsObject._embedded().articles().get(i).manualModeUser()).isNotNull();
                          break;
                     case "manualModeState":
                          Assertions.assertThat(responseAsObject._embedded().articles().get(i).manualModeState()).isNotNull();
                          break;
                     case "deliveries":
                          Assertions.assertThat(responseAsObject._embedded().articles().get(i)._embedded().deliveries()).isNotNull();
                          break;
                     case "metadata":
                          Assertions.assertThat(responseAsObject._embedded().articles().get(i)._embedded().metadata()).isNotNull();
                          break;
                }
            }
        }
    }

    @Step
    public void validateFieldValue(String field, String dirty) {
        GetArticlesRoot responseAsObject = ResponseUtils.getResponseAsObject(GetArticlesRoot.class);
        for (int i = 0; i < responseAsObject._embedded().articles().size(); i++) {
            switch (field.toLowerCase()) {
                case "dirty" -> {
                    Assertions.assertThat(Boolean.valueOf(dirty)).isEqualTo(responseAsObject._embedded().articles().get(i).dirty()).withFailMessage("Dirty Not matched");
                }
                case "highpriority" -> {
                    Assertions.assertThat(Boolean.valueOf(dirty)).isEqualTo(responseAsObject._embedded().articles().get(i).highPriority()).withFailMessage("Dirty Not matched");
                }
                case "public" -> {
                    Assertions.assertThat(Boolean.valueOf(dirty)).isEqualTo(responseAsObject._embedded().articles().get(i).ispPublic()).withFailMessage("Dirty Not matched");
                }
                case "manualmode" -> {
                    Assertions.assertThat(Boolean.valueOf(dirty)).isEqualTo(responseAsObject._embedded().articles().get(i).manualMode()).withFailMessage("Dirty Not matched");
                }
                default -> {
                    log.error("Unknown endpoint" + field);
                    throw new IllegalArgumentException("Wrong/ missed field");
                }
            }
        }
    }

    @Step
    public void sendPostRequestWithIncorrectContentType(int range) {
        String endpoint = Configuration.getEndpointByRange(range);
        RequestSpecification spec = RequestSpecificationProvider.getRequestSpecification("PUT");
        RequestUtils.post(spec, endpoint);
    }

    public static void validatePostResponseBodyFieldsAreNotNull(String fields) {
        PostArticleNumberRoot responseAsObject = ResponseUtils.getResponseAsObject(PostArticleNumberRoot.class);
        List<String> myList = new ArrayList<String>(Arrays.asList(fields.split(",")));
        for (String field : myList){
                switch (field) {
                    case "articleNumber":
                        Assertions.assertThat(responseAsObject.getArticleNumber()).isNotNull();
                        break;
                    case "dirty":
                        Assertions.assertThat(responseAsObject.isDirty()).isNotNull();
                        break;
                    case "highPriority":
                        Assertions.assertThat(responseAsObject.isHighPriority()).isNotNull();
                        break;
                    case "public":
                        Assertions.assertThat(responseAsObject.isPublic()).isNotNull();
                        break;
                    case "launchUtc":
                        Assertions.assertThat(responseAsObject.getLaunchUtc()).isNotNull();
                        break;
                    case "attempt":
                        Assertions.assertThat(responseAsObject.getAttempt()).isNotNull();
                        break;
                    case "manualMode":
                        Assertions.assertThat(responseAsObject.isManualMode()).isNotNull();
                        break;
                    case "manualModeUser":
                        Assertions.assertThat(responseAsObject.getManualModeState()).isNotNull();
                        break;
                    case "manualModeState":
                        Assertions.assertThat(responseAsObject.getManualModeUser()).isNotNull();
                        break;
                    case "deliveries":
                        Assertions.assertThat(responseAsObject.get_embedded().deliveries()).isNotNull();
                        break;
                    case "metadata":
                        Assertions.assertThat(responseAsObject.get_embedded().metadata()).isNotNull();
                        break;
                }
        }
    }
}