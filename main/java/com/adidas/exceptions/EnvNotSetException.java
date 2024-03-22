package com.adidas.exceptions;

public class EnvNotSetException extends RuntimeException {

    public EnvNotSetException(String message) {
        super(message);
    }

    public EnvNotSetException() {
        this("'env' variable not set.");
    }
}
