package com.adidas.db.repository;

import com.adidas.db.entity.MarvinClientArticles;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MarvinClientArticlesRepository extends JpaRepository<MarvinClientArticles, Long> {

    @Query(value = "SELECT TOP (:limit) * FROM MarvinClientArticles mca WHERE mca.ClientId = :rangeId", nativeQuery = true)
    List<MarvinClientArticles> findArticlesByLimitAndRange(
            @Param("limit") Integer limit,
            @Param("rangeId") Integer rangeId
    );

    @Query(value = "SELECT * FROM MarvinClientArticles mca WHERE mca.ArticleNumber = :articleNumber", nativeQuery = true)
    List<MarvinClientArticles> findArticlesByArticleNumber(
            @Param("articleNumber") String articleNumber
    );

    @Query(value = "SELECT * FROM MarvinClientArticles mca WHERE mca.ArticleNumber = :articleNumber and mca.ClientId = :rangeId", nativeQuery = true)
    MarvinClientArticles findArticlesByArticleNumberAndRange(
            @Param("articleNumber") String articleNumber,
            @Param("rangeId") Integer rangeId
    );

    @Query(value = "SELECT COUNT(*) FROM MarvinClientArticles mca WHERE mca.ClientId = :rangeId", nativeQuery = true)
    int findTotalArticlesCount(
            @Param("rangeId") Integer rangeId
    );

    @Query(value = "SELECT TOP (:limit) * FROM MarvinClientArticles mca WHERE mca.ClientId = :rangeId ORDER BY mca.ArticleNumber", nativeQuery = true)
    List<MarvinClientArticles> findArticlesByLimitAndRangeOrderByArticleNumber(
            @Param("limit") Integer limit,
            @Param("rangeId") Integer rangeId
    );

    @Query(value = "SELECT TOP (:limit) * FROM MarvinClientArticles mca WHERE mca.ClientId = :rangeId ORDER BY mca.Dirty", nativeQuery = true)
    List<MarvinClientArticles> findArticlesByLimitAndRangeOrderByDirty(
            @Param("limit") Integer limit,
            @Param("rangeId") Integer rangeId
    );

    @Query(value = "SELECT * FROM MarvinClientArticles mca WHERE mca.ClientId = :rangeId order by mca.id  OFFSET :skip ROWS", nativeQuery = true)
    List<MarvinClientArticles> findSkippedArticlesBySkipAndRange(
            @Param("skip") Integer skip,
            @Param("rangeId") Integer rangeId
    );

    @Query(value = "SELECT *  FROM MarvinClientArticles mca WHERE mca.ClientId = :rangeId order by articleNumber asc", nativeQuery = true)
    List<MarvinClientArticles> findArticlesByOrderInArticleNumberAsc(
            @Param("rangeId") Integer rangeId
    );

    @Query(value = "SELECT *  FROM MarvinClientArticles mca WHERE mca.ClientId = :rangeId order by articleNumber desc", nativeQuery = true)
    List<MarvinClientArticles> findArticlesByOrderInArticleNumberDesc(
            @Param("rangeId") Integer rangeId
    );

    @Query(value = "SELECT *  FROM MarvinClientArticles mca WHERE mca.ClientId = :rangeId order by Dirty asc", nativeQuery = true)
    List<MarvinClientArticles> findArticlesByOrderInDirtyAsc(
            @Param("rangeId") Integer rangeId
    );

    @Query(value = "SELECT *  FROM MarvinClientArticles mca WHERE mca.ClientId = :rangeId order by Dirty desc", nativeQuery = true)
    List<MarvinClientArticles> findArticlesByOrderInDirtyDesc(
            @Param("rangeId") Integer rangeId
    );

    @Query(value = "SELECT *  FROM MarvinClientArticles mca WHERE mca.ClientId = :rangeId order by highPriority asc", nativeQuery = true)
    List<MarvinClientArticles> findArticlesByOrderInHighPriorityAsc(
            @Param("rangeId") Integer rangeId
    );

    @Query(value = "SELECT *  FROM MarvinClientArticles mca WHERE mca.ClientId = :rangeId order by highPriority desc", nativeQuery = true)
    List<MarvinClientArticles> findArticlesByOrderInHighPriorityDesc(
            @Param("rangeId") Integer rangeId
    );

    @Query(value = "SELECT *  FROM MarvinClientArticles mca WHERE mca.ClientId = :rangeId order by mca.IsPublic asc", nativeQuery = true)
    List<MarvinClientArticles> findArticlesByOrderInPublicAsc(
            @Param("rangeId") Integer rangeId
    );

    @Query(value = "SELECT *  FROM MarvinClientArticles mca WHERE mca.ClientId = :rangeId order by mca.IsPublic desc", nativeQuery = true)
    List<MarvinClientArticles> findArticlesByOrderInPublicDesc(
            @Param("rangeId") Integer rangeId
    );

    @Query(value = "SELECT *  FROM MarvinClientArticles mca WHERE mca.ClientId = :rangeId order by mca.LaunchDateUtc asc", nativeQuery = true)
    List<MarvinClientArticles> findArticlesByOrderInLaunchUtcAsc(
            @Param("rangeId") Integer rangeId
    );

    @Query(value = "SELECT *  FROM MarvinClientArticles mca WHERE mca.ClientId = :rangeId order by mca.LaunchDateUtc desc", nativeQuery = true)
    List<MarvinClientArticles> findArticlesByOrderInLaunchUtcDesc(
            @Param("rangeId") Integer rangeId
    );

    @Query(value = "SELECT *  FROM MarvinClientArticles mca WHERE mca.ClientId = :rangeId order by mca.IsManualMode asc", nativeQuery = true)
    List<MarvinClientArticles> findArticlesByOrderInManualModeAsc(
            @Param("rangeId") Integer rangeId
    );

    @Query(value = "SELECT *  FROM MarvinClientArticles mca WHERE mca.ClientId = :rangeId order by mca.IsManualMode desc", nativeQuery = true)
    List<MarvinClientArticles> findArticlesByOrderInManualModeDesc(
            @Param("rangeId") Integer rangeId
    );
}
