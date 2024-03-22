Feature: Asset Trafficker API feature - PUT Articles positive scenarios

  Background:
    Given I get access token for "main" user

  @TEST_PDM-9570 @put @regression @smoke
  Scenario Outline: AT API - PUT - Verify updating articles for all ranges
    When I use this <range> to send PUT request
      | articleNumber   | dirty | public | highPriority | launchUtc           | brand  |
      | <articleNumber> | false | true   | false        | 2016-02-13 21:17:46 | adidas |
    Then I validate status code <expectedStatusCode>
    And I Validate PUT Response body not null
    Then I validate the data in DB for <range> with provided data
      | articleNumber   | dirty | public | highPriority | launchUtc           | brand  |
      | <articleNumber> | false | true   | false        | 2016-02-13 21:17:46 | adidas |
    Then I Validate Response by json schema "PutResponseSchema.json"
    Then I validate the data in DB for <range> with response body
      | articleNumber   |
      | <articleNumber> |
    Examples:
      | range | expectedStatusCode | articleNumber |
      | 92    | 200                | FY9272        |
      | 91    | 200                | FY9272        |
      | 95    | 200                | FY9272        |
      | 98    | 200                | FY9272        |
      | 92    | 200                | FY9274        |
      | 91    | 200                | FY9274        |
      | 95    | 200                | FY9274        |
      | 98    | 200                | FY9274        |

  @TEST_PDM-10403 @put @regression
  Scenario Outline: Verify AT API when we update/create values in Request body for PUT:/range/articles
    When I use this <range> to send PUT request
      | articleNumber   | public        | highPriority    | launchUtc        | expiryUtc        | brand  |
      | <articleNumber> | <publicValue> | <priorityValue> | <launchUtcValue> | <expiryUtcValue> | ADIDAS |
    Then I validate status code <expectedStatusCode>
    And I Validate PUT Response body not null
    Then I Validate Response by json schema "PutResponseSchema.json"
    Then I validate the data in DB for <range> with provided data
      | articleNumber   | public        | highPriority    | launchUtc        | expiryUtc        | brand  |
      | <articleNumber> | <publicValue> | <priorityValue> | <launchUtcValue> | <expiryUtcValue> | ADIDAS |
    Then I validate the data in DB for <range> with response body
      | articleNumber   |
      | <articleNumber> |
    Examples:
      | range | expectedStatusCode | articleNumber | publicValue | priorityValue | launchUtcValue      | expiryUtcValue      |
      | 91    | 200                | GM0496        | true        | true          | 2016-02-13 21:17:46 | 2016-08-13 21:17:46 |
      | 92    | 200                | GM0496        | false       | false         | 2016-02-13 21:17:46 | 2016-08-13 21:17:46 |
      | 95    | 200                | GM0496        | true        | true          | 2016-02-13 21:17:46 | 2016-08-13 21:17:46 |
      | 98    | 200                | GM0496        | false       | false         | 2016-02-13 21:17:46 | 2016-08-13 21:17:46 |

  @TEST_PDM-10404 @put @regression
  Scenario Outline: Verify AT API when we pass several article Number to create/update in Request Body for PUT:/range/articles
    When I use this <range> to send PUT request
      | articleNumber    | public | highPriority | launchUtc           | brand  |
      | <articleNumber1> | true   | false        | 2016-02-13 21:17:46 | ADIDAS |
      | <articleNumber2> | true   | false        | 2016-02-13 21:17:46 | ADIDAS |
    Then I Validate Response by json schema "PutResponseSchema.json"
    Then I validate status code <expectedStatusCode>
    And I Validate PUT Response body not null
    And I validate the data in DB for <range> with provided data
      | articleNumber    | public | highPriority | launchUtc           | brand  |
      | <articleNumber1> | true   | false        | 2016-02-13 21:17:46 | ADIDAS |
      | <articleNumber2> | true   | false        | 2016-02-13 21:17:46 | ADIDAS |
    And I validate the data in DB for <range> with response body
      | articleNumber    |
      | <articleNumber1> |
      | <articleNumber2> |
    Examples:
      | range | expectedStatusCode | articleNumber1 | articleNumber2 |
      | 91    | 200                | AGS56G         | FX5541         |
      | 92    | 200                | AGS56G         | FX5541         |
      | 95    | 200                | AGS56G         | FX5541         |
      | 98    | 200                | AGS56G         | FX5541         |

  @TEST_PDM-10405 @put @regression
  Scenario Outline: Verify AT API when we pass articles up to 1000 article number to update/create for all ranges for PUT:/range/articles
    When I use this <range> to send PUT request
      | articleNumber |
      | <filter>      |
    Then I validate status code <expectedStatusCode>
    And I Validate PUT Response body not null
    Then I Validate Response by json schema "PutResponseSchema.json"
    Then I validate the data in DB for <range> with provided data
      | articleNumber                        |
      | /requests/20randomArticleNumbers.txt |
    Examples:
      | range | expectedStatusCode | filter                              |
      | 91    | 200                | /requests/1000NewArticleNumbers.txt |
      | 92    | 200                | /requests/1000NewArticleNumbers.txt |
      | 95    | 200                | /requests/1000NewArticleNumbers.txt |
      | 98    | 200                | /requests/1000NewArticleNumbers.txt |