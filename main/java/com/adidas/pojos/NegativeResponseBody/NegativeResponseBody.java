package com.adidas.pojos.NegativeResponseBody;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@JsonIgnoreProperties(ignoreUnknown = true)
public class NegativeResponseBody {

    @JsonProperty("status")
    public int status;

    @JsonProperty("title")
    public String title;

    @JsonProperty("detail")
    public String detail;
}
