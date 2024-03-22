package com.adidas.restAssured.api;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.restassured.response.Response;
import io.restassured.response.ValidatableResponse;
import io.restassured.specification.RequestSpecification;
import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import net.serenitybdd.core.Serenity;

import java.util.Map;

import static io.restassured.RestAssured.given;

@UtilityClass
@Slf4j
public class RequestUtils {
    private ValidatableResponse response;

    public ValidatableResponse getResponse() {
        return response;
    }

    public void get(RequestSpecification spec, String endpoint) {
        log.info("Sending GET request to endpoint {}", endpoint);
        response = given()
                .spec(spec)
                .relaxedHTTPSValidation()
                .when()
                .get(endpoint)
                .then()
                .log()
                .ifError();
        Response res = response.extract().response();
        logRequestAndResponse("GET", endpoint, spec, null, res);
    }

    public void get(RequestSpecification spec, String endpoint, Map<String, String> params) {
        log.info("Sending GET request to endpoint {}", endpoint);
        response = given()
                .spec(spec)
                .params(params)
                .relaxedHTTPSValidation()
                .when()
                .get(endpoint)
                .then()
                .log()
                .ifError();
        Response res = response.extract().response();
        logRequestAndResponse("GET", endpoint, spec, null, res);
    }

    public void post(RequestSpecification spec, String endpoint) {
        log.info("Sending POST request to endpoint {}", endpoint);
        response = given()
                .spec(spec)
                .relaxedHTTPSValidation()
                .when()
                .post(endpoint)
                .then()
                .log()
                .ifError();
        Response res = response.extract().response();
        logRequestAndResponse("POST", endpoint, spec, null, res);
    }

    public void post(RequestSpecification spec, String endpoint, Map<String, String> params) {
        log.info("Sending POST request with params {} to endpoint {}", params, endpoint);
        response = given()
                .spec(spec)
                .params(params)
                .relaxedHTTPSValidation()
                .when()
                .post(endpoint)
                .then()
                .log()
                .ifError();
        Response res = response.extract().response();
        logRequestAndResponse("POST", endpoint, spec, null, res);
    }

    public void put(RequestSpecification spec, String endpoint, Object body) {
        log.info("Sending PUT request to endpoint {} and body {}", endpoint, body);
        response = given()
                .spec(spec)
                .relaxedHTTPSValidation()
                .body(body)
                .when()
                .put(endpoint)
                .then()
                .log()
                .ifError();
        Response res = response.extract().response();
        logRequestAndResponse("PUT", endpoint, spec, body, res);
    }

    public void patch(RequestSpecification spec, String endpoint, Object body) {
        log.info("Sending PATCH request to endpoint {} and body {}", endpoint, body);
        response = given()
                .spec(spec)
                .relaxedHTTPSValidation()
                .body(body)
                .when()
                .patch(endpoint)
                .then()
                .log()
                .ifError();
        Response res = response.extract().response();
        logRequestAndResponse("PATCH", endpoint, spec, body, res);
    }

    public void delete(RequestSpecification spec, String endpoint) {
        log.info("Sending DELETE request to endpoint {}", endpoint);
        response = given()
                .spec(spec)
                .relaxedHTTPSValidation()
                .when()
                .delete(endpoint)
                .then()
                .log()
                .ifError();
        Response res = response.extract().response();
        logRequestAndResponse("DELETE", endpoint, spec, null, res);
    }

    public void delete(RequestSpecification spec, String endpoint, Object body) {
        log.info("Sending DELETE request to endpoint {}", endpoint);
        response = given()
                .spec(spec)
                .relaxedHTTPSValidation()
                .body(body)
                .when()
                .delete(endpoint)
                .then()
                .log()
                .ifError();
        Response res = response.extract().response();
        logRequestAndResponse("DELETE", endpoint, spec, body, res);
    }

    private void logRequestAndResponse(String method, String endpoint, RequestSpecification spec, Object body, Response response) {
        String contents = String.format("Method: %s\nEndpoint: %s\nRequest Specification: %s\nRequest Body: %s\nResponse: %s\n",
                method,
                endpoint,
                spec.request().toString(),
                (body != null ? getJsonStringByObject(body) : "N/A"),
                response.asPrettyString());
        Serenity.recordReportData().withTitle("API Request and Response").andContents(contents);
    }

    public String getJsonStringByObject(Object o) {
        ObjectMapper objectMapper = new ObjectMapper();
        String requestBody;
        try {
            requestBody = objectMapper.writeValueAsString(o);
        } catch (JsonProcessingException e) {
            log.error(e.getOriginalMessage());
            throw new RuntimeException(e);
        }
        return requestBody;
    }
}
