package com.adidas.exceptions;

public class DBConnectionException extends RuntimeException {

    public DBConnectionException(String message, Throwable cause) {
        super(message, cause);
    }

    public DBConnectionException(Throwable cause) {
        this("Can't establish DB connection.", cause);
    }

}
