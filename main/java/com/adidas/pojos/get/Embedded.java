package com.adidas.pojos.get;

import com.fasterxml.jackson.annotation.JsonGetter;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.ArrayList;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Embedded {

    @JsonProperty("articles")
    private ArrayList<Article> articles;

    @JsonProperty("deliveries")
    private ArrayList<Deliveries> deliveries;

    @JsonProperty("metadata")
    private ArrayList<Metadata> metadata;

    @JsonGetter
    public ArrayList<Deliveries> deliveries() {
        return deliveries;
    }

    @JsonGetter
    public ArrayList<Article> articles() {
        return articles;
    }

    @JsonGetter
    public ArrayList<Metadata> metadata() {
        return metadata;
    }
}