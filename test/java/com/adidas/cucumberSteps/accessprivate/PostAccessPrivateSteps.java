package com.adidas.cucumberSteps.accessprivate;

import com.adidas.config.Configuration;
import com.adidas.cucumberSteps.common.CommonSteps;
import com.adidas.dataproviders.UserDataProvider;
import com.adidas.dataproviders.specifications.RequestSpecificationProvider;
import com.adidas.pojos.accessprivate.AccessPrivate;
import com.adidas.restAssured.api.RequestUtils;
import com.adidas.restAssured.api.ResponseUtils;
import com.adidas.utils.PropertiesReader;
import com.atlassian.oai.validator.restassured.OpenApiValidationFilter;
import io.restassured.specification.RequestSpecification;
import lombok.extern.slf4j.Slf4j;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.annotations.Steps;
import org.assertj.core.api.Assertions;

import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;

@Slf4j
public class PostAccessPrivateSteps {

    protected static OpenApiValidationFilter validationFilter;
    protected static PropertiesReader props = Configuration.props;
    private static RequestSpecification spec;

    @Steps
    CommonSteps commonSteps;

    public PostAccessPrivateSteps() {
    }

    @Step
    public void sendPostAccessPrivateRequest(int range) {
        String endpoint = Configuration.getAccessPrivateEndpointByRange(range);
        RequestSpecification spec = RequestSpecificationProvider.getRequestSpecification("ACCESS_PRIVATE");
        RequestUtils.post(spec, endpoint);
    }

    @Step
    public void validateResponseBody(String userType, String range) {
        AccessPrivate responseAsObject = ResponseUtils.getResponseAsObject(AccessPrivate.class);
        log.info("Validating Access Private Response body {}", responseAsObject.toString());

        long startUtc = LocalDateTime.parse(responseAsObject.getStartUtc(), DateTimeFormatter.ISO_DATE_TIME).toEpochSecond(ZoneOffset.UTC);
        long endUtc = LocalDateTime.parse(responseAsObject.getEndUtc(), DateTimeFormatter.ISO_DATE_TIME).toEpochSecond(ZoneOffset.UTC);
        log.info("Start date is {} end date is {} difference is  {} ", startUtc, endUtc, endUtc - startUtc);
        Assertions.assertThat(endUtc - startUtc).isEqualTo(10860);
        String value = responseAsObject.getValue();
        String source = "Anonymous_" + range + "_assetmanagerpimdev";
        Assertions.assertThat(value).contains(
                "id=" + source,
                "hmac="
        );

    }
}
