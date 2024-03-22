package com.adidas.exceptions;

/**
 * Custom class for managing request errors
 */
public class RequestError extends Exception {
    public RequestError() {
        super("There was an error trying to execute the request");
    }

    public RequestError(String additionalInfo) {
        super("There was an error trying to execute the request. " + additionalInfo);
    }
}
