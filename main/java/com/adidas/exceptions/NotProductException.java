package com.adidas.exceptions;

public class NotProductException extends RuntimeException {

    public NotProductException() {
        super();
    }

    public NotProductException(String s) {
        super(s);
    }

    public NotProductException(String message, Throwable cause) {
        super(message, cause);
    }

}