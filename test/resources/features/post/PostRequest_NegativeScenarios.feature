Feature: Asset Trafficker API feature - POST Articles negative scenarios

  Background:
    Given I get access token for "main" user

  @TEST_PDM-10086 @post @regression
  Scenario Outline: AT API - POST - Verify POST articles for wrong ranges
    When I use this wrong "<range>" to send POST request
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | expectedStatusCode |
      | aa    | 500                |
      | null  | 500                |
      |       | 500                |
      | 99    | 500                |

  @TEST_PDM-9834 @post @regression
  Scenario Outline: AT API - POST - Verify AT API Post for "/range/articles"  by fetching 1 incorrect articlesNumber using filter in request body
    When I use this <range> to send POST request with params
      | $filter                        |
      | (articleNumber eq 'GM0sfe497') |
    Then I validate status code <expectedStatusCode>
    Then I Validate POST Response body not null
    Then I validate Articles response body with the data in DB for <range>
    Examples:
      | range | expectedStatusCode |
      | 92    | 200                |
      | 91    | 200                |
      | 95    | 200                |
      | 98    | 200                |

  @TEST_PDM-9835 @post @regression
  Scenario Outline: AT API - POST - Verify AT API Post for "/range/articles"  by fetching more than 1 incorrect articlesNumber using filter in request body
    When I use this <range> to send POST request with params
      | $filter                                                                                                                                                                                             |
      | (articleNumber eq 'GM0sfe497' OR articleNumber eq 'GM8y70498' OR articleNumber eq 'GM0yugu496' OR articleNumber eq 'GN89h9u2236' OR articleNumber eq 'GL04+)(44' OR articleNumber eq 'GNE%^$Y4890') |
    Then I validate status code <expectedStatusCode>
    Then I Validate POST Response body not null
    Then I validate Articles response body with the data in DB for <range>
    Examples:
      | range | expectedStatusCode |
      | 92    | 200                |
      | 91    | 200                |
      | 95    | 200                |
      | 98    | 200                |

  @TEST_PDM-9836 @post @regression
  Scenario Outline: AT API - POST - Verify AT API Post for "/range/articles"  by fetching 100 incorrect articlesNumber using filter in request body
    When I use this <range> to send POST request with params
      | $top | $filter  |
      | 100  | <filter> |
    Then I validate status code <expectedStatusCode>
    Then I Validate POST Response body not null
    Then I validate Articles response body with the data in DB for <range>
    Examples:
      | range | expectedStatusCode | filter                                   |
      | 92    | 200                | /requests/100IncorrectArticleNumbers.txt |
      | 91    | 200                | /requests/100IncorrectArticleNumbers.txt |
      | 95    | 200                | /requests/100IncorrectArticleNumbers.txt |
      | 98    | 200                | /requests/100IncorrectArticleNumbers.txt |

  @TEST_PDM-9837 @post @regression
  Scenario Outline: AT API - POST - Verify AT API Post for "/range/articles"  by fetching more than 100 incorrect articlesNumber using filter in request body
    When I use this <range> to send POST request with params
      | $top | $filter  |
      | 100  | <filter> |
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | expectedStatusCode | filter                                           |
      | 92    | 400                | /requests/moreThan100InCorrectArticleNumbers.txt |
      | 91    | 400                | /requests/moreThan100InCorrectArticleNumbers.txt |
      | 95    | 400                | /requests/moreThan100InCorrectArticleNumbers.txt |
      | 98    | 400                | /requests/moreThan100InCorrectArticleNumbers.txt |

  @TEST_PDM-9838 @post @regression
  Scenario Outline: AT API - POST - Verify AT API Post for "/range/articles" by passing 100 incorrect and 1 correct articleNumber using filter in request body
    When I use this <range> to send POST request with params
      | $top | $filter  |
      | 100  | <filter> |
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | expectedStatusCode | filter                                              |
      | 92    | 400                | /requests/100IncorrectAnd1CorrectArticleNumbers.txt |
      | 91    | 400                | /requests/100IncorrectAnd1CorrectArticleNumbers.txt |
      | 95    | 400                | /requests/100IncorrectAnd1CorrectArticleNumbers.txt |
      | 98    | 400                | /requests/100IncorrectAnd1CorrectArticleNumbers.txt |

  @TEST_PDM-9852 @post @regression
  Scenario Outline: AT API - POST - Verify AT API Post for "/range/articles"  by passing null in filter
    When I use this <range> to send POST request with params
      | $filter |
      |         |
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | expectedStatusCode |
      | 92    | 400                |
      | 91    | 400                |
      | 95    | 400                |
      | 98    | 400                |

  @TEST_PDM-9853 @post @regression
  Scenario Outline: AT API - POST - Verify AT API Post for "/range/articles"  by passing invalid values in filter
    When I use this <range> to send POST request with params
      | $filter |
      | dfbs    |
    Then I validate status code <expectedStatusCode>
    When I use this <range> to send POST request with params
      | $filter         |
      | dirty eq wejnju |
    Then I validate status code <expectedStatusCode>
    When I use this <range> to send POST request with params
      | $filter        |
      | public eq eadf |
    Then I validate status code <expectedStatusCode>
    When I use this <range> to send POST request with params
      | $filter                |
      | highPriority eq o9iu89 |
    Then I validate status code <expectedStatusCode>
    When I use this <range> to send POST request with params
      | $filter       |
      | dirty eq efew |
    Then I validate status code <expectedStatusCode>
    When I use this <range> to send POST request with params
      | $filter             |
      | launchUtc eq wejnju |
    Then I validate status code <expectedStatusCode>
    When I use this <range> to send POST request with params
      | $filter               |
      | manualMode eq 8yfeguf |
    Then I validate status code <expectedStatusCode>
    When I use this <range> to send POST request with params
      | $filter             |
      | deliveries eq 9ieuh |
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | expectedStatusCode |
      | 92    | 400                |
      | 91    | 400                |
      | 95    | 400                |
      | 98    | 400                |

  @TEST_PDM-9846 @post @regression
  Scenario Outline: AT API - POST - Verify POST for "/range/articles" with invalid "$top" values
    When I use this <range> to send POST request with params
      | $top  |
      | <top> |
    Then I validate status code <expectedStatusCode>
    Then I Validate POST Response body not null
    Then I validate Articles response body with the data in DB for <range>
    Examples:
      | range | expectedStatusCode | top |
      | 92    | 400                | abc |
      | 91    | 400                | abc |
      | 95    | 400                | abc |
      | 98    | 400                | abc |
      | 92    | 400                |     |
      | 91    | 400                |     |
      | 95    | 400                |     |
      | 98    | 400                |     |
      | 92    | 400                | -10 |
      | 91    | 400                | -10 |
      | 95    | 400                | -10 |
      | 98    | 400                | -10 |

  @TEST_PDM-9847 @post @regression
  Scenario Outline: AT API - POST - Verify POST for "/range/articles" with invalid "scope" values
    When I use this <range> to send POST request with params
      | scope   | fields                                                                                                     |
      | <scope> | articleNumber,dirty, highPriority,public,launchUtc,attempt,manualMode, manualModeUser, deliveries,metadata |
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | expectedStatusCode | scope |
      | 92    | 400                | abc   |
      | 91    | 400                | abc   |
      | 95    | 400                | abc   |
      | 98    | 400                | abc   |
      | 92    | 400                | -10   |
      | 91    | 400                | 19    |
      | 95    | 400                | 100   |
      | 98    | 400                | -(&*) |

  @TEST_PDM-9848 @post @regression
  Scenario Outline: AT API - POST - Verify POST for "/range/articles" with null in "scope" values
    When I use this <range> to send POST request with params
      | scope   | fields                                                                                                     |
      | <scope> | articleNumber,dirty, highPriority,public,launchUtc,attempt,manualMode, manualModeUser, deliveries,metadata |
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | expectedStatusCode | scope |
      | 92    | 200                |       |
      | 91    | 200                |       |
      | 95    | 200                |       |
      | 98    | 200                |       |

  @TEST_PDM-9849 @post @regression
  Scenario Outline: AT API - POST - Verify POST for "/range/articles" with correct scopes which are not configured for range
    When I use this <range> to send POST request with params
      | scope   | fields                                                                                                     |
      | <scope> | articleNumber,dirty, highPriority,public,launchUtc,attempt,manualMode, manualModeUser, deliveries,metadata |
    Then I validate status code <expectedStatusCode>
    Then I Validate POST Response body not null
    Then I validate Articles response body with the data in DB for <range>
    Then I validate Deliveries and Metadata fields are empty in response for articles
    Examples:
      | range | expectedStatusCode | scope |
      | 92    | 200                | 1     |
      | 91    | 200                | 3     |
      | 95    | 200                | 14    |
      | 98    | 200                | 16    |

  @TEST_PDM-9851 @post @regression
  Scenario Outline: AT API - POST - Verify POST for "/range/articles" with invalid and null "$skip" values
    When I use this <range> to send POST request with params
      | $skip    |
      | "<skip>" |
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | expectedStatusCode | skip |
      | 92    | 400                | gfh  |
      | 91    | 400                | 7t68 |
      | 95    | 400                | &(*  |
      | 98    | 400                | -76  |
      | 92    | 400                |      |
      | 91    | 400                |      |
      | 95    | 400                |      |
      | 98    | 400                |      |

  @TEST_PDM-9855 @post @regression
  Scenario Outline: AT API - POST - Verify POST for "/range/articles" with invalid field values
    When I use this <range> to send POST request with params
      | fields              |
      | hjgvjhy, jhgvghvguj |
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | expectedStatusCode |
      | 92    | 400                |
      | 91    | 400                |
      | 95    | 400                |
      | 98    | 400                |

  @TEST_PDM-9856 @post @regression
  Scenario Outline: AT API - POST - Verify POST for "/range/articles" with null field values
    When I use this <range> to send POST request with params
      | fields |
      |        |
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | expectedStatusCode |
      | 92    | 200                |
      | 91    | 200                |
      | 95    | 200                |
      | 98    | 200                |

  @TEST_PDM-9965 @post @regression
  Scenario Outline: AT API - POST - Verify AT API Post for "/range/articles"  by fetching articlesNumber using invalid orderby filter
    When I use this <range> to send POST request with params
      | $orderby          |
      | manualMode hasccg |
    Then I validate status code <expectedStatusCode>
    When I use this <range> to send POST request with params
      | $orderby       |
      | articlehbd asc |
    Then I validate status code <expectedStatusCode>
    When I use this <range> to send POST request with params
      | $orderby   |
      | dirty ascd |
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | expectedStatusCode |
      | 92    | 400                |
      | 91    | 400                |
      | 95    | 400                |
      | 98    | 400                |

  @TEST_PDM-9940 @regression @post
  Scenario Outline: AT API - POST - Verify POST: "/manualMode" with article having less than 2 images
    When I use this <range> and this "<articleNumber>" to send POST Manual Mode request
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | articleNumber | expectedStatusCode |
      | 91    | GM0497        | 400                |
      | 95    | GM0496        | 400                |

  @TEST_PDM-9941 @regression @post
  Scenario Outline: AT API - POST - Verify POST: "/manualMode" For Unsupported Ranges:  92, 98
    When I use this <range> and this "<articleNumber>" to send POST Manual Mode request
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | articleNumber | expectedStatusCode |
      | 92    | GN4890        | 403                |
      | 98    | GN4890        | 403                |

  @TEST_PDM-9942 @regression @post
  Scenario Outline: AT API - POST - Verify POST: "/manualMode" Without and Invalid Token
    When I send "POST" request for <range> range and token "<token>"
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | expectedStatusCode | token             |
      | 91    | 401                | 4eyJ0eXAiOiJKV1Qi |
      | 92    | 401                | null              |
      | 95    | 401                |                   |
      | 98    | 401                | 4eyJ0eXAiOiJKV1Qi |

  @TEST_PDM-9943 @regression @post
  Scenario Outline: AT API - POST - Verify POST: "/manualMode" With invalid, null and long article number
    When I use this <range> and this "<articleNumber>" to send POST Manual Mode request
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | articleNumber  | expectedStatusCode |
      | 91    | GN489000       | 404                |
      | 95    | GNGN2236       | 404                |
      | 91    |                | 405                |
      | 95    |                | 405                |
      | 91    | GNFAKJHD489000 | 404                |
      | 95    | ABCAKJHD489000 | 404                |
      | 91    | F-79@79        | 404                |
      | 95    | F-79@79        | 404                |
      | 91    | ZZZZZZ         | 404                |
      | 95    | ZZZZZZ         | 404                |

  @TEST_PDM-10041 @post @regression
  Scenario Outline: AT API - POST - Verify POST articles for all ranges with Incorrect Content-Type
    When I use this <range> to send POST request with Incorrect Content-Type
    Then I validate status code <expectedStatusCode>
    Then I validate the Negative response body for <expectedStatusCode>
    Examples:
      | range | expectedStatusCode |
      | 92    | 415                |
      | 91    | 415                |
      | 95    | 415                |
      | 98    | 415                |