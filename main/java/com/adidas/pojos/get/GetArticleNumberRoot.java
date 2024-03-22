package com.adidas.pojos.get;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter @Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class GetArticleNumberRoot {

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

    @JsonProperty("attempt")
    private int attempt;

    @JsonProperty("manualMode")
    private boolean manualMode;

    @JsonProperty("manualModeUser")
    private String manualModeUser;

    @JsonProperty("manualModeState")
    private String manualModeState;

    @JsonProperty("_embedded")
    private Embedded _embedded;
}
