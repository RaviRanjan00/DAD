package com.adidas.db.repository;

import com.adidas.db.entity.DeliveryRepresentation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface DeliveryRepresentationRepository extends JpaRepository<DeliveryRepresentation, Long> {

    @Query(value = "SELECT * FROM DeliveryRepresentation WHERE ArticleId = :articleId and ScopeId = :scope", nativeQuery = true)
    List<DeliveryRepresentation> findDeliveriesByScopeAndArticleId(
            @Param("scope") Integer scope,
            @Param("articleId") long articleId
    );
}
