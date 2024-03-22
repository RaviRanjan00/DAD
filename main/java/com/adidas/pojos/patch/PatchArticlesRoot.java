package com.adidas.pojos.patch;

import com.fasterxml.jackson.annotation.JsonGetter;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.time.LocalDateTime;

@JsonIgnoreProperties(ignoreUnknown = true)
public class PatchArticlesRoot {

    @JsonProperty("articleNumber")
    public String articleNumber;
    @JsonProperty("dirty")
    public boolean dirty;
    @JsonProperty("highPriority")
    public boolean highPriority;
    @JsonProperty("public")
    public boolean isPublic;
    @JsonProperty("launchUtc")
    public LocalDateTime launchUtc;
    @JsonProperty("expiryUtc")
    public LocalDateTime expiryUtc;
    @JsonProperty("attempt")
    public int attempt;
    @JsonProperty("manualMode")
    public boolean manualMode;
    @JsonProperty("_links")
    public Links _links;
    @JsonProperty("_embedded")
    public Embedded _embedded;

    @JsonGetter
    public String articleNumber() {
        return articleNumber;
    }

    @JsonGetter
    public boolean dirty() {
        return dirty;
    }

    @JsonGetter
    public boolean isPublic() {
        return isPublic;
    }

    @JsonGetter
    public LocalDateTime launchUtc() {
        return launchUtc;
    }

    @JsonGetter
    public LocalDateTime expiryUtc() {
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
    public Embedded _embedded() {
        return _embedded;
    }

    @JsonGetter
    public Links _links() {
        return _links;
    }
}
