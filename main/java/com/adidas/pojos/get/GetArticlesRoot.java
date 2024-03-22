package com.adidas.pojos.get;

import com.fasterxml.jackson.annotation.JsonGetter;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class GetArticlesRoot {

    @JsonProperty("totalCount")
    private int totalCount;

    @JsonProperty("_embedded")
    private Embedded _embedded;

    @JsonGetter
    public int totalCount() {
        return totalCount;
    }

    @JsonGetter
    public Embedded _embedded() {
        return _embedded;
    }
}
