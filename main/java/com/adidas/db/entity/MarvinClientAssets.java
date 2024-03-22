package com.adidas.db.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;


@Table(name = "MarvinClientAssets")
@Data
@Entity
public class MarvinClientAssets {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long Id;
    private Long ArticleId;
    private String AssetId;
    private LocalDateTime AssetMetadataUpdatedOnUtc;
    private LocalDateTime AssetModifiedOnUtc;
    private LocalDateTime CreatedOnUtc;
    private int Exists;
    private String SessionId;
    private int IsPublic;
    private LocalDateTime ImageLaunchDate;
    private LocalDateTime ImageExpiryDate;
    private String Metadata;
    private String AssetCategory;
    private String ImageStyle;
    private String ProductDivision;
    private String ProductView;

}
