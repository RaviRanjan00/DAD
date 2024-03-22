package com.adidas.cucumberSteps.common;

import com.adidas.config.DatabaseConfig;
import com.adidas.cucumberSteps.GetArticlesSteps;
import com.adidas.db.entity.DeliveryRepresentation;
import com.adidas.db.entity.MarvinClientArticles;
import com.adidas.db.entity.MarvinClientAssets;
import com.adidas.pojos.get.*;
import com.adidas.pojos.post.ManualModeUser;
import com.adidas.restAssured.api.ResponseUtils;
import com.adidas.service.DbService;
import io.cucumber.datatable.DataTable;
import lombok.extern.slf4j.Slf4j;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.annotations.Steps;
import org.assertj.core.api.Assertions;

import org.htmlunit.xpath.operations.Bool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Slf4j
@ContextConfiguration(classes = DatabaseConfig.class)
public class DatabaseSteps {

    @Autowired
    private DbService dbService;
    @Steps
    GetArticlesSteps getArticlesSteps;

    @Step
    public void validateDataWithDb(int range) {
        List<MarvinClientArticles> articlesByLimitAndRange = dbService.findArticlesByLimitAndRange(1, range);
        GetArticlesRoot responseAsObject = ResponseUtils.getResponseAsObject(GetArticlesRoot.class);
        Assertions.assertThat(articlesByLimitAndRange.get(0).getArticleNumber()).isEqualTo(responseAsObject._embedded().articles().get(0).articleNumber()).withFailMessage("Article Number Not matched");
        Assertions.assertThat(articlesByLimitAndRange.get(0).isDirty()).isEqualTo(responseAsObject._embedded().articles().get(0).dirty()).withFailMessage("Dirty Not matched");
        Assertions.assertThat(articlesByLimitAndRange.get(0).isHighPriority()).isEqualTo(responseAsObject._embedded().articles().get(0).highPriority()).withFailMessage("High Priority Not matched");
        Assertions.assertThat(articlesByLimitAndRange.get(0).isIsPublic()).isEqualTo(responseAsObject._embedded().articles().get(0).ispPublic()).withFailMessage("Public Not matched");
        Assertions.assertThat(articlesByLimitAndRange.get(0).getLaunchDateUtc()).isEqualTo(responseAsObject._embedded().articles().get(0).launchUtc()).withFailMessage("LaunchUTC Not matched");
        Assertions.assertThat(articlesByLimitAndRange.get(0).isIsManualMode()).isEqualTo(responseAsObject._embedded().articles().get(0).manualMode()).withFailMessage("Manual Mode Not matched");
        if (responseAsObject._embedded().articles().get(0).manualMode() == true) {
            Assertions.assertThat(articlesByLimitAndRange.get(0).getManualModeUser()).isEqualTo(responseAsObject._embedded().articles().get(0).manualModeUser()).withFailMessage("Manual Mode User Not matched");
            if (articlesByLimitAndRange.get(0).getManualModeState() == 0) {
                Assertions.assertThat(responseAsObject._embedded().articles().get(0).manualModeState()).isEqualTo("APPLIED").withFailMessage("Manual Mode State Not matched");
            } else if (articlesByLimitAndRange.get(0).getManualModeState() == 1) {
                Assertions.assertThat(responseAsObject._embedded().articles().get(0).manualModeState()).isEqualTo("OUTDATED").withFailMessage("Manual Mode State Not matched");
            } else if (articlesByLimitAndRange.get(0).getManualModeState() == 2) {
                Assertions.assertThat(responseAsObject._embedded().articles().get(0).manualModeState()).isEqualTo("FALLBACK").withFailMessage("Manual Mode State Not matched");
            } else {
                Assertions.assertThat(responseAsObject._embedded().articles().get(0).manualModeState()).isEqualTo(null).withFailMessage("Manual Mode State Not matched");
            }
        }
    }

    @Step
    public void validateDataWithDbWithArticleNumber(int range, DataTable table) {

        List<Map<String, String>> body = table.asMaps(String.class, String.class);
        for (int i = 0; i < body.size(); i++) {
            MarvinClientArticles articleByArticleNumberAndRange = dbService.findArticleByArticleNumberAndRange(body.get(i).get("articleNumber"), range);
            Assertions.assertThat(articleByArticleNumberAndRange).withFailMessage("Expected Article Number still present with DB").isNull();
        }
    }

    @Step
    public void validateDataRemovedFromDbWithRangeAndArticleNumber(int range, String articleNumber) {
        MarvinClientArticles articleByArticleNumberAndRange = dbService.findArticleByArticleNumberAndRange(articleNumber, range);
        Assertions.assertThat(articleByArticleNumberAndRange).withFailMessage("Expected Article Number still present with DB").isNull();
    }

    @Step
    public void validateDataInDbWithRangeAndArticleNumber(int range, String articleNumber) {
        MarvinClientArticles articleByArticleNumberAndRange = dbService.findArticleByArticleNumberAndRange(articleNumber, range);
        GetArticlesRoot responseAsObject = ResponseUtils.getResponseAsObject(GetArticlesRoot.class);

        Assertions.assertThat(articleByArticleNumberAndRange.getArticleNumber()).isEqualTo(responseAsObject._embedded().articles().get(0).articleNumber()).withFailMessage("Article Number Not matched");
        Assertions.assertThat(articleByArticleNumberAndRange.isDirty()).isEqualTo(responseAsObject._embedded().articles().get(0).dirty()).withFailMessage("Dirty Not matched");
        Assertions.assertThat(articleByArticleNumberAndRange.isHighPriority()).isEqualTo(responseAsObject._embedded().articles().get(0).highPriority()).withFailMessage("High Priority Not matched");
        Assertions.assertThat(articleByArticleNumberAndRange.isIsPublic()).isEqualTo(responseAsObject._embedded().articles().get(0).ispPublic()).withFailMessage("Public Not matched");
        Assertions.assertThat(articleByArticleNumberAndRange.getLaunchDateUtc()).isEqualTo(responseAsObject._embedded().articles().get(0).launchUtc()).withFailMessage("LaunchUTC Not matched");
        Assertions.assertThat(articleByArticleNumberAndRange.isIsManualMode()).isEqualTo(responseAsObject._embedded().articles().get(0).manualMode()).withFailMessage("Manual Mode Not matched");
    }

    @Step
    public void validateFieldsWithDb(int range, String field) {
        List<MarvinClientArticles> articlesByLimitAndRange = dbService.findArticlesByLimitAndRange(10, range);
        List<MarvinClientArticles> findArticlesByLimitAndRangeOrderByArticleNumber = dbService.findArticlesByLimitAndRangeOrderByArticleNumber(10, range);
        List<MarvinClientArticles> findArticlesByLimitAndRangeOrderByDirty = dbService.findArticlesByLimitAndRangeOrderByDirty(10, range);
        GetArticlesRoot responseAsObject = ResponseUtils.getResponseAsObject(GetArticlesRoot.class);
        for (int i = 0; i < 10; i++) {
            if (field.equals("ArticleNumber")) {
                Assertions.assertThat(findArticlesByLimitAndRangeOrderByArticleNumber.get(i).getArticleNumber()).isEqualTo(responseAsObject._embedded().articles().get(i).articleNumber()).withFailMessage("Article Number Not matched");
            } else if (field.equals("dirty")) {
                Assertions.assertThat(articlesByLimitAndRange.get(i).isDirty()).isEqualTo(responseAsObject._embedded().articles().get(i).dirty()).withFailMessage("Dirty Not matched");
            } else if (field.equals("public")) {
                Assertions.assertThat(articlesByLimitAndRange.get(i).isIsPublic()).isEqualTo(responseAsObject._embedded().articles().get(i).ispPublic()).withFailMessage("Public Not matched");
            }
        }
    }

    @Step
    public void validateDeliveriesAndMetaWithDb(int range, int scope) {
        List<MarvinClientArticles> articlesByLimitAndRange = dbService.findArticlesByLimitAndRange(10, range);
        GetArticlesRoot responseAsObject = ResponseUtils.getResponseAsObject(GetArticlesRoot.class);
        for (int i = 0; i < articlesByLimitAndRange.size(); i++) {
            List<DeliveryRepresentation> deliveries = dbService.findDeliveriesByScopeAndArticleId(scope, articlesByLimitAndRange.get(i).getId());
            for (int j = 0; j < responseAsObject._embedded().articles().get(i)._embedded().deliveries().size(); j++) {
                Assertions.assertThat(deliveries.get(j).isSuccessful()).isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).successful()).withFailMessage("Successful Not matched");
                Assertions.assertThat(deliveries.get(j).getOutputSetId()).isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).outputSetId()).withFailMessage("outputSetId Not matched");
                Assertions.assertThat(deliveries.get(j).getDeliveryTaskId()).isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).deliveryTaskId()).withFailMessage("deliveryTaskId Not matched");
                Assertions.assertThat(deliveries.get(j).getMarvinAssetId().toLowerCase()).isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).marvinAssetId()).withFailMessage("marvinAssetId Not matched");
                Assertions.assertThat(deliveries.get(j).getMarvinEtag()).isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).marvinEtag()).withFailMessage("marvinEtag Not matched");
                Assertions.assertThat(deliveries.get(j).isAvailable()).isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).available()).withFailMessage("available Not matched");
                Assertions.assertThat(deliveries.get(j).getWidth()).isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).width()).withFailMessage("width Not matched");
                Assertions.assertThat(deliveries.get(j).getCldnFileSize()).isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).cldnFileSize()).withFailMessage("cldnFileSize Not matched");
                Assertions.assertThat(deliveries.get(j).getSortOrder()).isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).sortOrder()).withFailMessage("Successful Not matched");
                Assertions.assertThat(Arrays.toString(deliveries.get(j).getTagsString().split(","))).isEqualTo(Arrays.toString(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).tags())).withFailMessage("tags Not matched");
                Assertions.assertThat(deliveries.get(j).getPublicId()).isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).publicId()).withFailMessage("publicId Not matched");
                Assertions.assertThat(deliveries.get(j).getDefaultAlias()).isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).defaultAlias()).withFailMessage("defaultAlias Not matched");
                Assertions.assertThat(deliveries.get(j).getSourceExtension()).isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).sourceExtension()).withFailMessage("sourceExtension Not matched");
                Assertions.assertThat(deliveries.get(j).getDeliveryPath()).isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).src()).withFailMessage("src Not matched");
                String[] srcTemplate = deliveries.get(j).getDeliveryPath().split("/");
                String[] extension = deliveries.get(j).getDeliveryPath().split("\\.");
                switch (range) {
                    case 92 -> {
                        String expectedSrcTemplate = String.join("/", Arrays.copyOfRange(srcTemplate, 0, 6))
                                + "/{conversion}." + extension[3];
                        Assertions.assertThat(expectedSrcTemplate)
                                .isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).srcTemplate())
                                .withFailMessage("srcTemplate Not matched");
                    }
                    case 95 -> {
                        String expectedSrcTemplate = String.join("/", srcTemplate[0], srcTemplate[1], srcTemplate[2], srcTemplate[3], "{conversion}", srcTemplate[4], srcTemplate[5]);
                        Assertions.assertThat(expectedSrcTemplate)
                                .isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).srcTemplate())
                                .withFailMessage("srcTemplate Not matched");
                    }
                    case 98 -> {
                        String expectedSrcTemplate = String.join("/", srcTemplate[0], srcTemplate[1], srcTemplate[2], srcTemplate[3], srcTemplate[4], srcTemplate[5]);
                        Assertions.assertThat(expectedSrcTemplate)
                                .isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).src())
                                .withFailMessage("srcTemplate Not matched");
                    }
                    default -> {
                        String expectedSrcTemplate = String.join("/", srcTemplate[0], srcTemplate[1], srcTemplate[2], srcTemplate[3], "{conversion}", srcTemplate[4], srcTemplate[5]);
                        Assertions.assertThat(expectedSrcTemplate)
                                .isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).srcTemplate())
                                .withFailMessage("srcTemplate Not matched");
                    }
                }
                if (deliveries.get(j).getResourceType() == 0) {
                    Assertions.assertThat(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).resourceType()).isEqualTo("image").withFailMessage("resourceType Not matched");
                } else {
                    Assertions.assertThat(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).resourceType()).isEqualTo("video").withFailMessage("resourceType Not matched");
                }
            }
        }
    }

    @Step
    public void validateDeliveriesAndMetaWithIncorrectScope(int range, int scope) {
        List<MarvinClientArticles> articlesByLimitAndRange = dbService.findArticlesByLimitAndRange(1, range);
        GetArticlesRoot responseAsObject = ResponseUtils.getResponseAsObject(GetArticlesRoot.class);
        Assertions.assertThat(dbService.findTotalArticleCount(range)).isEqualTo(responseAsObject.totalCount()).withFailMessage("Total Article Count Not matched");
        Assertions.assertThat(articlesByLimitAndRange.get(0).getArticleNumber()).isEqualTo(responseAsObject._embedded().articles().get(0).articleNumber()).withFailMessage("Article Number Not matched");
        Assertions.assertThat(articlesByLimitAndRange.get(0).isDirty()).isEqualTo(responseAsObject._embedded().articles().get(0).dirty()).withFailMessage("Dirty Not matched");
        Assertions.assertThat(articlesByLimitAndRange.get(0).isHighPriority()).isEqualTo(responseAsObject._embedded().articles().get(0).highPriority()).withFailMessage("High Priority Not matched");
        Assertions.assertThat(articlesByLimitAndRange.get(0).isIsPublic()).isEqualTo(responseAsObject._embedded().articles().get(0).ispPublic()).withFailMessage("Public Not matched");
        Assertions.assertThat(articlesByLimitAndRange.get(0).getLaunchDateUtc()).isEqualTo(responseAsObject._embedded().articles().get(0).launchUtc()).withFailMessage("LaunchUTC Not matched");
        Assertions.assertThat(articlesByLimitAndRange.get(0).isIsManualMode()).isEqualTo(responseAsObject._embedded().articles().get(0).manualMode()).withFailMessage("Manual Mode Not matched");
        if (responseAsObject._embedded().articles().get(0).manualMode() == true) {
            Assertions.assertThat(articlesByLimitAndRange.get(0).getManualModeUser()).isEqualTo(responseAsObject._embedded().articles().get(0).manualModeUser()).withFailMessage("Manual Mode User Not matched");
            if (articlesByLimitAndRange.get(0).getManualModeState() == 0) {
                Assertions.assertThat(responseAsObject._embedded().articles().get(0).manualModeState()).isEqualTo("APPLIED").withFailMessage("Manual Mode State Not matched");
            } else if (articlesByLimitAndRange.get(0).getManualModeState() == 1) {
                Assertions.assertThat(responseAsObject._embedded().articles().get(0).manualModeState()).isEqualTo("OUTDATED").withFailMessage("Manual Mode State Not matched");
            } else if (articlesByLimitAndRange.get(0).getManualModeState() == 2) {
                Assertions.assertThat(responseAsObject._embedded().articles().get(0).manualModeState()).isEqualTo("FALLBACK").withFailMessage("Manual Mode State Not matched");
            } else {
                Assertions.assertThat(responseAsObject._embedded().articles().get(0).manualModeState()).isEqualTo(null).withFailMessage("Manual Mode State Not matched");
            }
        }
        List<DeliveryRepresentation> deliveries = dbService.findDeliveriesByScopeAndArticleId(scope, articlesByLimitAndRange.get(0).getId());
        for (int i = 0; i < 10; i++) {
            Assertions.assertThat(deliveries).isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries()).withFailMessage("Manual Mode State Not matched");
        }
    }

    @Step
    public void validateDataWithDbForRangeArticlesArticleNumber(int range, String articleNumber) {
        MarvinClientArticles articlesByLimitAndRange = dbService.findArticleByArticleNumberAndRange(articleNumber, range);
        GetArticleNumberRoot responseAsObject = ResponseUtils.getResponseAsObject(GetArticleNumberRoot.class);
        if (responseAsObject.getArticleNumber() == null) {
            log.info("ArticleNumber not present");
        } else {
            Assertions.assertThat(articlesByLimitAndRange.getArticleNumber()).isEqualTo(responseAsObject.getArticleNumber()).withFailMessage("Article Number Not matched");
        }
        if (ResponseUtils.getResponseBodyAsString().contains("dirty") == false) {
            log.info("Dirty not present");
        } else {
            Assertions.assertThat(articlesByLimitAndRange.isDirty()).isEqualTo(responseAsObject.isDirty()).withFailMessage("Dirty Not matched");
        }
        if (ResponseUtils.getResponseBodyAsString().contains("highPriority") == false) {
            log.info("HighPriority not present");
        } else {
            Assertions.assertThat(articlesByLimitAndRange.isHighPriority()).isEqualTo(responseAsObject.isHighPriority()).withFailMessage("High Priority Not matched");
        }
        if (ResponseUtils.getResponseBodyAsString().contains("isPublic") == false) {
            log.info("Public not present");
        } else {
            Assertions.assertThat(articlesByLimitAndRange.isIsPublic()).isEqualTo(responseAsObject.isPublic()).withFailMessage("Public Not matched");
        }
        if (responseAsObject.getLaunchUtc() == null) {
            log.info("LaunchUTC not present");
        } else {
            Assertions.assertThat(articlesByLimitAndRange.getLaunchDateUtc()).isEqualTo(responseAsObject.getLaunchUtc()).withFailMessage("LaunchUTC Not matched");
        }
        if (ResponseUtils.getResponseBodyAsString().contains("manualMode") == false) {
            log.info("LaunchUTC not present");
        } else {
            Assertions.assertThat(articlesByLimitAndRange.isIsManualMode()).isEqualTo(responseAsObject.isManualMode()).withFailMessage("Manual Mode Not matched");
            if (responseAsObject.isManualMode() == true) {
                if (responseAsObject.getManualModeUser() == null) {
                    log.info("Manual mode user not present");
                } else {
                    Assertions.assertThat(articlesByLimitAndRange.getManualModeUser()).isEqualTo(responseAsObject.getManualModeUser()).withFailMessage("Manual Mode User Not matched");
                }
                if (responseAsObject.getManualModeState() == null) {
                    log.info("Manual mode state not present");
                } else {
                    switch (articlesByLimitAndRange.getManualModeState()) {
                        case 0 -> {
                            Assertions.assertThat(responseAsObject.getManualModeState()).isEqualTo("APPLIED").withFailMessage("Manual Mode State Not matched");
                        }
                        case 1 -> {
                            Assertions.assertThat(responseAsObject.getManualModeState()).isEqualTo("OUTDATED").withFailMessage("Manual Mode State Not matched");
                        }
                        case 2 -> {
                            Assertions.assertThat(responseAsObject.getManualModeState()).isEqualTo("FALLBACK").withFailMessage("Manual Mode State Not matched");
                        }
                        default -> {
                            Assertions.assertThat(responseAsObject.getManualModeState()).isEqualTo(null).withFailMessage("Manual Mode State Not matched");
                        }
                    }
                }
            }
        }
    }

    @Step
    public void validateDeliveriesResponseWithDb(int range, int scope) {
        if (ResponseUtils.getResponseAsObject(GetArticlesRoot.class)._embedded().articles() == null) {
            GetArticleNumberRoot responseAsObject = ResponseUtils.getResponseAsObject(GetArticleNumberRoot.class);
            MarvinClientArticles articlesByLimitAndRange = dbService.findArticleByArticleNumberAndRange(responseAsObject.getArticleNumber(), range);
            List<DeliveryRepresentation> deliveries = dbService.findDeliveriesByScopeAndArticleId(scope, articlesByLimitAndRange.getId());
            if (responseAsObject.get_embedded().deliveries().isEmpty()) {
                log.info("No Delivery Data in this ArticleNumber");
            } else {
                for (int i = 0; i < responseAsObject.get_embedded().deliveries().size(); i++) {
                    Assertions.assertThat(deliveries.get(i).isSuccessful()).isEqualTo(responseAsObject.get_embedded().deliveries().get(i).successful()).withFailMessage("Successful Not matched");
                    Assertions.assertThat(deliveries.get(i).getOutputSetId()).isEqualTo(responseAsObject.get_embedded().deliveries().get(i).outputSetId()).withFailMessage("outputSetId Not matched");
                    Assertions.assertThat(deliveries.get(i).getDeliveryTaskId()).isEqualTo(responseAsObject.get_embedded().deliveries().get(i).deliveryTaskId()).withFailMessage("deliveryTaskId Not matched");
                    Assertions.assertThat(deliveries.get(i).getMarvinAssetId().toLowerCase()).isEqualTo(responseAsObject.get_embedded().deliveries().get(i).marvinAssetId()).withFailMessage("marvinAssetId Not matched");
                    Assertions.assertThat(deliveries.get(i).getMarvinEtag()).isEqualTo(responseAsObject.get_embedded().deliveries().get(i).marvinEtag()).withFailMessage("marvinEtag Not matched");
                    Assertions.assertThat(deliveries.get(i).isAvailable()).isEqualTo(responseAsObject.get_embedded().deliveries().get(i).available()).withFailMessage("available Not matched");
                    Assertions.assertThat(deliveries.get(i).getWidth()).isEqualTo(responseAsObject.get_embedded().deliveries().get(i).width()).withFailMessage("width Not matched");
                    Assertions.assertThat(deliveries.get(i).getCldnFileSize()).isEqualTo(responseAsObject.get_embedded().deliveries().get(i).cldnFileSize()).withFailMessage("cldnFileSize Not matched");
                    Assertions.assertThat(deliveries.get(i).getSortOrder()).isEqualTo(responseAsObject.get_embedded().deliveries().get(i).sortOrder()).withFailMessage("Successful Not matched");
                    Assertions.assertThat(Arrays.toString(deliveries.get(i).getTagsString().split(","))).isEqualTo(Arrays.toString(responseAsObject.get_embedded().deliveries().get(i).tags())).withFailMessage("tags Not matched");
                    Assertions.assertThat(deliveries.get(i).getPublicId()).isEqualTo(responseAsObject.get_embedded().deliveries().get(i).publicId()).withFailMessage("publicId Not matched");
                    Assertions.assertThat(deliveries.get(i).getDefaultAlias()).isEqualTo(responseAsObject.get_embedded().deliveries().get(i).defaultAlias()).withFailMessage("defaultAlias Not matched");
                    Assertions.assertThat(deliveries.get(i).getSourceExtension()).isEqualTo(responseAsObject.get_embedded().deliveries().get(i).sourceExtension()).withFailMessage("sourceExtension Not matched");
                    Assertions.assertThat(deliveries.get(i).getDeliveryPath()).isEqualTo(responseAsObject.get_embedded().deliveries().get(i).src()).withFailMessage("src Not matched");
                    String[] srcTemplate = deliveries.get(i).getDeliveryPath().split("/");
                    String[] extension = deliveries.get(i).getDeliveryPath().split("\\.");
                    if (srcTemplate[5].contains("?")) {
                        String[] temp = srcTemplate[5].split("\\?");
                        srcTemplate[5] = temp[0];
                    }
                    switch (range) {
                        case 92 -> {
                            String expectedSrcTemplate = String.join("/", Arrays.copyOfRange(srcTemplate, 0, 6))
                                    + "/{conversion}." + extension[3];
                            Assertions.assertThat(expectedSrcTemplate)
                                    .isEqualTo(responseAsObject.get_embedded().deliveries().get(i).srcTemplate())
                                    .withFailMessage("srcTemplate Not matched");
                        }
                        case 95 -> {
                            String expectedSrcTemplate = String.join("/", srcTemplate[0], srcTemplate[1], srcTemplate[2], srcTemplate[3], "{conversion}", srcTemplate[4], srcTemplate[5]);
                            Assertions.assertThat(expectedSrcTemplate)
                                    .isEqualTo(responseAsObject.get_embedded().deliveries().get(i).srcTemplate())
                                    .withFailMessage("srcTemplate Not matched");
                        }
                        case 98 -> {
                            String expectedSrcTemplate = String.join("/", srcTemplate[0], srcTemplate[1], srcTemplate[2], srcTemplate[3], srcTemplate[4], srcTemplate[5]);
                            Assertions.assertThat(expectedSrcTemplate)
                                    .isEqualTo(responseAsObject.get_embedded().deliveries().get(i).src())
                                    .withFailMessage("srcTemplate Not matched");
                        }

                        default -> {
                            if (srcTemplate[4].equalsIgnoreCase("dev")) {
                                String expectedSrcTemplate = String.join("/", srcTemplate[0], srcTemplate[1], srcTemplate[2], srcTemplate[3], "{conversion}", srcTemplate[4], srcTemplate[5], srcTemplate[6]);
                                Assertions.assertThat(expectedSrcTemplate)
                                        .isEqualTo(responseAsObject.get_embedded().deliveries().get(i).srcTemplate())
                                        .withFailMessage("srcTemplate Not matched");
                            } else {
                                String expectedSrcTemplate = String.join("/", srcTemplate[0], srcTemplate[1], srcTemplate[2], srcTemplate[3], "{conversion}", srcTemplate[4], srcTemplate[5]);
                                Assertions.assertThat(expectedSrcTemplate)
                                        .isEqualTo(responseAsObject.get_embedded().deliveries().get(i).srcTemplate())
                                        .withFailMessage("srcTemplate Not matched");
                            }
                        }
                    }
                    if (deliveries.get(i).getResourceType() == 0) {
                        Assertions.assertThat(responseAsObject.get_embedded().deliveries().get(i).resourceType()).isEqualTo("image").withFailMessage("resourceType Not matched");
                    } else {
                        Assertions.assertThat(responseAsObject.get_embedded().deliveries().get(i).resourceType()).isEqualTo("video").withFailMessage("resourceType Not matched");
                    }
                }
            }
        } else {
            List<MarvinClientArticles> articlesByLimitAndRange = dbService.findArticlesByLimitAndRange(10, range);
            GetArticlesRoot responseAsObject = ResponseUtils.getResponseAsObject(GetArticlesRoot.class);
            for (int i = 0; i < 10; i++) {
                List<DeliveryRepresentation> deliveries = dbService.findDeliveriesByScopeAndArticleId(scope, articlesByLimitAndRange.get(i).getId());
                if (responseAsObject._embedded().articles().get(i)._embedded().deliveries().isEmpty()) {
                    log.info("No Delivery Data in this ArticleNumber");
                } else {
                    for (int j = 0; j < responseAsObject._embedded().articles().get(i)._embedded().deliveries().size(); j++) {
                        Assertions.assertThat(deliveries.get(j).isSuccessful()).isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).successful()).withFailMessage("Successful Not matched");
                        Assertions.assertThat(deliveries.get(j).getOutputSetId()).isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).outputSetId()).withFailMessage("outputSetId Not matched");
                        Assertions.assertThat(deliveries.get(j).getDeliveryTaskId()).isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).deliveryTaskId()).withFailMessage("deliveryTaskId Not matched");
                        Assertions.assertThat(deliveries.get(j).getMarvinAssetId().toLowerCase()).isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).marvinAssetId()).withFailMessage("marvinAssetId Not matched");
                        Assertions.assertThat(deliveries.get(j).getMarvinEtag()).isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).marvinEtag()).withFailMessage("marvinEtag Not matched");
                        Assertions.assertThat(deliveries.get(j).isAvailable()).isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).available()).withFailMessage("available Not matched");
                        Assertions.assertThat(deliveries.get(j).getWidth()).isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).width()).withFailMessage("width Not matched");
                        Assertions.assertThat(deliveries.get(j).getCldnFileSize()).isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).cldnFileSize()).withFailMessage("cldnFileSize Not matched");
                        Assertions.assertThat(deliveries.get(j).getSortOrder()).isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).sortOrder()).withFailMessage("Successful Not matched");
                        Assertions.assertThat(Arrays.toString(deliveries.get(j).getTagsString().split(","))).isEqualTo(Arrays.toString(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).tags())).withFailMessage("tags Not matched");
                        Assertions.assertThat(deliveries.get(j).getPublicId()).isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).publicId()).withFailMessage("publicId Not matched");
                        Assertions.assertThat(deliveries.get(j).getDefaultAlias()).isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).defaultAlias()).withFailMessage("defaultAlias Not matched");
                        Assertions.assertThat(deliveries.get(j).getSourceExtension()).isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).sourceExtension()).withFailMessage("sourceExtension Not matched");
                        Assertions.assertThat(deliveries.get(j).getDeliveryPath()).isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).src()).withFailMessage("src Not matched");
                        String[] srcTemplate = deliveries.get(j).getDeliveryPath().split("/");
                        String[] extension = deliveries.get(j).getDeliveryPath().split("\\.");
                        if (srcTemplate[5].contains("?")) {
                            String[] temp = srcTemplate[5].split("\\?");
                            srcTemplate[5] = temp[0];
                        }
                        switch (range) {
                            case 92 -> {
                                String expectedSrcTemplate = String.join("/", Arrays.copyOfRange(srcTemplate, 0, 6))
                                        + "/{conversion}." + extension[3];
                                Assertions.assertThat(expectedSrcTemplate)
                                        .isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).srcTemplate())
                                        .withFailMessage("srcTemplate Not matched");
                            }
                            case 95 -> {
                                String expectedSrcTemplate = String.join("/", srcTemplate[0], srcTemplate[1], srcTemplate[2], srcTemplate[3], "{conversion}", srcTemplate[4], srcTemplate[5]);
                                Assertions.assertThat(expectedSrcTemplate)
                                        .isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).srcTemplate())
                                        .withFailMessage("srcTemplate Not matched");
                            }
                            default -> {
                                if (srcTemplate[4].equalsIgnoreCase("dev")) {
                                    String expectedSrcTemplate = String.join("/", srcTemplate[0], srcTemplate[1], srcTemplate[2], srcTemplate[3], "{conversion}", srcTemplate[4], srcTemplate[5], srcTemplate[6]);
                                    Assertions.assertThat(expectedSrcTemplate)
                                            .isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).srcTemplate())
                                            .withFailMessage("srcTemplate Not matched");
                                } else {
                                    String expectedSrcTemplate = String.join("/", srcTemplate[0], srcTemplate[1], srcTemplate[2], srcTemplate[3], "{conversion}", srcTemplate[4], srcTemplate[5]);
                                    Assertions.assertThat(expectedSrcTemplate)
                                            .isEqualTo(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).srcTemplate())
                                            .withFailMessage("srcTemplate Not matched");
                                }
                            }
                        }
                        if (deliveries.get(j).getResourceType() == 0) {
                            Assertions.assertThat(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).resourceType()).isEqualTo("image").withFailMessage("resourceType Not matched");
                        } else {
                            Assertions.assertThat(responseAsObject._embedded().articles().get(i)._embedded().deliveries().get(j).resourceType()).isEqualTo("video").withFailMessage("resourceType Not matched");
                        }
                    }
                }
            }
        }
    }

    @Step
    public void validateMetadataResponseWithDb(int range, int scope) {
        if (ResponseUtils.getResponseAsObject(GetArticlesRoot.class)._embedded().articles() == null) {
            GetArticleNumberRoot responseAsObject = ResponseUtils.getResponseAsObject(GetArticleNumberRoot.class);
            MarvinClientArticles articlesByLimitAndRange = dbService.findArticleByArticleNumberAndRange(responseAsObject.getArticleNumber(), range);
            List<MarvinClientAssets> metadata = dbService.findAssetsByArticleId(articlesByLimitAndRange.getId());
            List<Metadata> embeddedMetadataList = responseAsObject.get_embedded().metadata();
            if (embeddedMetadataList.isEmpty()) {
                log.info("No Metadata Data in this ArticleNumber");
            } else {
                embeddedMetadataList.forEach(embeddedMetadata -> {
                    Optional<MarvinClientAssets> matchingAsset = metadata.stream()
                            .filter(asset -> embeddedMetadata.getId().equalsIgnoreCase(asset.getAssetId()))
                            .findFirst();
                    matchingAsset.ifPresent(asset -> {
                        try {
                            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
                            DocumentBuilder builder = factory.newDocumentBuilder();
                            Document document = builder.parse(new InputSource(new StringReader(asset.getMetadata())));
                            Assertions.assertThat(getElementValue(document, "Id", "Value")).isEqualTo(embeddedMetadata.getId().replaceAll("-", "")).withFailMessage("Id Not matched");
                            Assertions.assertThat(getElementValue(document, "AssetName", "Value")).isEqualTo(embeddedMetadata.getAssetName()).withFailMessage("AssetName Not matched");
                            Assertions.assertThat(getElementValue(document, "AssetCategory", "Value")).isEqualTo(embeddedMetadata.getAssetCategory()).withFailMessage("Asset Category Not matched");
                            Assertions.assertThat(getElementValue(document, "ImageStyle", "Value")).isEqualTo(embeddedMetadata.getImageStyle()).withFailMessage("Image Style Not matched");
                            Assertions.assertThat(getElementValue(document, "ProductView", "Value")).isEqualTo(embeddedMetadata.getProductView()).withFailMessage("Product View Not matched");
                            Assertions.assertThat(getMultipleElementValues(document, "Usage", "Value")).isEqualTo(Arrays.asList(embeddedMetadata.getUsage())).withFailMessage("Usage Not matched");
                            Assertions.assertThat(getElementValue(document, "Status", "Value")).isEqualTo(embeddedMetadata.getStatus()).withFailMessage("Status Not matched");
                            LocalDateTime latestFileUpdated = LocalDateTime.parse(getElementValue(document, "LatestFileUpdated", "Value"));
                            Assertions.assertThat(latestFileUpdated).isEqualTo(embeddedMetadata.getLatestFileUpdated()).withFailMessage("Latest File Updated Not matched");
                            Assertions.assertThat(Boolean.parseBoolean(getElementValue(document, "Confidential", "Value"))).isEqualTo(embeddedMetadata.isConfidential()).withFailMessage("Confidential Not matched");
                            Assertions.assertThat(getElementValue(document, "Vendor", "Value")).isEqualTo(embeddedMetadata.getVendor()).withFailMessage("Vendor Not matched");
                            metadata.remove(asset);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    });
                });
                metadata.forEach(asset -> log.info("Asset not present in db: " + asset.getAssetId()));
            }
        } else {
            List<MarvinClientArticles> articlesByLimitAndRange = dbService.findArticlesByLimitAndRange(10, range);
            GetArticlesRoot responseAsObject = ResponseUtils.getResponseAsObject(GetArticlesRoot.class);
            for (int i = 0; i < 10; i++) {
                List<MarvinClientAssets> metadata = dbService.findAssetsByArticleId(articlesByLimitAndRange.get(i).getId());
                List<Metadata> embeddedMetadataList = responseAsObject._embedded().articles().get(i)._embedded().metadata();
                if (embeddedMetadataList.isEmpty()) {
                    log.info("No Metadata Data in this ArticleNumber");
                } else {
                    for (Metadata embeddedMetadata : embeddedMetadataList) {
                        Optional<MarvinClientAssets> matchingAsset = metadata.stream()
                                .filter(asset -> embeddedMetadata.getId().equalsIgnoreCase(asset.getAssetId()))
                                .findFirst();
                        if (matchingAsset.isPresent()) {
                            try {
                                DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
                                DocumentBuilder builder = factory.newDocumentBuilder();
                                Document document = builder.parse(new InputSource(new StringReader(matchingAsset.get().getMetadata())));
                                Assertions.assertThat(getElementValue(document, "Id", "Value")).isEqualTo(embeddedMetadata.getId().replaceAll("-", "")).withFailMessage("Id Not matched");
                                Assertions.assertThat(getElementValue(document, "AssetName", "Value")).isEqualTo(embeddedMetadata.getAssetName()).withFailMessage("AssetName Not matched");
                                Assertions.assertThat(getElementValue(document, "AssetCategory", "Value")).isEqualTo(embeddedMetadata.getAssetCategory()).withFailMessage("Asset Category Not matched");
                                Assertions.assertThat(getElementValue(document, "ImageStyle", "Value")).isEqualTo(embeddedMetadata.getImageStyle()).withFailMessage("Image Style Not matched");
                                Assertions.assertThat(getElementValue(document, "ProductView", "Value")).isEqualTo(embeddedMetadata.getProductView()).withFailMessage("Product View Not matched");
                                Assertions.assertThat(getMultipleElementValues(document, "Usage", "Value")).isEqualTo(Arrays.asList(embeddedMetadata.getUsage())).withFailMessage("Usage Not matched");
                                Assertions.assertThat(getElementValue(document, "Status", "Value")).isEqualTo(embeddedMetadata.getStatus()).withFailMessage("Status Not matched");
                                LocalDateTime latestFileUpdated = LocalDateTime.parse(getElementValue(document, "LatestFileUpdated", "Value"));
                                Assertions.assertThat(latestFileUpdated).isEqualTo(embeddedMetadata.getLatestFileUpdated()).withFailMessage("Latest File Updated Not matched");
                                Assertions.assertThat(Boolean.parseBoolean(getElementValue(document, "Confidential", "Value"))).isEqualTo(embeddedMetadata.isConfidential()).withFailMessage("Confidential Not matched");
                                Assertions.assertThat(getElementValue(document, "Vendor", "Value")).isEqualTo(embeddedMetadata.getVendor()).withFailMessage("Vendor Not matched");
                                metadata.remove(matchingAsset.get());
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        } else {
                            log.info("Asset not present in the database");
                        }
                    }
                }
            }
        }
    }

    private static String getElementValue(Document document, String parentTagName, String childTagName) {
        NodeList nodeList = document.getElementsByTagName(parentTagName);
        if (nodeList.getLength() > 0) {
            Node parentNode = nodeList.item(0);
            if (parentNode.getNodeType() == Node.ELEMENT_NODE) {
                Element parentElement = (Element) parentNode;
                NodeList valueList = parentElement.getElementsByTagName(childTagName);
                if (valueList.getLength() > 0) {
                    Node valueNode = valueList.item(0);
                    if (valueNode.getNodeType() == Node.ELEMENT_NODE) {
                        Element valueElement = (Element) valueNode;
                        return valueElement.getTextContent();
                    }
                }
            }
        }
        return null;
    }

    private static List<String> getMultipleElementValues(Document document, String parentTagName, String childTagName) {
        NodeList nodeList = document.getElementsByTagName(parentTagName);
        List<String> values = new ArrayList<>();
        if (nodeList.getLength() > 0) {
            Element element = (Element) nodeList.item(0);
            NodeList childNodeList = element.getElementsByTagName(childTagName);
            for (int i = 0; i < childNodeList.getLength(); i++) {
                values.add(childNodeList.item(i).getTextContent().trim());
            }
        }
        return values;
    }

    @Step
    public void validateDataWithDbForRangeArticles(int range) {
        GetArticlesRoot responseAsObject = ResponseUtils.getResponseAsObject(GetArticlesRoot.class);
        if (responseAsObject.totalCount() > 0) {
            for (int i = 0; i < responseAsObject._embedded().articles().size(); i++) {
                MarvinClientArticles articlesByLimitAndRange = dbService.findArticleByArticleNumberAndRange(responseAsObject._embedded().articles().get(i).articleNumber(), range);
                if (responseAsObject._embedded().articles().get(i).articleNumber() == null) {
                    log.info("ArticleNumber not present");
                } else {
                    Assertions.assertThat(articlesByLimitAndRange.getArticleNumber()).isEqualTo(responseAsObject._embedded().articles().get(i).articleNumber()).withFailMessage("Article Number Not matched");
                }
                if (ResponseUtils.getResponseBodyAsString().contains("dirty") == false) {
                    log.info("Dirty not present");
                } else {
                    Assertions.assertThat(articlesByLimitAndRange.isDirty()).isEqualTo(responseAsObject._embedded().articles().get(i).dirty()).withFailMessage("Dirty Not matched");
                }
                if (ResponseUtils.getResponseBodyAsString().contains("highPriority") == false) {
                    log.info("HighPriority not present");
                } else {
                    Assertions.assertThat(articlesByLimitAndRange.isHighPriority()).isEqualTo(responseAsObject._embedded().articles().get(i).highPriority()).withFailMessage("High Priority Not matched");
                }
                if (ResponseUtils.getResponseBodyAsString().contains("public") == false) {
                    log.info("Public not present");
                } else {
                    Assertions.assertThat(articlesByLimitAndRange.isIsPublic()).isEqualTo(responseAsObject._embedded().articles().get(i).ispPublic()).withFailMessage("Public Not matched");
                }
                if (responseAsObject._embedded().articles().get(i).launchUtc() == null) {
                    log.info("LaunchUTC not present");
                } else {
                    Assertions.assertThat(articlesByLimitAndRange.getLaunchDateUtc()).isEqualTo(responseAsObject._embedded().articles().get(i).launchUtc()).withFailMessage("LaunchUTC Not matched");
                }
                if (ResponseUtils.getResponseBodyAsString().contains("manualMode") == false) {
                    log.info("ManualMode not present");
                } else {
                    Assertions.assertThat(articlesByLimitAndRange.isIsManualMode()).isEqualTo(responseAsObject._embedded().articles().get(i).manualMode()).withFailMessage("Manual Mode Not matched");
                    if (responseAsObject._embedded().articles().get(i).manualMode() == true) {
                        if (responseAsObject._embedded().articles().get(i).manualModeUser() == null) {
                            log.info("Manual mode user not present");
                        } else {
                            Assertions.assertThat(articlesByLimitAndRange.getManualModeUser()).isEqualTo(responseAsObject._embedded().articles().get(i).manualModeUser()).withFailMessage("Manual Mode User Not matched");
                        }
                        if (responseAsObject._embedded().articles().get(i).manualModeState() == null) {
                            log.info("Manual mode state not present");
                        } else {
                            switch (articlesByLimitAndRange.getManualModeState()) {
                                case 0 -> {
                                    Assertions.assertThat(responseAsObject._embedded().articles().get(i).manualModeState()).isEqualTo("APPLIED").withFailMessage("Manual Mode State Not matched");
                                }
                                case 1 -> {
                                    Assertions.assertThat(responseAsObject._embedded().articles().get(i).manualModeState()).isEqualTo("OUTDATED").withFailMessage("Manual Mode State Not matched");
                                }
                                case 2 -> {
                                    Assertions.assertThat(responseAsObject._embedded().articles().get(i).manualModeState()).isEqualTo("FALLBACK").withFailMessage("Manual Mode State Not matched");
                                }
                                default -> {
                                    Assertions.assertThat(responseAsObject._embedded().articles().get(i).manualModeState()).isEqualTo(null).withFailMessage("Manual Mode State Not matched");
                                }
                            }
                        }
                    }
                }
            }
        } else {
            log.info("No Article is available");
        }
    }

    @Step
    public void validateSkippedArticleNumberWithDb(int skip, int range) {
        List<MarvinClientArticles> skippedArticlesByRange = dbService.findSkippedArticlesBySkipAndRange(skip, range);
        GetArticlesRoot responseAsObject = ResponseUtils.getResponseAsObject(GetArticlesRoot.class);
        for (int i = 0; i < responseAsObject._embedded().articles().size(); i++) {
            Assertions.assertThat(skippedArticlesByRange.get(i).getArticleNumber()).isEqualTo(responseAsObject._embedded().articles().get(i).articleNumber()).withFailMessage("Article Number Not matched");
        }
    }

    @Step
    public void validateFieldValueInOrder(String field, String order, int range) {
        GetArticlesRoot responseAsObject = ResponseUtils.getResponseAsObject(GetArticlesRoot.class);
        switch (field) {
            case "articleNumber" -> {
                List<MarvinClientArticles> articlesByOrder = dbService.findArticlesByOrderInArticleNumber(range, order);
                for (int i = 0; i < responseAsObject._embedded().articles().size(); i++) {
                    Assertions.assertThat(articlesByOrder.get(i).getArticleNumber()).isEqualTo(responseAsObject._embedded().articles().get(i).articleNumber()).withFailMessage("Article Number Not matched");
                }
            }
            case "dirty" -> {
                List<MarvinClientArticles> articlesByOrder = dbService.findArticlesByOrderInDirty(range, order);
                for (int i = 0; i < responseAsObject._embedded().articles().size(); i++) {
                    Assertions.assertThat(articlesByOrder.get(i).isDirty()).isEqualTo(responseAsObject._embedded().articles().get(i).dirty()).withFailMessage("Article Number Not matched");
                }
            }
            case "highPriority" -> {
                List<MarvinClientArticles> articlesByOrder = dbService.findArticlesByOrderInHighPriority(range, order);
                for (int i = 0; i < responseAsObject._embedded().articles().size(); i++) {
                    Assertions.assertThat(articlesByOrder.get(i).isHighPriority()).isEqualTo(responseAsObject._embedded().articles().get(i).highPriority()).withFailMessage("Article Number Not matched");
                }
            }
            case "public" -> {
                List<MarvinClientArticles> articlesByOrder = dbService.findArticlesByOrderInPublic(range, order);
                for (int i = 0; i < responseAsObject._embedded().articles().size(); i++) {
                    Assertions.assertThat(articlesByOrder.get(i).isIsPublic()).isEqualTo(responseAsObject._embedded().articles().get(i).ispPublic()).withFailMessage("Article Number Not matched");
                }
            }
            case "launchUtc" -> {
                List<MarvinClientArticles> articlesByOrder = dbService.findArticlesByOrderInLaunchUtc(range, order);
                for (int i = 0; i < responseAsObject._embedded().articles().size(); i++) {
                    Assertions.assertThat(articlesByOrder.get(i).getLaunchDateUtc()).isEqualTo(responseAsObject._embedded().articles().get(i).launchUtc()).withFailMessage("Article Number Not matched");
                }
            }
            case "manualMode" -> {
                List<MarvinClientArticles> articlesByOrder = dbService.findArticlesByOrderInManualMode(range, order);
                for (int i = 0; i < responseAsObject._embedded().articles().size(); i++) {
                    Assertions.assertThat(articlesByOrder.get(i).isIsManualMode()).isEqualTo(responseAsObject._embedded().articles().get(i).manualMode()).withFailMessage("Article Number Not matched");
                }
            }
            default -> {
                log.error("Unknown endpoint" + field);
                throw new IllegalArgumentException("Wrong/ missed field");
            }
        }
    }

    @Step
    public void validateDeliveriesResponseWithDbForManualMode(int range, int scope) {
        ManualModeUser responseAsObject = ResponseUtils.getResponseAsObject(ManualModeUser.class);
        MarvinClientArticles articlesByLimitAndRange = dbService.findArticleByArticleNumberAndRange(responseAsObject.getArticleNumber(), range);
        List<DeliveryRepresentation> deliveries = dbService.findDeliveriesByScopeAndArticleId(scope, articlesByLimitAndRange.getId());
        if (responseAsObject.getDeliveries().isEmpty()) {
            log.info("No Delivery Data in this ArticleNumber");
        } else {
            ArrayList<Deliveries> deliveriesResponse = responseAsObject.getDeliveries();
            Collections.sort(deliveriesResponse, Comparator.comparingInt(Deliveries::sortOrder));
            Collections.sort(deliveries, Comparator.comparingInt(DeliveryRepresentation::getSortOrder));
            for (int i = 0; i < responseAsObject.getDeliveries().size(); i++) {
                Assertions.assertThat(deliveries.get(i).isSuccessful()).isEqualTo(responseAsObject.getDeliveries().get(i).successful()).withFailMessage("Successful Not matched");
                Assertions.assertThat(deliveries.get(i).getOutputSetId()).isEqualTo(responseAsObject.getDeliveries().get(i).outputSetId()).withFailMessage("outputSetId Not matched");
                Assertions.assertThat(deliveries.get(i).getDeliveryTaskId()).isEqualTo(responseAsObject.getDeliveries().get(i).deliveryTaskId()).withFailMessage("deliveryTaskId Not matched");
                Assertions.assertThat(deliveries.get(i).getMarvinAssetId().toLowerCase()).isEqualTo(responseAsObject.getDeliveries().get(i).marvinAssetId()).withFailMessage("marvinAssetId Not matched");
                Assertions.assertThat(deliveries.get(i).isAvailable()).isEqualTo(responseAsObject.getDeliveries().get(i).available()).withFailMessage("available Not matched");
                Assertions.assertThat(deliveries.get(i).getSortOrder()).isEqualTo(responseAsObject.getDeliveries().get(i).sortOrder()).withFailMessage("Successful Not matched");
                Assertions.assertThat(Arrays.toString(deliveries.get(i).getTagsString().split(","))).isEqualTo(Arrays.toString(responseAsObject.getDeliveries().get(i).tags())).withFailMessage("tags Not matched");
                Assertions.assertThat(deliveries.get(i).getDefaultAlias()).isEqualTo(responseAsObject.getDeliveries().get(i).defaultAlias()).withFailMessage("defaultAlias Not matched");
                Assertions.assertThat(deliveries.get(i).getSourceExtension()).isEqualTo(responseAsObject.getDeliveries().get(i).sourceExtension()).withFailMessage("sourceExtension Not matched");
                String[] srcTemplate = deliveries.get(i).getDeliveryPath().split("/");
                String[] extension = deliveries.get(i).getDeliveryPath().split("\\.");
                switch (range) {
                    case 92 -> {
                        String expectedSrcTemplate = String.join("/", Arrays.copyOfRange(srcTemplate, 0, 6))
                                + "/{conversion}." + extension[3];
                        Assertions.assertThat(expectedSrcTemplate)
                                .isEqualTo(responseAsObject.getDeliveries().get(i).srcTemplate())
                                .withFailMessage("srcTemplate Not matched");
                    }
                    case 95 -> {
                        String expectedSrcTemplate = String.join("/", srcTemplate[0], srcTemplate[1], srcTemplate[2], srcTemplate[3], "{conversion}", srcTemplate[4], srcTemplate[5]);
                        Assertions.assertThat(expectedSrcTemplate)
                                .isEqualTo(responseAsObject.getDeliveries().get(i).srcTemplate())
                                .withFailMessage("srcTemplate Not matched");
                    }
                    default -> {
                        String expectedSrcTemplate = String.join("/", srcTemplate[0], srcTemplate[1], srcTemplate[2], srcTemplate[3], "{conversion}", srcTemplate[4], srcTemplate[5], srcTemplate[6]);
                        Assertions.assertThat(expectedSrcTemplate)
                                .isEqualTo(responseAsObject.getDeliveries().get(i).srcTemplate())
                                .withFailMessage("srcTemplate Not matched");
                    }
                }

            }
        }
    }

    @Step
    public void validateDataInDbWithProvidedData(int range, DataTable table) {
        List<Map<String, String>> body = table.asMaps(String.class, String.class);
        if (body.get(0).get("articleNumber").contains(".txt")) {
            body = processArticleNumber(body.get(0).get("articleNumber"));
            for (int i = 0; i < body.size(); i++) {
                MarvinClientArticles articleByArticleNumberAndRange = dbService.findArticleByArticleNumberAndRange(body.get(i).get("articleNumber"), range);
                Assertions.assertThat(articleByArticleNumberAndRange.getArticleNumber()).isEqualTo(body.get(i).get("articleNumber")).withFailMessage("High Priority Not matched");
            }
        } else {
            for (Map<String, String> articleBody : body) {
                MarvinClientArticles articleByArticleNumberAndRange = dbService.findArticleByArticleNumberAndRange(articleBody.get("articleNumber"), range);
                for (String field : Arrays.asList("highPriority", "public", "launchUtc", "expiryUtc", "brand")) {
                    if (articleBody.containsKey(field)) {
                        switch (field) {
                            case "highPriority" ->
                                    Assertions.assertThat(articleByArticleNumberAndRange.isHighPriority()).isEqualTo(Boolean.valueOf(articleBody.get("highPriority"))).withFailMessage("High Priority Not matched");
                            case "public" ->
                                    Assertions.assertThat(articleByArticleNumberAndRange.isIsPublic()).isEqualTo(Boolean.valueOf(articleBody.get("public"))).withFailMessage("Public Not matched");
                            case "launchUtc" ->
                                    Assertions.assertThat(articleByArticleNumberAndRange.getLaunchDateUtc()).isEqualTo(LocalDateTime.parse(articleBody.get("launchUtc"), DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))).withFailMessage("LaunchUTC Not matched");
                            case "expiryUtc" ->
                                    Assertions.assertThat(articleByArticleNumberAndRange.getExpiryDateUtc()).isEqualTo(LocalDateTime.parse(articleBody.get("expiryUtc"), DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))).withFailMessage("ExpiryUTC Not matched");
                            case "brand" ->
                                    Assertions.assertThat(articleByArticleNumberAndRange.getBrand().toLowerCase()).isEqualTo(articleBody.get("brand").toLowerCase()).withFailMessage("Brand Not matched");
                        }
                    }
                }
            }
        }

    }

    private List<Map<String, String>> processArticleNumber(String articleNumberPath) {
        List<Map<String, String>> articleNumberList = new ArrayList<>();
        try (InputStream in = this.getClass().getResourceAsStream(articleNumberPath);
             BufferedReader reader = new BufferedReader(new InputStreamReader(in))) {

            String txtFile;
            while ((txtFile = reader.readLine()) != null) {
                Map<String, String> articleMap = new HashMap<>();
                articleMap.put("articleNumber", txtFile);
                articleNumberList.add(articleMap);
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
        return articleNumberList;
    }

    public void validateDataInDbWithResponseBody(int range, DataTable table) {
        GetArticlesRoot responseAsObject = ResponseUtils.getResponseAsObject(GetArticlesRoot.class);
        List<Map<String, String>> body = table.asMaps(String.class, String.class);
        if (body.get(0).get("articleNumber").contains(".txt")) {
            body = processArticleNumber(body.get(0).get("articleNumber"));
        }
        for (int i = 0; i < body.size(); i++) {
            String articleNumber = body.get(i).get("articleNumber");
            for (int j = 0; j < responseAsObject._embedded().articles().size(); j++) {
                Article articles = responseAsObject._embedded().articles().get(j);
                if (articleNumber.equals(articles.articleNumber())) {
                    MarvinClientArticles articleByArticleNumberAndRange = dbService.findArticleByArticleNumberAndRange(articles.articleNumber(), range);
                    Assertions.assertThat(articleByArticleNumberAndRange.getArticleNumber()).isEqualTo(articles.articleNumber()).withFailMessage("Article Number Not matched");
                    Assertions.assertThat(articleByArticleNumberAndRange.isHighPriority()).isEqualTo(articles.highPriority()).withFailMessage("High Priority Not matched");
                    Assertions.assertThat(articleByArticleNumberAndRange.isIsPublic()).isEqualTo(articles.ispPublic()).withFailMessage("Public Not matched");
                    Assertions.assertThat(articleByArticleNumberAndRange.getLaunchDateUtc()).isEqualTo(articles.launchUtc()).withFailMessage("LaunchUTC Not matched");
                }
            }
        }
    }
}
