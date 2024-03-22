package com.adidas.pojos.put;

import com.fasterxml.jackson.annotation.JsonGetter;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.Date;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Article {

    @JsonProperty("articleNumber")
    private String articleNumber;

    @JsonProperty("dirty")
    private boolean dirty;

    @JsonProperty("highPriority")
    private boolean highPriority;

    @JsonProperty("public")
    private boolean isPublic;

    @JsonProperty("launchUtc")
    private Date launchUtc;

    @JsonProperty("expiryUtc")
    private Date expiryUtc;

    @JsonProperty("attempt")
    private int attempt;
    @JsonProperty("manualMode")
    private boolean manualMode;
    @JsonProperty("_links")
    private Links _links;
    @JsonProperty("_embedded")
    private Embedded _embedded;

    @JsonGetter
    public String articleNumber() {
        return articleNumber;
    }

    @JsonGetter
    public boolean dirty() {
        return dirty;
    }

    @JsonGetter
    public boolean highPriority() {
        return highPriority;
    }

    @JsonGetter
    public boolean isPublic() {
        return isPublic;
    }

    @JsonGetter
    public Date launchUtc() {
        return launchUtc;
    }

    @JsonGetter
    public Date expiryUtc() {
        return expiryUtc;
    }

    @JsonGetter
    public int attempt() {
        return attempt;
    }

    @JsonGetter
    public boolean manualMode() {
        return manualMode;
    }

    @JsonGetter
    public Links _links() {
        return _links;
    }

    @JsonGetter
    public Embedded _embedded() {
        return _embedded;
    }
}
