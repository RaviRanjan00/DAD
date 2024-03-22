Feature: Asset Trafficker API feature - GET Articles positive scenarios

  Background:
    Given I get access token for "main" user

  @TEST_PDM-9505 @regression @smoke @get
  Scenario Outline: AT API - GET - Verify fetching articles for all ranges
    When I use this <range> to send GET request
    Then I validate status code <expectedStatusCode>
    Then I Validate GET Response by json schema "GetResponseSchemas/GetResponseSchema.json"
    Then I Validate GET Response body
    Then I validate the data in DB for <range>
    Examples:
      | range | expectedStatusCode |
      | 92    | 200                |
      | 91    | 200                |
      | 95    | 200                |
      | 98    | 200                |

  @TEST_PDM-9509 @get @regression
  Scenario Outline: AT API - GET - Verify fetching articles by Params for all ranges
    When I use this <range> to send GET request with params
      | $top | fields        |
      | 10   | articleNumber |
    Then I validate status code <expectedStatusCode>
    Then I Validate GET Response by json schema "GetResponseSchemas/GetArticleNumberResponseSchema.json"
    Then I Validate GET Response body
    Then I validate "ArticleNumber" field in DB for <range>
    Examples:
      | range | expectedStatusCode |
      | 92    | 200                |
      | 91    | 200                |
      | 95    | 200                |
      | 98    | 200                |


  @TEST_PDM-9520 @get @regression
  Scenario Outline: AT API - GET - Verify fetching dirty by Params for all ranges
    When I use this <range> to send GET request with params
      | $top | fields |
      | 10   | dirty  |
    Then I validate status code <expectedStatusCode>
    Then I Validate GET Response by json schema "GetResponseSchemas/GetDirtyResponseSchema.json"
    Then I Validate GET Response body
    Then I validate "dirty" field in DB for <range>
    Examples:
      | range | expectedStatusCode |
      | 92    | 200                |
      | 91    | 200                |
      | 95    | 200                |
      | 98    | 200                |


  @TEST_PDM-9521 @get @regression
  Scenario Outline: AT API - GET - Verify fetching public by Params for all ranges
    When I use this <range> to send GET request with params
      | $top | fields |
      | 10   | public |
    Then I validate status code <expectedStatusCode>
    Then I Validate GET Response by json schema "GetResponseSchemas/GetPublicResponseSchema.json"
    Then I Validate GET Response body
    Then I validate "public" field in DB for <range>
    Examples:
      | range | expectedStatusCode |
      | 92    | 200                |
      | 91    | 200                |
      | 95    | 200                |
      | 98    | 200                |

  @TEST_PDM-9522 @get @regression
  Scenario Outline: AT API - GET - Verify fetching articles and validating deliveries & Metadata
    When I use this <range> to send GET request with params
      | scope   | fields                                                                                                                                           |
      | <scope> | articleNumber,dirty, highPriority,public,launchUtc,expiryUtc,attempt,retryAfterUtc,manualMode,manualModeUser,manualModeState,deliveries,metadata |
    Then I validate status code <expectedStatusCode>
    Then I Validate GET Response by json schema "GetResponseSchemas/GetResponseSchema.json"
    Then I Validate GET Response body
    Then I validate the data in DB for <range>
    Then I validate Deliveries and Metadata fields in DB for <range> with <scope>
    Examples:
      | range | expectedStatusCode | scope |
      | 92    | 200                | 14    |
      | 91    | 200                | 16    |
      | 95    | 200                | 1     |
      | 98    | 200                | 11    |

  @TEST_PDM-9729 @regression @authentication @get
  Scenario Outline: AT API - GET - Verify fetching articles without any params for all ranges for GET: /{range_id}/articles/articleNumber
    When I use this <range> to send GET request for endpoint "<endpoint>" and articleNumber "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Then I validate response body with the data in DB for <range> and "<articleNumber>" of range_articles_by_article_number endpoint
    Examples:
      | endpoint                         | range | articleNumber | expectedStatusCode |
      | range_articles_by_article_number | 91    | FX5502        | 200                |
      | range_articles_by_article_number | 92    | FX5502        | 200                |
      | range_articles_by_article_number | 95    | FX5502        | 200                |
      | range_articles_by_article_number | 98    | FX5502        | 200                |

  @TEST_PDM-9733 @get @regression
  Scenario Outline: AT API - GET - Verify fetching articleNumber with correct scopes for all ranges
    When I use this <range> to send GET request for endpoint and articleNumber "<articleNumber>" with params
      | scope   |
      | <scope> |
    Then I validate status code <expectedStatusCode>
    Then I validate response body with the data in DB for <range> and "<articleNumber>" of range_articles_by_article_number endpoint
    Then I validate Deliveries data in response body with the data in DB for <range> and <scope>
    Then I validate Metadata data in response body with the data in DB for <range> and <scope>
    Examples:
      | range | articleNumber | expectedStatusCode | scope |
      | 91    | FX5502        | 200                | 16    |
      | 92    | FX5502        | 200                | 14    |
      | 95    | FX5502        | 200                | 1     |
      | 98    | FX5502        | 200                | 11    |

  @TEST_PDM-9734 @regression @authentication @get
  Scenario Outline: AT API - GET - Verify fetching articles with correct fields as params for all ranges for GET: /{range_id}/articles/articleNumber
    When I use this <range> to send GET request for endpoint and articleNumber "<articleNumber>" with params
      | fields        |
      | articleNumber |
    Then I validate status code <expectedStatusCode>
    Then I validate response body with the data in DB for <range> and "<articleNumber>" of range_articles_by_article_number endpoint
    Examples:
      | range | articleNumber | expectedStatusCode |
      | 91    | FX5502        | 200                |
      | 92    | FX5502        | 200                |
      | 95    | FX5502        | 200                |
      | 98    | FX5502        | 200                |

  @TEST_PDM-8506 @get @regression
  Scenario Outline: AT API - GET - Verify fetching articleNumber using scope and fields like articleNumber for all ranges
    When I use this <range> to send GET request for endpoint and articleNumber "<articleNumber>" with params
      | scope   | fields        |
      | <scope> | articleNumber |
    Then I validate status code <expectedStatusCode>
    Then I Validate GET Response body
    Then I validate response body with the data in DB for <range> and "<articleNumber>" of range_articles_by_article_number endpoint
    Then I validate Deliveries data in response body with the data in DB for <range> and <scope>
    Then I validate Metadata data in response body with the data in DB for <range> and <scope>
    Examples:
      | range | articleNumber | expectedStatusCode | scope |
      | 91    | FX5502        | 200                | 16    |
      | 92    | FX5502        | 200                | 14    |
      | 95    | GN4891        | 200                | 1     |
      | 98    | FX5502        | 200                | 11    |

  @TEST_PDM-9730 @get @regression
  Scenario Outline: AT API - GET - Verify fetching articleNumber using scope and fields like articleNumber & dirty for all ranges
    When I use this <range> to send GET request for endpoint and articleNumber "<articleNumber>" with params
      | scope   | fields               |
      | <scope> | articleNumber, dirty |
    Then I validate status code <expectedStatusCode>
    Then I Validate GET Response body having fields "articleNumber, dirty"
    Then I validate response body with the data in DB for <range> and "<articleNumber>" of range_articles_by_article_number endpoint
    Then I validate Deliveries data in response body with the data in DB for <range> and <scope>
    Then I validate Metadata data in response body with the data in DB for <range> and <scope>
    Examples:
      | range | articleNumber | expectedStatusCode | scope |
      | 91    | FX5502        | 200                | 16    |
      | 92    | FX5502        | 200                | 14    |
      | 95    | GN4891        | 200                | 1     |
      | 98    | FX5502        | 200                | 11    |

  @TEST_PDM-9731 @get @regression
  Scenario Outline: AT API - GET - Verify fetching articleNumber using scope and fields like articleNumber, dirty & highPriority for all ranges
    When I use this <range> to send GET request for endpoint and articleNumber "<articleNumber>" with params
      | scope   | fields                             |
      | <scope> | articleNumber, dirty, highPriority |
    Then I validate status code <expectedStatusCode>
    Then I Validate GET Response body having fields "dirty, highPriority"
    Then I validate response body with the data in DB for <range> and "<articleNumber>" of range_articles_by_article_number endpoint
    Then I validate Deliveries data in response body with the data in DB for <range> and <scope>
    Then I validate Metadata data in response body with the data in DB for <range> and <scope>
    Examples:
      | range | articleNumber | expectedStatusCode | scope |
      | 91    | FX5502        | 200                | 16    |
      | 92    | FX5502        | 200                | 14    |
      | 95    | GN4891        | 200                | 1     |
      | 98    | FX5502        | 200                | 11    |

  @TEST_PDM-9732 @regression @get
  Scenario Outline: AT API - GET - Verify fetching articles with correct scope & correct fields like articleNumber,dirty, highPriority,public,launchUtc,attempt,manualMode, deliveries,metadata for all ranges for GET: /{range_id}/articles/articleNumber
    When I use this <range> to send GET request for endpoint and articleNumber "<articleNumber>" with params
      | scope   | fields                                                                                     |
      | <scope> | articleNumber,dirty, highPriority,public,launchUtc,attempt,manualMode, deliveries,metadata |
    Then I validate status code <expectedStatusCode>
    Then I Validate GET Response body having fields "articleNumber,dirty, highPriority,public,launchUtc,attempt,manualMode, deliveries,metadata"
    Then I validate response body with the data in DB for <range> and "<articleNumber>" of range_articles_by_article_number endpoint
    Then I validate Deliveries data in response body with the data in DB for <range> and <scope>
    Then I validate Metadata data in response body with the data in DB for <range> and <scope>
    Examples:
      | range | articleNumber | expectedStatusCode | scope |
      | 91    | FX5502        | 200                | 16    |
      | 92    | FX5502        | 200                | 14    |
      | 95    | FX5502        | 200                | 1     |
      | 98    | FX5502        | 200                | 11    |

  @TEST_PDM-9917 @regression @get
  Scenario Outline: AT API - GET - ManualMode - Verify fetching articles for all ranges for GET: /{range_id}/articles/articleNumber/manualmode
    When I use this <range> to send GET request for endpoint "<endpoint>" and articleNumber "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Then I validate response body with the data in DB for <range> and "<articleNumber>" of range_articles_by_article_number endpoint

    Examples:
      | endpoint                                     | range | articleNumber | expectedStatusCode |
      | range_articles_by_article_number_manual_mode | 91    |  FX5502       | 200                |
      | range_articles_by_article_number_manual_mode | 92    |  FX5502       | 200                |
      | range_articles_by_article_number_manual_mode | 95    |  GN4891       | 200                |
      | range_articles_by_article_number_manual_mode | 98    |  FX5502       | 200                |