Feature: Asset Trafficker API feature - PUT Articles negative scenarios

  @TEST_PDM-10377 @put @regression
  Scenario Outline: Verify AT API when we pass correct Article Number and incorrect brand name for PUT:/range/articles
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber   | brand   |
      | <articleNumber> | <brand> |
    Then I validate status code <expectedStatusCode>
    Then I validate the Negative response body for <expectedStatusCode>
    Examples:
      | range | expectedStatusCode | articleNumber | brand  |
      | 91    | 400                | AGS56G        | abc    |
      | 92    | 400                | AGS56G        | xsx    |
      | 95    | 400                | AGS56G        | scc    |
      | 98    | 400                | AGS56G        | cew    |
      | 91    | 400                | AGS56G        | Reebok |
      | 92    | 400                | AGS56G        | Reebok |
      | 95    | 400                | AGS56G        | Reebok |
      | 98    | 400                | AGS56G        | Reebok |

  @TEST_PDM-10378 @put @regression
  Scenario Outline: Verify AT API when we pass null in Article Number for PUT:/range/articles
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber   |
      | <articleNumber> |
    Then I validate status code <expectedStatusCode>
    Then I validate the Negative response body for <expectedStatusCode>
    Examples:
      | range | expectedStatusCode | articleNumber |
      | 91    | 400                |               |
      | 92    | 400                |               |
      | 95    | 400                |               |
      | 98    | 400                |               |

  @TEST_PDM-10379 @put @regression
  Scenario Outline: Verify AT API when we pass incorrect brand name for PUT:/range/articles
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber   | brand   |
      | <articleNumber> | <brand> |
    Then I validate status code <expectedStatusCode>
    Then I validate the Negative response body for <expectedStatusCode>
    Examples:
      | range | expectedStatusCode | articleNumber | brand  |
      | 91    | 400                | AGS56G        | Reebok |
      | 92    | 400                | AGS56G        | Reebok |
      | 95    | 400                | AGS56G        | Reebok |
      | 98    | 400                | AGS56G        | Reebok |
      | 91    | 400                | AGS56G        | adi    |
      | 92    | 400                | AGS56G        | adi    |
      | 95    | 400                | AGS56G        | adi    |
      | 98    | 400                | AGS56G        | adi    |

  @TEST_PDM-10380 @put @regression
  Scenario Outline: Verify AT API when we pass invalid public value in Request body for PUT:/range/articles
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber   | public        |
      | <articleNumber> | <publicValue> |
    Then I validate status code <expectedStatusCode>
    Then I validate the Negative response body for <expectedStatusCode>
    Examples:
      | range | expectedStatusCode | articleNumber | publicValue |
      | 91    | 400                | FY9272        | xyz         |
      | 92    | 400                | FY9272        | 12          |
      | 95    | 400                | FY9272        | abc         |
      | 98    | 400                | FY9272        | 00          |

  @TEST_PDM-10381 @put @regression
  Scenario Outline: Verify AT API when we pass invalid dirty value in Request body for PUT:/range/articles
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber   | dirty        | public | highPriority | launchUtc           | brand  |
      | <articleNumber> | <dirtyValue> | true   | false        | 2016-02-13 21:17:46 | adidas |
    Then I validate status code <expectedStatusCode>
    Then I validate the Negative response body for <expectedStatusCode>
    Examples:
      | range | expectedStatusCode | articleNumber | dirtyValue |
      | 91    | 400                | FY9272        | 00         |
      | 92    | 400                | FY9272        | 12         |
      | 95    | 400                | FY9272        | abc        |
      | 98    | 400                | FY9272        | xyz        |

  @TEST_PDM-10382 @put @regression
  Scenario Outline: Verify AT API when we pass invalid high priority value in Request body for PUT:/range/articles
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber   | highPriority        |
      | <articleNumber> | <highPriorityValue> |
    Then I validate status code <expectedStatusCode>
    Then I validate the Negative response body for <expectedStatusCode>
    Examples:
      | range | expectedStatusCode | articleNumber | highPriorityValue |
      | 91    | 400                | FY9272        | 00                |
      | 92    | 400                | FY9272        | 12                |
      | 95    | 400                | FY9272        | abc               |
      | 98    | 400                | FY9272        | xyz               |

  @TEST_PDM-10398 @put @regression
  Scenario Outline: Verify AT API when we pass invalid launch utc value in Request body for PUT:/range/articles
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber   | launchUtc        |
      | <articleNumber> | <launchUtcValue> |
    Then I validate status code <expectedStatusCode>
    Then I validate the Negative response body for <expectedStatusCode>
    Examples:
      | range | expectedStatusCode | articleNumber | launchUtcValue |
      | 91    | 400                | FY9272        | 00             |
      | 92    | 400                | FY9272        | 12             |
      | 95    | 400                | FY9272        | abc            |
      | 98    | 400                | FY9272        | xyz            |

  @TEST_PDM-10399 @put @regression
  Scenario Outline: Verify AT API when we pass invalid expiry utc value in Request body for PUT:/range/articles
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber   | expiryUtc        |
      | <articleNumber> | <expiryUtcValue> |
    Then I validate status code <expectedStatusCode>
    Then I validate the Negative response body for <expectedStatusCode>
    Examples:
      | range | expectedStatusCode | articleNumber | expiryUtcValue |
      | 91    | 400                | FY9272        | 00             |
      | 92    | 400                | FY9272        | 12             |
      | 95    | 400                | FY9272        | abc            |
      | 98    | 400                | FY9272        | xyz            |

  @TEST_PDM-10400 @put @regression
  Scenario Outline: Verify AT API when we pass duplicate Article Number in Request Body for PUT:/range/articles
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber   |
      | <articleNumber> |
      | <articleNumber> |
    Then I validate status code <expectedStatusCode>
    Then I validate the Negative response body for <expectedStatusCode>
    Examples:
      | range | expectedStatusCode | articleNumber |
      | 91    | 400                | AGS56G        |
      | 92    | 400                | AGS56G        |
      | 95    | 400                | AGS56G        |
      | 98    | 400                | AGS56G        |

  @TEST_PDM-10406 @put @regression
  Scenario Outline: Verify AT API when we select incorrect Content-Type for PUT:/range/articles
    Given I get access token for "main" user
    When I use this <range> to send PUT request for incorrect content type
      | articleNumber |
      | GL1438        |
    Then I validate status code <expectedStatusCode>
    Then I validate the Negative response body for <expectedStatusCode>

    Examples:
      | range | expectedStatusCode |
      | 91    | 415                |
      | 92    | 415                |
      | 95    | 415                |
      | 98    | 415                |

  @TEST_PDM-10401 @put @regression
  Scenario Outline: Verify AT API with user having read only access for for PUT:/range/articles
    Given I get access token for "rst" user
    When I use this <range> to send PUT request
      | articleNumber   |
      | <articleNumber> |
    Then I validate status code <expectedStatusCode>
    Then I validate the Negative response body for <expectedStatusCode>
    Examples:
      | range | expectedStatusCode | articleNumber |
      | 91    | 403                | GL1438        |
      | 92    | 403                | GL1438        |
      | 95    | 403                | GL1438        |
      | 98    | 403                | GL1438        |

  @TEST_PDM-10402 @put @regression
  Scenario Outline: Verify AT API when we pass more than 1000 article number for all ranges for PUT:/range/articles
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber |
      | <filter>      |
    Then I validate status code <expectedStatusCode>
    Then I validate the Negative response body for <expectedStatusCode>
    Examples:
      | range | expectedStatusCode | filter                              |
      | 91    | 400                | /requests/1001NewArticleNumbers.txt |
      | 92    | 400                | /requests/1001NewArticleNumbers.txt |
      | 95    | 400                | /requests/1001NewArticleNumbers.txt |
      | 98    | 400                | /requests/1001NewArticleNumbers.txt |

  @TEST_PDM-10407 @put
  Scenario Outline: Verify AT API when we pass invalid fields with Article Number in request body for PUT:/range/articles
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber   | abc   | xyz  |
      | <articleNumber> | false | true |
    Then I validate status code <expectedStatusCode>
    Then I validate the Negative response body for <expectedStatusCode>
    Examples:
      | range | expectedStatusCode | articleNumber |
      | 91    | 400                | GL1438        |
      | 92    | 400                | GL1438        |
      | 95    | 400                | GL1438        |
      | 98    | 400                | GL1438        |