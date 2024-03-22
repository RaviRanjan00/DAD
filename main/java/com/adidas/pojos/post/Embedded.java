package com.adidas.pojos.post;

import com.fasterxml.jackson.annotation.JsonGetter;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.ArrayList;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Embedded {

    @JsonProperty("articles")
    private ArrayList<Article> articles;

    @JsonGetter
    public ArrayList<Article> articles() {
        return articles;
    }
}