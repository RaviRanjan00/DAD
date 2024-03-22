package com.adidas.exceptions;

public class MissedPropertyFileException extends RuntimeException {

    public MissedPropertyFileException(String message, Throwable cause) {
        super(message, cause);
    }

    public MissedPropertyFileException(String message) {
        super(message);
    }
}
