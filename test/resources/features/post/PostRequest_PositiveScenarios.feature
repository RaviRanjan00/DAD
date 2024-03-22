Feature: Asset Trafficker API feature - POST Articles positive scenarios

  Background:
    Given I get access token for "main" user

  @TEST_PDM-9562 @post @regression @smoke
  Scenario Outline: AT API - POST - Verify POST articles for all ranges
    When I use this <range> to send POST request
    Then I validate status code <expectedStatusCode>
    Then I Validate POST Response body not null
    Examples:
      | range | expectedStatusCode |
      | 92    | 200                |
      | 91    | 200                |
      | 95    | 200                |
      | 98    | 200                |

  @TEST_PDM-9565 @post @regression
  Scenario Outline: AT API - POST - Verify POST articles with parameters
    When I use this <range> to send POST request with params
      | fields        | $top | $skip | $orderby          | $scope |
      | articleNumber | 2    | 1     | articleNumber asc | pim-us |
    Then I validate status code <expectedStatusCode>
    Then I Validate Articles Response body having fields "articleNumber"
    Examples:
      | range | expectedStatusCode |
      | 92    | 200                |
      | 91    | 200                |
      | 95    | 200                |
      | 98    | 200                |

  @TEST_PDM-9859 @post @regression
  Scenario Outline: AT API - POST - Verify POST for "/range/articles" with different "$top" values between 1 to 1000
    When I use this <range> to send POST request with params
      | $top  |
      | <top> |
    Then I validate status code <expectedStatusCode>
    Then I Validate POST Response body not null
    Then I validate Articles response body with the data in DB for <range>
    Examples:
      | range | expectedStatusCode | top |
      | 92    | 200                | 5   |
      | 91    | 200                | 5   |
      | 95    | 200                | 5   |
      | 98    | 200                | 5   |
      | 92    | 200                | 70  |
      | 91    | 200                | 70  |
      | 95    | 200                | 70  |
      | 98    | 200                | 70  |

  @TEST_PDM-9860 @post @regression
  Scenario Outline: AT API - POST - Verify AT API Post for "/range/articles"  by fetching 1 correct articlesNumber using filter in request body
    When I use this <range> to send POST request with params
      | $filter                     |
      | (articleNumber eq 'GM0497') |
    Then I validate status code <expectedStatusCode>
    Then I Validate POST Response body not null
    Then I validate Articles response body with the data in DB for <range>
    Examples:
      | range | expectedStatusCode |
      | 92    | 200                |
      | 91    | 200                |
      | 95    | 200                |
      | 98    | 200                |

  @TEST_PDM-9832 @post @regression
  Scenario Outline: AT API - POST - Verify AT API Post for "/range/articles"  by fetching more than 1 correct articlesNumber using filter in request body
    When I use this <range> to send POST request with params
      | $filter                                                                                                                                                                      |
      | (articleNumber eq 'GM0497' OR articleNumber eq 'GM0498' OR articleNumber eq 'GM0496' OR articleNumber eq 'GN2236' OR articleNumber eq 'GL0444' OR articleNumber eq 'GN4890') |
    Then I validate status code <expectedStatusCode>
    Then I Validate POST Response body not null
    Then I validate Articles response body with the data in DB for <range>
    Examples:
      | range | expectedStatusCode |
      | 92    | 200                |
      | 91    | 200                |
      | 95    | 200                |
      | 98    | 200                |

  @TEST_PDM-9833 @post @regression
  Scenario Outline: AT API - POST - Verify AT API Post for "/range/articles"  by fetching 100 correct articlesNumber using filter in request body
    When I use this <range> to send POST request with params
      | $top | $filter  |
      | 100  | <filter> |
    Then I validate status code <expectedStatusCode>
    Then I Validate POST Response body not null
    Then I validate Articles response body with the data in DB for <range>
    Examples:
      | range | expectedStatusCode | filter                                 |
      | 92    | 200                | /requests/100CorrectArticleNumbers.txt |
      | 91    | 200                | /requests/100CorrectArticleNumbers.txt |
      | 95    | 200                | /requests/100CorrectArticleNumbers.txt |
      | 98    | 200                | /requests/100CorrectArticleNumbers.txt |

  @TEST_PDM-9845 @post @regression
  Scenario Outline: AT API - POST - Verify AT API Post for "/range/articles"  with configured scope for the given range
    When I use this <range> to send POST request with params
      | scope   | fields                                                                                                     |
      | <scope> | articleNumber,dirty, highPriority,public,launchUtc,attempt,manualMode, manualModeUser, deliveries,metadata |
    Then I validate status code <expectedStatusCode>
    Then I Validate POST Response body not null
    Then I validate Articles response body with the data in DB for <range>
    Then I validate Deliveries data in response body with the data in DB for <range> and <scope>
    Then I validate Metadata data in response body with the data in DB for <range> and <scope>
    Examples:
      | range | expectedStatusCode | scope |
      | 92    | 200                | 14    |
      | 91    | 200                | 16    |
      | 91    | 200                | 13    |
      | 95    | 200                | 1     |
      | 95    | 200                | 3     |
      | 95    | 200                | 5     |
      | 95    | 200                | 7     |
      | 98    | 200                | 11    |

  @TEST_PDM-9850 @post @regression
  Scenario Outline: AT API - POST - Verify POST for "/range/articles" with different "$skip" values
    When I use this <range> to send POST request with params
      | $skip  |
      | <skip> |
    Then I validate status code <expectedStatusCode>
    Then I Validate POST Response body not null
    Then I Validate skipped <skip> Article Numbers in response with DB for <range>
    Then I validate Articles response body with the data in DB for <range>
    Examples:
      | range | expectedStatusCode | skip |
      | 92    | 200                | 5    |
      | 91    | 200                | 135  |
      | 95    | 200                | 76   |
      | 98    | 200                | 357  |

  @TEST_PDM-9854 @post @regression
  Scenario Outline: AT API - POST - Verify POST for "/range/articles" with multiple field values
    When I use this <range> to send POST request with params
      | fields                                                                |
      | articleNumber,dirty, highPriority,public,launchUtc,attempt,manualMode |
    Then I validate status code <expectedStatusCode>
    Then I Validate Articles Response body having fields "articleNumber,dirty, highPriority,public,launchUtc,attempt,manualMode"
    Then I validate Articles response body with the data in DB for <range>
    Then I validate Deliveries and Metadata fields are empty in response for articles
    Examples:
      | range | expectedStatusCode |
      | 92    | 200                |
      | 91    | 200                |
      | 95    | 200                |
      | 98    | 200                |

  @TEST_PDM-9857 @post @regression
  Scenario Outline: AT API - POST - Verify AT API Post for "/range/articles"  by fetching articlesNumber using dirty filter
    When I use this <range> to send POST request with params
      | $filter         |
      | (dirty eq true) |
    Then I validate status code <expectedStatusCode>
    Then I Validate POST Response body not null
    Then I validate Articles response body with the data in DB for <range>
    Then I validate "Dirty" value in response as "true"
    Examples:
      | range | expectedStatusCode |
      | 92    | 200                |
      | 91    | 200                |
      | 95    | 200                |
      | 98    | 200                |

  @TEST_PDM-9858 @post @regression
  Scenario Outline: AT API - POST - Verify AT API Post for "/range/articles"  by fetching articlesNumber using highPriority filter
    When I use this <range> to send POST request with params
      | $filter                 |
      | (highPriority eq false) |
    Then I validate status code <expectedStatusCode>
    Then I Validate POST Response body not null
    Then I validate Articles response body with the data in DB for <range>
    Then I validate "highPriority" value in response as "false"
    Examples:
      | range | expectedStatusCode |
      | 92    | 200                |
      | 91    | 200                |
      | 95    | 200                |
      | 98    | 200                |

  @TEST_PDM-9886 @post @regression
  Scenario Outline: AT API - POST - Verify AT API Post for "/range/articles"  by fetching articlesNumber using manualMode filter
    When I use this <range> to send POST request with params
      | $filter               |
      | (manualMode eq false) |
    Then I validate status code <expectedStatusCode>
    Then I Validate POST Response body not null
    Then I validate Articles response body with the data in DB for <range>
    Then I validate "manualMode" value in response as "false"
    Examples:
      | range | expectedStatusCode |
      | 92    | 200                |
      | 91    | 200                |
      | 95    | 200                |
      | 98    | 200                |

  @TEST_PDM-9887 @post @regression
  Scenario Outline: AT API - POST - Verify AT API Post for "/range/articles"  by fetching articlesNumber using public filter
    When I use this <range> to send POST request with params
      | $filter           |
      | (public eq false) |
    Then I validate status code <expectedStatusCode>
    Then I Validate POST Response body not null
    Then I validate Articles response body with the data in DB for <range>
    Then I validate "public" value in response as "false"
    Examples:
      | range | expectedStatusCode |
      | 92    | 200                |
      | 91    | 200                |
      | 95    | 200                |
      | 98    | 200                |

  @TEST_PDM-9959 @post @regression
  Scenario Outline: AT API - POST - Verify AT API Post for "/range/articles"  by fetching articlesNumber using orderby articleNumber filter
    When I use this <range> to send POST request with params
      | $orderby          |
      | articleNumber asc |
    Then I validate status code <expectedStatusCode>
    Then I Validate POST Response body not null
    Then I validate "articleNumber" value in response in "asc" order with db for <range>
    Then I validate Articles response body with the data in DB for <range>
    Examples:
      | range | expectedStatusCode |
      | 92    | 200                |
      | 91    | 200                |
      | 95    | 200                |
      | 98    | 200                |

  @TEST_PDM-9960 @post @regression
  Scenario Outline: AT API - POST - Verify AT API Post for "/range/articles"  by fetching articlesNumber using orderby dirty filter
    When I use this <range> to send POST request with params
      | $orderby   |
      | dirty desc |
    Then I validate status code <expectedStatusCode>
    Then I Validate POST Response body not null
    Then I validate "dirty" value in response in "desc" order with db for <range>
    Then I validate Articles response body with the data in DB for <range>
    Examples:
      | range | expectedStatusCode |
      | 92    | 200                |
      | 91    | 200                |
      | 95    | 200                |
      | 98    | 200                |

  @TEST_PDM-9961 @post @regression
  Scenario Outline: AT API - POST - Verify AT API Post for "/range/articles"  by fetching articlesNumber using orderby highPriority filter
    When I use this <range> to send POST request with params
      | $orderby         |
      | highPriority asc |
    Then I validate status code <expectedStatusCode>
    Then I Validate POST Response body not null
    Then I validate "highPriority" value in response in "asc" order with db for <range>
    Then I validate Articles response body with the data in DB for <range>
    Examples:
      | range | expectedStatusCode |
      | 92    | 200                |
      | 91    | 200                |
      | 95    | 200                |
      | 98    | 200                |

  @TEST_PDM-9962 @post @regression
  Scenario Outline: AT API - POST - Verify AT API Post for "/range/articles"  by fetching articlesNumber using orderby public filter
    When I use this <range> to send POST request with params
      | $orderby    |
      | public desc |
    Then I validate status code <expectedStatusCode>
    Then I Validate POST Response body not null
    Then I validate "public" value in response in "desc" order with db for <range>
    Then I validate Articles response body with the data in DB for <range>
    Examples:
      | range | expectedStatusCode |
      | 92    | 200                |
      | 91    | 200                |
      | 95    | 200                |
      | 98    | 200                |

  @TEST_PDM-9963 @post @regression
  Scenario Outline: AT API - POST - Verify AT API Post for "/range/articles"  by fetching articlesNumber using orderby launchUtc filter
    When I use this <range> to send POST request with params
      | $orderby      |
      | launchUtc asc |
    Then I validate status code <expectedStatusCode>
    Then I Validate POST Response body not null
    Then I validate "launchUtc" value in response in "asc" order with db for <range>
    Then I validate Articles response body with the data in DB for <range>
    Examples:
      | range | expectedStatusCode |
      | 92    | 200                |
      | 91    | 200                |
      | 95    | 200                |
      | 98    | 200                |

  @TEST_PDM-9964 @post @regression
  Scenario Outline: AT API - POST - Verify AT API Post for "/range/articles"  by fetching articlesNumber using orderby manualMode filter
    When I use this <range> to send POST request with params
      | $orderby        |
      | manualMode desc |
    Then I validate status code <expectedStatusCode>
    Then I Validate POST Response body not null
    Then I validate "manualMode" value in response in "desc" order with db for <range>
    Then I validate Articles response body with the data in DB for <range>
    Examples:
      | range | expectedStatusCode |
      | 92    | 200                |
      | 91    | 200                |
      | 95    | 200                |
      | 98    | 200                |

  @TEST_PDM-9939 @regression @post
  Scenario Outline: AT API - POST - Verify POST: "/manualMode" with article having more than 1 image and supported ranges: 91, 95
    When I use this <range> and this "<articleNumber>" to send POST Manual Mode request
    Then I validate status code <expectedStatusCode>
    Then I Validate POST Response by json schema "manualModeSchema.json"
    Then I Validate POST Response body having fields "articleNumber,dirty,manualMode"
    Then I Validate Deliveries fields in DB for <range> and <scope>
    Then I validate response body with the data in DB for <range> and "<articleNumber>" of range_articles_by_article_number endpoint
    Examples:
      | range | articleNumber | expectedStatusCode | scope |
      | 91    | GN2236        | 200                | 16    |
      | 95    | GJ2716        | 200                | 1     |