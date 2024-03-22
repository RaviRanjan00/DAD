Feature: Asset Trafficker API feature - GET Articles negative scenarios

  @TEST_PDM-9500 @regression @get
  Scenario Outline: AT API - GET - Verify fetching articles for all ranges with incorrect scope
    Given I get access token for "main" user
    When I use this <range> to send GET request with params
      | scope |
      | -1    |
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | expectedStatusCode |
      | 92    | 400                |
      | 91    | 400                |
      | 95    | 400                |
      | 98    | 400                |

  @TEST_PDM-9501 @regression @get
  Scenario Outline: AT API - GET - Verify fetching articles with invalid token
    When I send "GET" request for <range> range and token "<token>"
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | expectedStatusCode | token             |
      | 92    | 401                | 4eyJ0eXAiOiJKV1Qi |
      | 91    | 401                | null              |
      | 95    | 401                |                   |
      | 98    | 401                | 4eyJ0eXAiOiJKV1Qi |

  @TEST_PDM-9502 @regression @get
  Scenario Outline: AT API - GET - Verify fetching articles with users have no access for specific range
    Given I get access token for "<userType>" user
    When I use this <range> to send GET request
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | expectedStatusCode | userType |
      | 92    | 403                | all_95   |
      | 91    | 403                | all_95   |
      | 98    | 403                | all_95   |

  @TEST_PDM-9503 @get @regression
  Scenario Outline: AT API - GET - Verify fetching articles and validating deliveries & Metadata for range with incorrect scope
    Given I get access token for "main" user
    When I use this <range> to send GET request with params
      | scope   | fields                                                                                                                                           |
      | <scope> | articleNumber,dirty, highPriority,public,launchUtc,expiryUtc,attempt,retryAfterUtc,manualMode,manualModeUser,manualModeState,deliveries,metadata |
    Then I validate status code <expectedStatusCode>
    Then I Validate GET Response by json schema "GetResponseSchemas/GetResponseSchema.json"
    Then I Validate GET Response body
    Then I validate the data in DB for <range>
    Then I validate Deliveries and Metadata fields in DB for <range> with incorrect <scope>
    Examples:
      | range | expectedStatusCode | scope |
      | 92    | 200                | 1     |
      | 91    | 200                | 14    |
      | 95    | 200                | 11    |
      | 98    | 200                | 1     |

  @TEST_PDM-8502 @regression @get
  Scenario Outline: AT API - GET - Verify fetching articles with incorrect scope for all ranges for GET: /{range_id}/articles/articleNumber
    Given I get access token for "main" user
    When I use this <range> to send GET request for endpoint and articleNumber "<articleNumber>" with params
      | scope   |
      | <scope> |
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | articleNumber | expectedStatusCode | scope |
      | 91    | FX5502        | 400                | ab    |
      | 92    | FX5502        | 400                | 19    |
      | 95    | FX5502        | 400                | kj    |
      | 98    | FX5502        | 400                | 8y    |

  @TEST_PDM-8503 @regression @get
  Scenario Outline: AT API - GET - Verify fetching articles with incorrect fields for all ranges for GET: /{range_id}/articles/articleNumber
    Given I get access token for "main" user
    When I use this <range> to send GET request for endpoint and articleNumber "<articleNumber>" with params
      | fields             |
      | articleNumber, abc |
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | articleNumber | expectedStatusCode |
      | 91    | FX5502        | 400                |
      | 92    | FX5502        | 400                |
      | 95    | FX5502        | 400                |
      | 98    | FX5502        | 400                |

  @TEST_PDM-8505 @regression @get
  Scenario Outline: AT API - GET - Verify fetching articles with correct scope & incorrect fields for all ranges for GET: /{range_id}/articles/articleNumber
    Given I get access token for "main" user
    When I use this <range> to send GET request for endpoint and articleNumber "<articleNumber>" with params
      | scope   | fields             |
      | <scope> | articleNumber, abc |
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | articleNumber | expectedStatusCode | scope |
      | 91    | FX5502        | 400                | 16    |
      | 92    | FX5502        | 400                | 14    |
      | 95    | FX5502        | 400                | 1     |
      | 98    | FX5502        | 400                | 11    |

  @TEST_PDM-9737 @regression @get
  Scenario Outline: AT API - GET - Verify fetching articles with incorrect scope & correct fields for all ranges for GET: /{range_id}/articles/articleNumber
    Given I get access token for "main" user
    When I use this <range> to send GET request for endpoint and articleNumber "<articleNumber>" with params
      | scope   | fields        |
      | <scope> | articleNumber |
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | articleNumber | expectedStatusCode | scope |
      | 91    | FX5502        | 400                | abc   |
      | 92    | FX5502        | 400                | 19    |
      | 95    | FX5502        | 400                | -uga  |
      | 98    | FX5502        | 400                | 032   |

  @TEST_PDM-8504 @regression @get
  Scenario Outline: AT API - GET - Verify fetching articles with incorrect articleNumber for all ranges for GET: /{range_id}/articles/articleNumber
    Given I get access token for "main" user
    When I use this <range> to send GET request for endpoint and articleNumber "<articleNumber>" with params
      | scope   | fields        |
      | <scope> | articleNumber |
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | articleNumber | expectedStatusCode | scope |
      | 91    | abc           | 404                | 16    |
      | 92    | xyz           | 404                | 14    |
      | 95    | -oiu          | 404                | 1     |
      | 98    | =-b           | 404                | 11    |

  @TEST_PDM-9740 @regression @get
  Scenario Outline: AT API - GET - Verify fetching articles with incorrect parameters keys and values for all ranges for GET: /{range_id}/articles/articleNumber
    Given I get access token for "main" user
    When I use this <range> to send GET request for endpoint and articleNumber "<articleNumber>" with params
      | hsbh  | (&**) |
      | -*&^* | NJK   |
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | articleNumber | expectedStatusCode |
      | 91    | FX5502        | 200                |
      | 92    | FX5502        | 200                |
      | 95    | FX5502        | 200                |
      | 98    | FX5502        | 200                |

  @TEST_PDM-9918 @regression @get
  Scenario Outline: AT API - GET - ManualMode - Verify fetching articles with incorrect and null articleNumber for all ranges for GET: /{range_id}/articles/articleNumber/manualmode
    Given I get access token for "main" user
    When I use this <range> to send GET request for endpoint "<endpoint>" and articleNumber "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Examples:
      | endpoint                                     | range | articleNumber | expectedStatusCode |
      | range_articles_by_article_number_manual_mode | 91    | hfth          | 404                |
      | range_articles_by_article_number_manual_mode | 92    | ghyj          | 404                |
      | range_articles_by_article_number_manual_mode | 95    | abc           | 404                |
      | range_articles_by_article_number_manual_mode | 98    | -abc          | 404                |
      | range_articles_by_article_number_manual_mode | 91    |               | 404                |
      | range_articles_by_article_number_manual_mode | 92    |               | 404                |
      | range_articles_by_article_number_manual_mode | 95    |               | 404                |
      | range_articles_by_article_number_manual_mode | 98    |               | 404                |

  @TEST_PDM-9919 @regression @get
  Scenario Outline: AT API - GET - ManualMode - Verify fetching articles for incorrect ranges for GET: /{range_id}/articles/articleNumber/manualmode
    Given I get access token for "main" user
    When I use this <range> to send GET request for endpoint "<endpoint>" and articleNumber "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Examples:
      | endpoint                                     | range | articleNumber   | expectedStatusCode |
      | range_articles_by_article_number_manual_mode | 9     | FX5502          | 200                |
      | range_articles_by_article_number_manual_mode | 99    | FX5502          | 200                |
      | range_articles_by_article_number_manual_mode | 0     | FX5502          | 200                |
      | range_articles_by_article_number_manual_mode | 123   | FX5502          | 200                |

  @TEST_PDM-9920 @regression @get
  Scenario Outline: AT API - GET - Verify fetching articles with invalid token for GET: /{range_id}/articles/articleNumber/manualmode
    When I send "GET" request for <range> range and token "<token>" for manual mode with "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | expectedStatusCode | token             | articleNumber   |
      | 92    | 401                | 4eyJ0eXAiOiJKV1Qi | FX5502          |
      | 91    | 401                | null              | FX5502          |
      | 95    | 401                |                   | FX5502          |
      | 98    | 401                | 4eyJ0eXAiOiJKV1Qi | FX5502          |

  @TEST_PDM-9998 @regression @authentication @get
  Scenario Outline: AT API - GET - Verify fetching articles with incorrect articleNumber without any params for all ranges for GET: /{range_id}/articles/articleNumber
    Given I get access token for "main" user
    When I use this <range> to send GET request for endpoint "<endpoint>" and articleNumber "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Then I validate the Negative response body for <expectedStatusCode>

    Examples:
      | endpoint                         | range | articleNumber | expectedStatusCode |
      | range_articles_by_article_number | 91    | werfwr1       | 404                |
      | range_articles_by_article_number | 92    | werfwr1       | 404                |
      | range_articles_by_article_number | 95    | werfwr1       | 404                |
      | range_articles_by_article_number | 98    | werfwr1       | 404                |