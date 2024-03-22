package com.adidas.service;

import com.adidas.db.entity.DeliveryRepresentation;
import com.adidas.db.entity.MarvinClientArticles;
import com.adidas.db.entity.MarvinClientAssets;
import com.adidas.db.repository.DeliveryRepresentationRepository;
import com.adidas.db.repository.MarvinClientArticlesRepository;
import com.adidas.db.repository.MarvinClientAssetsRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class DbService {

    @Autowired
    private MarvinClientArticlesRepository marvinClientArticlesRepository;

    @Autowired
    private MarvinClientAssetsRepository marvinClientAssetsRepository;

    @Autowired
    private DeliveryRepresentationRepository deliveryRepresentationRepository;


    public List<MarvinClientArticles> findArticlesByLimitAndRange(int limit, int range) {
        log.info("Fetch articles from DB by limit {} and range {}", limit, range);
        return marvinClientArticlesRepository.findArticlesByLimitAndRange(limit, range);
    }

    public List<MarvinClientArticles> findArticlesByArticleNumber(String articleNumber) {
        log.info("Fetch articles from DB by articleNumber {}", articleNumber);
        return marvinClientArticlesRepository.findArticlesByArticleNumber(articleNumber);
    }

    public MarvinClientArticles findArticleByArticleNumberAndRange(String articleNumber, int range) {
        log.info("Fetch article from DB by articleNumber {} and range {}", articleNumber, range);
        return marvinClientArticlesRepository.findArticlesByArticleNumberAndRange(articleNumber, range);
    }

    public List<MarvinClientAssets> findAssetsByLimitAndArticleId(int limit, int articleId) {
        log.info("Fetch articles from DB by limit {} and range {}", limit, articleId);
        return marvinClientAssetsRepository.findAssetsByLimitAndArticleId(limit, articleId);
    }

    public int findTotalArticleCount(int range) {
        log.info("Fetch articles count from DB range {}", range);
        return marvinClientArticlesRepository.findTotalArticlesCount(range);
    }

    public List<MarvinClientArticles> findArticlesByLimitAndRangeOrderByArticleNumber(int limit, int range) {
        log.info("Fetch articles from DB by limit {} and range {}", limit, range);
        return marvinClientArticlesRepository.findArticlesByLimitAndRangeOrderByArticleNumber(limit, range);
    }

    public List<MarvinClientArticles> findArticlesByLimitAndRangeOrderByDirty(int limit, int range) {
        log.info("Fetch articles from DB by limit {} and range {}", limit, range);
        return marvinClientArticlesRepository.findArticlesByLimitAndRangeOrderByDirty(limit, range);
    }

    public List<DeliveryRepresentation> findDeliveriesByScopeAndArticleId(int scope, long articleId) {
        log.info("Fetch articles from DB by limit {} and range {}", scope, articleId);
        return deliveryRepresentationRepository.findDeliveriesByScopeAndArticleId(scope, articleId);
    }

    public List<MarvinClientAssets> findAssetsByArticleId(long articleId) {
        log.info("Fetch articles from DB by limit {} and range {}", articleId);
        return marvinClientAssetsRepository.findAssetsByArticleId(articleId);
    }

    public List<MarvinClientArticles> findSkippedArticlesBySkipAndRange(int skip, int range) {
        log.info("Fetch articles from DB by limit {} and range {}", skip, range);
        return marvinClientArticlesRepository.findSkippedArticlesBySkipAndRange(skip, range);
    }

    public List<MarvinClientArticles> findArticlesByOrderInArticleNumber(int range, String order) {
        log.info("Fetch articles from DB by fields {}, order {} and range {}", range, order);
        if (order.equalsIgnoreCase("asc")) {
            return marvinClientArticlesRepository.findArticlesByOrderInArticleNumberAsc(range);
        } else
            return marvinClientArticlesRepository.findArticlesByOrderInArticleNumberDesc(range);
    }

    public List<MarvinClientArticles> findArticlesByOrderInDirty(int range, String order) {
        log.info("Fetch articles from DB by fields {}, order {} and range {}", range, order);
        if (order.equalsIgnoreCase("asc")) {
            return marvinClientArticlesRepository.findArticlesByOrderInDirtyAsc(range);
        } else
            return marvinClientArticlesRepository.findArticlesByOrderInDirtyDesc(range);
    }

    public List<MarvinClientArticles> findArticlesByOrderInHighPriority(int range, String order) {
        log.info("Fetch articles from DB by fields {}, order {} and range {}", range, order);
        if (order.equalsIgnoreCase("asc")) {
            return marvinClientArticlesRepository.findArticlesByOrderInHighPriorityAsc(range);
        } else
            return marvinClientArticlesRepository.findArticlesByOrderInHighPriorityDesc(range);
    }

    public List<MarvinClientArticles> findArticlesByOrderInPublic(int range, String order) {
        log.info("Fetch articles from DB by fields {}, order {} and range {}", range, order);
        if (order.equalsIgnoreCase("asc")) {
            return marvinClientArticlesRepository.findArticlesByOrderInPublicAsc(range);
        } else
            return marvinClientArticlesRepository.findArticlesByOrderInPublicDesc(range);
    }

    public List<MarvinClientArticles> findArticlesByOrderInLaunchUtc(int range, String order) {
        log.info("Fetch articles from DB by fields {}, order {} and range {}", range, order);
        if (order.equalsIgnoreCase("asc")) {
            return marvinClientArticlesRepository.findArticlesByOrderInLaunchUtcAsc(range);
        } else
            return marvinClientArticlesRepository.findArticlesByOrderInLaunchUtcDesc(range);
    }

    public List<MarvinClientArticles> findArticlesByOrderInManualMode(int range, String order) {
        log.info("Fetch articles from DB by fields {}, order {} and range {}", range, order);
        if (order.equalsIgnoreCase("asc")) {
            return marvinClientArticlesRepository.findArticlesByOrderInManualModeAsc(range);
        } else
            return marvinClientArticlesRepository.findArticlesByOrderInManualModeDesc(range);
    }
}
