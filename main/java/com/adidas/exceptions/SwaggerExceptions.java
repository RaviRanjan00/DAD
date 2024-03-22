package com.adidas.exceptions;

public class SwaggerExceptions extends AssertionError {
    public SwaggerExceptions() {
        super();
    }

    public SwaggerExceptions(String s) {
        super(s);
    }

    public SwaggerExceptions(String message, Throwable cause) {
        super(message, cause);
    }
}