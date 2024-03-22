package com.adidas.pojos.patch;

import com.fasterxml.jackson.annotation.JsonGetter;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.ArrayList;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Embedded {

    @JsonProperty("deliveries")
    private ArrayList<Object> deliveries;

    @JsonProperty("metadata")
    private ArrayList<Object> metadata;

    @JsonGetter
    public ArrayList<Object> deliveries() {
        return deliveries;
    }

    @JsonGetter
    public ArrayList<Object> metadata() {
        return metadata;
    }
}
