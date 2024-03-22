package com.adidas.pojos.delete;

import com.fasterxml.jackson.annotation.JsonGetter;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Article {
    @JsonProperty("dirty")
    private boolean dirty;
    @JsonProperty("highPriority")
    private boolean highPriority;
    @JsonProperty("launchUtc")
    private String launchUtc;
    @JsonProperty("manualMode")
    private boolean manualMode;
    @JsonProperty("public")
    private boolean isPublic;
    @JsonProperty("articleNumber")
    private String articleNumber;
    @JsonProperty("links")
    private Links links;
    @JsonProperty("_embedded")
    private Embedded _embedded;
    @JsonProperty("attempt")
    private int attempt;

    @JsonGetter
    public boolean isDirty() {
        return dirty;
    }

    @JsonGetter
    public boolean isHighPriority() {
        return highPriority;
    }

    @JsonGetter
    public String getLaunchUtc() {
        return launchUtc;
    }

    @JsonGetter
    public boolean isManualMode() {
        return manualMode;
    }

    @JsonGetter
    public boolean isPublic() {
        return isPublic;
    }

    @JsonGetter
    public String getArticleNumber() {
        return articleNumber;
    }

    @JsonGetter
    public Links getLinks() {
        return links;
    }

    @JsonGetter
    public Embedded getEmbedded() {
        return _embedded;
    }

    @JsonGetter
    public int getAttempt() {
        return attempt;
    }
}
