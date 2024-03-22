package com.adidas.restAssured.api;

import com.github.fge.jsonschema.SchemaVersion;
import com.github.fge.jsonschema.cfg.ValidationConfiguration;
import com.github.fge.jsonschema.core.report.ListReportProvider;
import com.github.fge.jsonschema.core.report.LogLevel;
import com.github.fge.jsonschema.main.JsonSchemaFactory;
import io.restassured.builder.ResponseSpecBuilder;
import io.restassured.module.jsv.JsonSchemaValidator;
import io.restassured.response.ValidatableResponse;
import io.restassured.specification.ResponseSpecification;
import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;

import java.util.List;

@UtilityClass
@Slf4j
public class ResponseUtils {

    public ValidatableResponse getResponse() {
        return RequestUtils.getResponse();
    }

    public int getStatusCode() {
        int statusCode = getResponse().extract().statusCode();
        log.info("Extracting STATUS CODE from Response {}", statusCode);
        return statusCode;
    }

    public int getJsonIntegerValue(String jsonPath) {
        int jsonIntegerValue = getResponse().extract().jsonPath().getInt(jsonPath);
        log.info("Extracting Json Integer Value {} by jsonPath {} from Response ", jsonIntegerValue, jsonPath);
        return jsonIntegerValue;
    }

    public String getJsonStringValue(String jsonPath) {
        String jsonStringValue = getResponse().extract().jsonPath().getString(jsonPath);
        log.info("Extracting Json String Value {} by jsonPath {} from Response ", jsonStringValue, jsonPath);
        return jsonStringValue;
    }

    public <T> T getResponseAsObject(Class<T> aClass) {
        log.info("Extracting Response body as class {}", aClass);
        return getResponse().extract().as(aClass);
    }


    public <T> T getObjectFromResponseInJsonPath(Class<T> type, String jsonPath) {
        T objectFromResponse = getResponse().extract().jsonPath().getObject(jsonPath, type);
        log.info("Extracting Object from Response body {} as object {}", objectFromResponse, type);
        return objectFromResponse;
    }

    public <T> T getObjectFromResponse(Class<T> type) {
        T objectFromResponse = getResponse().extract().as(type);
        log.info("Extracting Response as object {}", objectFromResponse);
        return objectFromResponse;
    }

    public <T> List getListOfObjectsFromResponse(Class<T> type, String jsonPath) {
        List<T> listOfObjectFromResponse = getResponse().extract().jsonPath().getList(jsonPath, type);
        log.info("Extracting List of Objects from Response body {} as object {}", listOfObjectFromResponse, type);
        return getResponse().extract().jsonPath().getList(jsonPath, type);
    }

    public String getResponseBodyAsString() {
        String responseBodyAsString = getResponse().extract().asPrettyString();
        log.info("Extracting Response body as String {}", responseBodyAsString);
        return responseBodyAsString;
    }

    public void validateResponseUsingJsonSchema(String schemaPath) {
        log.info("Validating Response using schema {}", schemaPath);
        final JsonSchemaFactory jsonSchemaFactory = JsonSchemaFactory
                .newBuilder()
                .setValidationConfiguration(ValidationConfiguration.newBuilder().setDefaultVersion(SchemaVersion.DRAFTV4).freeze())
                .setReportProvider(new ListReportProvider(LogLevel.ERROR, LogLevel.ERROR))
                .freeze();
        getResponse()
                .spec(getResponseSpecification())
                .assertThat()
                .body(
                        JsonSchemaValidator
                                .matchesJsonSchemaInClasspath(schemaPath)
                                .using(jsonSchemaFactory
                                )
                );
    }

    private ResponseSpecification getResponseSpecification() {
        ResponseSpecBuilder specBuilder = new ResponseSpecBuilder();
        return specBuilder
                .build();
    }
}
