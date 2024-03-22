package com.adidas.pojos.get;

import com.fasterxml.jackson.annotation.JsonGetter;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Deliveries {
    @JsonProperty("successful")
    private boolean successful;

    @JsonProperty("outputSetId")
    private int outputSetId;

    @JsonProperty("deliveryTaskId")
    private int deliveryTaskId;

    @JsonProperty("marvinAssetId")
    private String marvinAssetId;

    @JsonProperty("marvinEtag")
    private String marvinEtag;

    @JsonProperty("isPublic")
    private boolean isPublic;

    @JsonProperty("resourceType")
    private String resourceType;

    @JsonProperty("available")
    private boolean available;

    @JsonProperty("width")
    private int width;

    @JsonProperty("height")
    private int height;

    @JsonProperty("cldnFileSize")
    private int cldnFileSize;

    @JsonProperty("tags")
    private String[] tags;

    @JsonProperty("publicId")
    private String publicId;

    @JsonProperty("defaultAlias")
    private String defaultAlias;

    @JsonProperty("sourceExtension")
    private String sourceExtension;

    @JsonProperty("src")
    private String src;

    @JsonProperty("srcTemplate")
    private String srcTemplate;

    @JsonProperty("sortOrder")
    private int sortOrder;

    @JsonGetter
    public boolean successful() {
        return successful;
    }

    @JsonGetter
    public int outputSetId() {
        return outputSetId;
    }

    @JsonGetter
    public int deliveryTaskId() {
        return deliveryTaskId;
    }

    @JsonGetter
    public String marvinAssetId() {
        return marvinAssetId;
    }

    @JsonGetter
    public String marvinEtag() {
        return marvinEtag;
    }

    @JsonGetter
    public boolean isPublic() {
        return isPublic;
    }

    @JsonGetter
    public String resourceType() {
        return resourceType;
    }

    @JsonGetter
    public boolean available() {
        return available;
    }

    @JsonGetter
    public int width() {
        return width;
    }

    @JsonGetter
    public int height() {
        return height;
    }

    @JsonGetter
    public int cldnFileSize() {
        return cldnFileSize;
    }

    @JsonGetter
    public String[] tags() {
        return tags;
    }

    @JsonGetter
    public String publicId() {
        return publicId;
    }

    @JsonGetter
    public String defaultAlias() {
        return defaultAlias;
    }

    @JsonGetter
    public String sourceExtension() {
        return sourceExtension;
    }

    @JsonGetter
    public String src() {
        return src;
    }

    @JsonGetter
    public String srcTemplate() {
        return srcTemplate;
    }

    @JsonGetter
    public int sortOrder() {
        return sortOrder;
    }
}
