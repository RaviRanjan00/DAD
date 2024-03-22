package com.adidas.pojos.post;

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

    @JsonProperty("manualMode")
    private boolean manualMode;

    @JsonProperty("manualModeUser")
    private String manualModeUser;

    @JsonProperty("manualModeState")
    private String manualModeState;

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
    public boolean ispPublic() {
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
    public boolean manualMode() {
        return manualMode;
    }

    @JsonGetter
    public String manualModeUser() {
        return manualModeUser;
    }

    @JsonGetter
    public String manualModeState() {
        return manualModeState;
    }
}
