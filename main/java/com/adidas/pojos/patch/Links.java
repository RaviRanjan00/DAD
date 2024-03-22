package com.adidas.pojos.patch;

import com.fasterxml.jackson.annotation.JsonGetter;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Links {

    @JsonProperty("self")
    private Self self;

    @JsonProperty("edit")
    private Edit edit;

    @JsonProperty("delete")
    private Delete delete;

    @JsonGetter
    public Self self() {
        return self;
    }

    @JsonGetter
    public Edit edit() {
        return edit;
    }

    @JsonGetter
    public Delete delete() {
        return delete;
    }
}
