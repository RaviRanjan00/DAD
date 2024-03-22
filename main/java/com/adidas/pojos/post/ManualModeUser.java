package com.adidas.pojos.post;

import com.adidas.pojos.get.Deliveries;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;

import java.util.ArrayList;

@JsonIgnoreProperties(ignoreUnknown = true)
@Getter
public class ManualModeUser {

    @JsonProperty("articleNumber")
    private String articleNumber;

    @JsonProperty("dirty")
    private boolean dirty;

    @JsonProperty("manualMode")
    private boolean manualMode;

    @JsonProperty("manualModeUser")
    private String manualModeUser;

    @JsonProperty("manualModeState")
    private String manualModeState;

    @JsonProperty("deliveries")
    private ArrayList<Deliveries> deliveries;

}
