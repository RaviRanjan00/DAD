package com.adidas.pojos.get;

import com.fasterxml.jackson.annotation.JsonGetter;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.time.LocalDateTime;

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
    private LocalDateTime launchUtc;

    @JsonProperty("manualMode")
    private boolean manualMode;

    @JsonProperty("manualModeUser")
    private String manualModeUser;

    @JsonProperty("manualModeState")
    private String manualModeState;

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
    public boolean ispPublic() {
        return isPublic;
    }

    @JsonGetter
    public LocalDateTime launchUtc() {
        return launchUtc;
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

    @JsonGetter
    public Embedded _embedded() {
        return _embedded;
    }
}
