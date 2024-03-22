package com.adidas.exceptions;

public class NetWorkFailureExceptions extends AssertionError {
    public NetWorkFailureExceptions() {
        super();
    }

    public NetWorkFailureExceptions(String s) {
        super(s);
    }

    public NetWorkFailureExceptions(String message, Throwable cause) {
        super(message, cause);
    }
}