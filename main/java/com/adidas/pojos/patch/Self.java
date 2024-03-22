package com.adidas.pojos.patch;

import com.fasterxml.jackson.annotation.JsonGetter;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Self {

    @JsonProperty("href")
    private String href;

    @JsonGetter
    public String href() {
        return href;
    }
}
