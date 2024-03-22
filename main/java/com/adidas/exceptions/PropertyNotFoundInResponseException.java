package com.adidas.exceptions;

/**
 * Custom class for managing properties not found errors
 */
public class PropertyNotFoundInResponseException extends Exception {
    public PropertyNotFoundInResponseException(String property) {
        super("property " + property + " not found");
    }
}
