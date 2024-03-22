package com.adidas.pojos.accessprivate;

import com.fasterxml.jackson.annotation.JsonGetter;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class AccessPrivate {

    @JsonProperty("location")
    public String location;
    @JsonProperty("name")
    public String name;
    @JsonProperty("value")
    public String value;
    @JsonProperty("startUtc")
    public String startUtc;
    @JsonProperty("endUtc")
    public String endUtc;


    @JsonGetter
    public String getLocation() {
        return location;
    }

    @JsonGetter
    public String getName() {
        return name;
    }

    @JsonGetter
    public String getValue() {
        return value;
    }

    @JsonGetter
    public String getStartUtc() {
        return startUtc;
    }

    @JsonGetter
    public String getEndUtc() {
        return endUtc;
    }
}
