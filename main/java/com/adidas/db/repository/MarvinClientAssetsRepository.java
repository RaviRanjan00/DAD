package com.adidas.db.repository;

import com.adidas.db.entity.MarvinClientArticles;
import com.adidas.db.entity.MarvinClientAssets;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface MarvinClientAssetsRepository extends JpaRepository<MarvinClientAssets, Long> {

    @Query(value = "SELECT TOP (:limit) * FROM MarvinClientAssets mca WHERE mca.ArticleId = :articleId", nativeQuery = true)
    List<MarvinClientAssets> findAssetsByLimitAndArticleId(
            @Param("limit") Integer limit,
            @Param("articleId") Integer articleId
    );

    @Query(value = "SELECT * FROM MarvinClientAssets mca WHERE mca.ArticleId = :articleId", nativeQuery = true)
    List<MarvinClientAssets> findAssetsByArticleId(
            @Param("articleId") Long articleId
    );
}
