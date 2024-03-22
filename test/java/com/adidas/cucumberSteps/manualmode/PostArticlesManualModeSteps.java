package com.adidas.cucumberSteps.manualmode;

import com.adidas.config.Configuration;
import com.adidas.cucumberSteps.common.CommonSteps;
import com.adidas.dataproviders.specifications.RequestSpecificationProvider;
import com.adidas.restAssured.api.RequestUtils;
import com.adidas.utils.PropertiesReader;
import com.atlassian.oai.validator.restassured.OpenApiValidationFilter;
import io.restassured.specification.RequestSpecification;
import lombok.extern.slf4j.Slf4j;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.annotations.Steps;

@Slf4j
public class PostArticlesManualModeSteps {

    protected static OpenApiValidationFilter validationFilter;
    protected static PropertiesReader props = Configuration.props;
    private static RequestSpecification spec;

    @Steps
    CommonSteps commonSteps;

    public PostArticlesManualModeSteps() {
    }

    @Step
    public void sendPostManualModeRequest(int range, String articleNumber) {
        String endpoint = Configuration.getEndpointByRangeAndArticleNumberManualMode(range, articleNumber);
        RequestSpecification spec = RequestSpecificationProvider.getRequestSpecification("MANUAL_MODE");
        RequestUtils.post(spec, endpoint);
    }

    @Step
    public void validateResponseBody() {
        // TODO: 08.08.23 add some response body validation
    }
}
