package com.adidas.db.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;


@Table(name = "MarvinClientArticles")
@Data
@Entity
public class MarvinClientArticles {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long Id;
    private String ArticleNumber;
    private int ClientId;
    private LocalDateTime CreatedOnUtc;
    private boolean Dirty;
    private boolean HighPriority;
    private LocalDateTime ModifiedOnUtc;
    private boolean IsPublic;
    private LocalDateTime LaunchDateUtc;
    private LocalDateTime ExpiryDateUtc;
    private long Attempt;
    private LocalDateTime RetryAfterUtc;
    private String Brand;
    private String StatusMessage;
    private String AllAssetIdsHash;
    private boolean IsManualMode;
    private Integer ManualModeState;
    private String ManualModeUser;

}
