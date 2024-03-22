package com.adidas.db.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import lombok.Data;

@Table(name = "DeliveryRepresentation")
@Data
@Entity
public class DeliveryRepresentation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long Id;

    private boolean successful;

    private int outputSetId;

    private int deliveryTaskId;

    private String marvinAssetId;

    private String marvinEtag;

    private boolean Public;

    private int resourceType;

    private boolean available;

    private int width;

    private int height;

    private int cldnFileSize;
    private int sortOrder;

    @JsonProperty("tags")
    private String tagsString;

    private String publicId;

    private String defaultAlias;

    private String sourceExtension;

    @JsonProperty("src")
    private String deliveryPath;

}
