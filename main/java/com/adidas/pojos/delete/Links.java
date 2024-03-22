package com.adidas.pojos.delete;

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
    public Self getSelf() {
        return self;
    }

    @JsonGetter
    public Edit getEdit() {
        return edit;
    }

    @JsonGetter
    public Delete getDelete() {
        return delete;
    }
}
