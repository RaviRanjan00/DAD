package com.adidas.pojos.get;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@JsonIgnoreProperties(ignoreUnknown = true)
@Getter @Setter
public class Metadata {

    private String id;
    private String assetName;
    private String assetCategory;
    private String imageStyle;
    private String productView;
    private String[] usage;
    private String status;
    private LocalDateTime latestFileUpdated;
    private boolean confidential;
    private String vendor;
}
