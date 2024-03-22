package com.adidas.pojos.token;

import com.fasterxml.jackson.annotation.JsonGetter;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class TokenRoot {

    @JsonProperty("token_type")
    public String token_type;

    @JsonProperty("scope")
    public String scope;

    @JsonProperty("expires_in")
    public int expires_in;

    @JsonProperty("ext_expires_in")
    public int ext_expires_in;

    @JsonProperty("access_token")
    public String access_token;

    @JsonGetter
    public String token_type() {
        return token_type;
    }

    @JsonGetter
    public String scope() {
        return scope;
    }

    @JsonGetter
    public int expires_in() {
        return expires_in;
    }

    @JsonGetter
    public int ext_expires_in() {
        return ext_expires_in;
    }

    @JsonGetter
    public String access_token() {
        return access_token;
    }
}
