package com.adidas.pojos.delete;

import com.fasterxml.jackson.annotation.JsonGetter;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class DeleteArticlesRoot{
    @JsonProperty("totalCount")
    private int totalCount;

    @JsonProperty("_links")
    private Links _links;

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

    @JsonGetter
    public Links _links() {
        return _links;
    }
}
