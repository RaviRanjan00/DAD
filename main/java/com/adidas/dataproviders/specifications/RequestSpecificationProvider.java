package com.adidas.dataproviders.specifications;

import com.adidas.config.Configuration;
import com.adidas.dataproviders.UserDataProvider;
import com.adidas.dataproviders.model.User;
import com.adidas.utils.CommonUtils;
import com.adidas.utils.PropertiesReader;
import io.restassured.builder.RequestSpecBuilder;
import io.restassured.config.HttpClientConfig;
import io.restassured.config.RestAssuredConfig;
import io.restassured.http.ContentType;
import io.restassured.specification.RequestSpecification;
import net.serenitybdd.core.Serenity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class RequestSpecificationProvider {
    private static final Logger logger = LoggerFactory.getLogger(RequestSpecificationProvider.class);
    protected static PropertiesReader props = Configuration.props;
    private static RequestSpecification spec;

    private final static int DEFAULT_REQUEST_TIMEOUT = 10000;

    public static RequestSpecification getRequestSpecification(String requestMethod) {
        String baseURL = props.getProperty("at_base_url");
        spec = setRequestTimeOut(DEFAULT_REQUEST_TIMEOUT)
                .setBaseUri(baseURL)
                .build();
        spec.header("Authorization", Serenity.getCurrentSession().get("token"));
        requestMethod = requestMethod.toUpperCase();
        switch (requestMethod) {
            case "POST" -> spec.contentType(ContentType.URLENC);
            case "PUT", "PATCH", "DELETE" -> spec.contentType(ContentType.JSON);
            default -> spec.contentType(ContentType.ANY);
        }
        logger.info("Specs for {} method are created. Base URL is {}", requestMethod, baseURL);
        return spec;
    }

    public static RequestSpecification getRequestSpecificationWithoutToken(String requestMethod) {
        String baseURL = props.getProperty("at_base_url");
        spec = setRequestTimeOut(DEFAULT_REQUEST_TIMEOUT)
                .setBaseUri(baseURL)
                .build();
        requestMethod = requestMethod.toUpperCase();
        switch (requestMethod) {
            case "POST" -> spec.contentType(ContentType.URLENC);
            case "PUT", "PATCH" -> spec.contentType(ContentType.JSON);
            case "DELETE" -> {}
            default -> spec.contentType(ContentType.ANY);
        }
        logger.info("Specs for {} method are created. Base URL is {}", requestMethod, baseURL);
        return spec;
    }

    public static RequestSpecification getTokenRequestSpecification(String userType) {
        User user = UserDataProvider.users.get(userType);
        String baseURL = props.getProperty("token_url");
        spec = setRequestTimeOut(DEFAULT_REQUEST_TIMEOUT)
                .setBaseUri(baseURL)
                .setContentType(ContentType.MULTIPART)
                .build();
        spec.multiPart("client_id", props.getProperty("client_id"));
        spec.multiPart("client_secret", props.getProperty("client_secret"));
        spec.multiPart("grant_type", props.getProperty("grant_type"));
        spec.multiPart("scope", props.getProperty("scope"));

        spec.multiPart("username", user.getEmail());
        spec.multiPart("password", CommonUtils.decodeString(user.getPassword()));

        logger.info("Specs are created. Base URL is {}", baseURL);
        return spec;
    }

    private static RequestSpecBuilder setRequestTimeOut(int timeoutMilliseconds) {
        RequestSpecBuilder spec = new RequestSpecBuilder();
        return spec.setConfig(
                RestAssuredConfig
                        .config()
                        .httpClient(
                                HttpClientConfig
                                        .httpClientConfig()
                                        .setParam("http.connection.timeout", timeoutMilliseconds))
        );
    }

    public static RequestSpecification getRequestSpecificationForEndpoint(String requestMethod, String endpoint) {
        String baseURL = props.getProperty("at_base_url");
        spec = setRequestTimeOut(DEFAULT_REQUEST_TIMEOUT)
                .setBaseUri(baseURL)
                .build();
        spec.header("Authorization", Serenity.getCurrentSession().get("token"));
        requestMethod = requestMethod.toUpperCase();
        switch (endpoint) {
            case "range_articles" -> {
                switch (requestMethod) {
                    case "POST" -> spec.contentType(ContentType.URLENC);
                    case "PUT", "PATCH" -> spec.contentType(ContentType.JSON);
                    case "DELETE" -> {}
                    default -> spec.contentType(ContentType.ANY);
                }
            }
            case "range_articles_by_article_number_manual_mode" -> {
                if ("PUT".equals(requestMethod)) {
                    spec.contentType(ContentType.JSON);
                } else {
                    spec.contentType(ContentType.ANY);
                }
            }
        }
        logger.info("Specs for {} method are created. Base URL is {}", requestMethod, baseURL);
        return spec;
    }

    public static RequestSpecification getRequestSpecificationWithApiKey(String requestMethod) {
        String baseURL = props.getProperty("at_apikey_url");
        spec = setRequestTimeOut(DEFAULT_REQUEST_TIMEOUT)
                .setBaseUri(baseURL)
                .build();
        spec.header("x-api-key", props.getProperty("x-api-key"));
        spec.header("Adidas-API-Key", props.getProperty("Adidas-API-Key"));
        requestMethod = requestMethod.toUpperCase();
        if ("POST".equals(requestMethod)) {
            spec.contentType(ContentType.URLENC);
        } else {
            spec.contentType(ContentType.ANY);
        }
        logger.info("Specs for {} method are created. Base URL is {}", requestMethod, baseURL);
        return spec;
    }

    public static RequestSpecification getRequestSpecificationWithGivenApiKey(String requestMethod, String xApiKey, String adidasApiKey) {
        String baseURL = props.getProperty("at_apikey_url");
        spec = setRequestTimeOut(DEFAULT_REQUEST_TIMEOUT)
                .setBaseUri(baseURL)
                .build();
        spec.header("x-api-key", xApiKey);
        spec.header("Adidas-API-Key", adidasApiKey);
        requestMethod = requestMethod.toUpperCase();
        switch (requestMethod) {
            case "POST" -> spec.contentType(ContentType.URLENC);
            default -> spec.contentType(ContentType.ANY);
        }
        logger.info("Specs for {} method are created. Base URL is {}", requestMethod, baseURL);
        return spec;
    }

    public static RequestSpecification getRequestSpecificationWithoutContentType() {
        String baseURL = props.getProperty("at_base_url");
        spec = setRequestTimeOut(DEFAULT_REQUEST_TIMEOUT)
                .setBaseUri(baseURL)
                .build();
        spec.header("Authorization", Serenity.getCurrentSession().get("token"));
        logger.info("Specs for DELETE method are created. Base URL is {}", baseURL);
        return spec;
    }

    public static RequestSpecification getRequestSpecificationWithoutContentTypeAndToken() {
        String baseURL = props.getProperty("at_base_url");
        spec = setRequestTimeOut(DEFAULT_REQUEST_TIMEOUT)
                .setBaseUri(baseURL)
                .build();
        logger.info("Specs for DELETE method are created. Base URL is {}", baseURL);
        return spec;
    }

    public static RequestSpecification getRequestSpecificationWithWrongContentType(String requestMethod) {
        String baseURL = props.getProperty("at_base_url");
        spec = setRequestTimeOut(DEFAULT_REQUEST_TIMEOUT)
                .setBaseUri(baseURL)
                .build();
        spec.header("Authorization", Serenity.getCurrentSession().get("token"));

        if ("GET".equals(requestMethod) || "POST".equals(requestMethod) || "DELETE".equals(requestMethod)
           || "PUT".equals(requestMethod) || "PATCH".equals(requestMethod)) {
            spec.contentType(ContentType.XML);
        } else {
            throw new RuntimeException("No request method contemplated");
        }
        logger.info("Specs for DELETE method are created. Base URL is {}", baseURL);
        return spec;
    }


}
