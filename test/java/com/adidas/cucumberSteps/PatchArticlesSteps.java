package com.adidas.cucumberSteps;

import com.adidas.config.Configuration;
import com.adidas.cucumberSteps.common.CommonSteps;
import com.adidas.dataproviders.specifications.RequestSpecificationProvider;
import com.adidas.pojos.patch.PatchArticlesRoot;
import com.adidas.restAssured.api.RequestUtils;
import com.adidas.restAssured.api.ResponseUtils;
import com.adidas.utils.PropertiesReader;
import com.atlassian.oai.validator.restassured.OpenApiValidationFilter;
import io.cucumber.datatable.DataTable;
import io.restassured.specification.RequestSpecification;
import lombok.extern.slf4j.Slf4j;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.annotations.Steps;

import java.util.List;
import java.util.Map;

@Slf4j
public class PatchArticlesSteps {

    protected static OpenApiValidationFilter validationFilter;
    protected static PropertiesReader props = Configuration.props;
    private static RequestSpecification spec;

    @Steps
    CommonSteps commonSteps;

    public PatchArticlesSteps() {
    }

    @Step
    public void sendPatchRequest(int range, DataTable table) {
        List<Map<String, String>> body = table.asMaps(String.class, String.class);
        String endpoint = Configuration.getEndpointByRangeAndArticleNumber(range, body.get(0).get("articleNumber"));
        RequestSpecification spec = RequestSpecificationProvider.getRequestSpecification("PATCH");

        String requestBody = RequestUtils.getJsonStringByObject(body.get(0));
        RequestUtils.patch(spec, endpoint, requestBody);
    }

    @Step
    public void validateResponseBody() {
        PatchArticlesRoot responseAsObject = ResponseUtils.getResponseAsObject(PatchArticlesRoot.class);
        // TODO: 08.08.23 add some response body validation
    }

    @Step
    public void sendPatchRequestWithArticleNumber(int range, DataTable table, String articleNumber) {
        List<Map<String, String>> body = table.asMaps(String.class, String.class);
        String endpoint = Configuration.getEndpointByRangeAndArticleNumber(range, articleNumber);
        RequestSpecification spec = RequestSpecificationProvider.getRequestSpecification("PATCH");
        String requestBody = RequestUtils.getJsonStringByObject(body.get(0));
        RequestUtils.patch(spec, endpoint, requestBody);
    }

    @Step
    public void sendPatchRequestWithIncorrectContentType(int range, String articleNumber, DataTable table) {
        List<Map<String, String>> body = table.asMaps(String.class, String.class);
        String endpoint = Configuration.getEndpointByRangeAndArticleNumber(range, articleNumber);
        RequestSpecification spec = RequestSpecificationProvider.getRequestSpecificationWithWrongContentType("PATCH");
        String requestBody = RequestUtils.getJsonStringByObject(body.get(0));
        RequestUtils.patch(spec, endpoint, requestBody);
    }

}