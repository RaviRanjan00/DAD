Feature: Asset Trafficker API feature - Authorization all scenarios (positive and negative)

  @TEST_PDM-9578 @regression @smoke @authorization @get
  Scenario Outline: AT API - Authorization With <userType> permissions GET: /{range_id}/articles - Verify Authorization With <userType> permission and range <range>
    Given I get access token for "<userType>" user
    When I use this <range> to send GET request
    Then I validate status code <expectedStatusCode>
    Examples:
      | userType | range | expectedStatusCode |
      | main     | 91    | 200                |
      | main     | 92    | 200                |
      | main     | 95    | 200                |
      | main     | 98    | 200                |
      | rst      | 91    | 200                |
      | rst      | 92    | 200                |
      | rst      | 95    | 200                |
      | rst      | 98    | 200                |
      | ust      | 91    | 200                |
      | ust      | 92    | 200                |
      | ust      | 95    | 200                |
      | ust      | 98    | 200                |
      | dst      | 91    | 403                |
      | dst      | 92    | 403                |
      | dst      | 95    | 403                |
      | dst      | 98    | 403                |
      | rpst     | 91    | 403                |
      | rpst     | 92    | 403                |
      | rpst     | 95    | 403                |
      | rpst     | 98    | 403                |
      | all_95   | 91    | 403                |
      | all_95   | 92    | 403                |
      | all_95   | 95    | 200                |
      | all_95   | 98    | 403                |

  @TEST_PDM-9579 @regression @authorization @post
  Scenario Outline: AT API - Authorization With <userType> permissions POST: /{range_id}/articles - Verify Authorization With <userType> permission and range <range>
    Given I get access token for "<userType>" user
    When I use this <range> to send POST request
    Then I validate status code <expectedStatusCode>
    Examples:
      | userType | range | expectedStatusCode |
      | main     | 91    | 200                |
      | main     | 92    | 200                |
      | main     | 95    | 200                |
      | main     | 98    | 200                |
      | rst      | 91    | 200                |
      | rst      | 92    | 200                |
      | rst      | 95    | 200                |
      | rst      | 98    | 200                |
      | ust      | 91    | 200                |
      | ust      | 92    | 200                |
      | ust      | 95    | 200                |
      | ust      | 98    | 200                |
      | dst      | 91    | 403                |
      | dst      | 92    | 403                |
      | dst      | 95    | 403                |
      | dst      | 98    | 403                |
      | rpst     | 91    | 403                |
      | rpst     | 92    | 403                |
      | rpst     | 95    | 403                |
      | rpst     | 98    | 403                |
      | all_95   | 91    | 403                |
      | all_95   | 92    | 403                |
      | all_95   | 95    | 200                |
      | all_95   | 98    | 403                |

  @TEST_PDM-9580 @regression @authorization @put
  Scenario Outline: AT API - Authorization With <userType> permissions PUT: /{range_id}/articles - Verify Authorization With <userType> permission and range <range>
    Given I get access token for "<userType>" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | launchUtc           | brand  |
      | DZ1391        | false | true   | false        | 2016-02-13 21:17:46 | adidas |
    Then I validate status code <expectedStatusCode>
    Examples:
      | userType | range | expectedStatusCode |
      | main     | 91    | 200                |
      | main     | 92    | 200                |
      | main     | 95    | 200                |
      | main     | 98    | 200                |
      | rst      | 91    | 403                |
      | rst      | 92    | 403                |
      | rst      | 95    | 403                |
      | rst      | 98    | 403                |
      | ust      | 91    | 200                |
      | ust      | 92    | 200                |
      | ust      | 95    | 200                |
      | ust      | 98    | 200                |
      | dst      | 91    | 403                |
      | dst      | 92    | 403                |
      | dst      | 95    | 403                |
      | dst      | 98    | 403                |
      | rpst     | 91    | 200                |
      | rpst     | 92    | 200                |
      | rpst     | 95    | 200                |
      | rpst     | 98    | 200                |
      | all_95   | 91    | 403                |
      | all_95   | 92    | 403                |
      | all_95   | 95    | 200                |
      | all_95   | 98    | 403                |


  @TEST_PDM-9581 @regression @authorization @delete
  Scenario Outline: AT API - Authorization With <userType> permissions DELETE: /{range_id}/articles - Verify Authorization With <userType> permission and range <range>
    Given I get access token for "<userType>" user
    When I use this <range> to send DELETE request
      | articleNumber |
      | DZ1391        |
    Then I validate status code <expectedStatusCode>
    Examples:
      | userType | range | expectedStatusCode |
      | main     | 91    | 200                |
      | main     | 92    | 200                |
      | main     | 95    | 200                |
      | main     | 98    | 200                |
      | rst      | 91    | 403                |
      | rst      | 92    | 403                |
      | rst      | 95    | 403                |
      | rst      | 98    | 403                |
      | ust      | 91    | 403                |
      | ust      | 92    | 403                |
      | ust      | 95    | 403                |
      | ust      | 98    | 403                |
      | dst      | 91    | 200                |
      | dst      | 92    | 200                |
      | dst      | 95    | 200                |
      | dst      | 98    | 200                |
      | rpst     | 91    | 403                |
      | rpst     | 92    | 403                |
      | rpst     | 95    | 403                |
      | rpst     | 98    | 403                |
      | all_95   | 91    | 403                |
      | all_95   | 92    | 403                |
      | all_95   | 95    | 200                |
      | all_95   | 98    | 403                |

  @TEST_PDM-9582 @regression @authorization @get
  Scenario Outline: AT API - Authorization With <userType> permissions GET: /{range_id}/articles/{articleNumber} - Verify Authorization With <userType> permission and range <range>
    Given I get access token for "<userType>" user
    When I use this <range> to send GET request with "<articleNumber>" article number
    Then I validate status code <expectedStatusCode>
    Examples:
      | userType | range | articleNumber | expectedStatusCode |
      | main     | 91    | FW6688        | 200                |
      | main     | 92    | FW6688        | 200                |
      | main     | 95    | FW6688        | 200                |
      | main     | 98    | FW6688        | 200                |
      | rst      | 91    | FW6688        | 200                |
      | rst      | 92    | FW6688        | 200                |
      | rst      | 95    | FW6688        | 200                |
      | rst      | 98    | FW6688        | 200                |
      | ust      | 91    | FW6688        | 200                |
      | ust      | 92    | FW6688        | 200                |
      | ust      | 95    | FW6688        | 200                |
      | ust      | 98    | FW6688        | 200                |
      | dst      | 91    | FW6688        | 403                |
      | dst      | 92    | FW6688        | 403                |
      | dst      | 95    | FW6688        | 403                |
      | dst      | 98    | FW6688        | 403                |
      | rpst     | 91    | FW6688        | 403                |
      | rpst     | 92    | FW6688        | 403                |
      | rpst     | 95    | FW6688        | 403                |
      | rpst     | 98    | FW6688        | 403                |
      | all_95   | 91    | FW6688        | 403                |
      | all_95   | 92    | FW6688        | 403                |
      | all_95   | 95    | FW6688        | 200                |
      | all_95   | 98    | FW6688        | 403                |


  @TEST_PDM-9583 @regression @authorization @patch
  Scenario Outline: AT API - Authorization With <userType> permissions PATCH: /{range_id}/articles/{articleNumber} - Verify Authorization With <userType> permission and range <range>
    Given I get access token for "<userType>" user
    When I use this <range> to send PATCH request
      | articleNumber | dirty |
      | AH2203        | false |
    Then I validate status code <expectedStatusCode>
    Examples:
      | userType | range | expectedStatusCode |
      | main     | 91    | 200                |
      | main     | 92    | 200                |
      | main     | 95    | 200                |
      | main     | 98    | 200                |
      | rst      | 91    | 403                |
      | rst      | 92    | 403                |
      | rst      | 95    | 403                |
      | rst      | 98    | 403                |
      | ust      | 91    | 200                |
      | ust      | 92    | 200                |
      | ust      | 95    | 200                |
      | ust      | 98    | 200                |
      | dst      | 91    | 403                |
      | dst      | 92    | 403                |
      | dst      | 95    | 403                |
      | dst      | 98    | 403                |
      | rpst     | 91    | 200                |
      | rpst     | 92    | 200                |
      | rpst     | 95    | 200                |
      | rpst     | 98    | 200                |
      | all_95   | 91    | 403                |
      | all_95   | 92    | 403                |
      | all_95   | 95    | 200                |
      | all_95   | 98    | 403                |

  @TEST_PDM-9584 @regression @authorization @delete
  Scenario Outline: AT API - Authorization With <userType> permissions DELETE: /{range_id}/articles/{articleNumber} - Verify Authorization With <userType> permission and range <range>
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | launchUtc           | brand  |
      | DZ1391        | false | true   | false        | 2016-02-13 21:17:46 | adidas |
    Then I validate status code 200
    Given I get access token for "<userType>" user
    When I use this <range> to send DELETE request
      | articleNumber |
      | DZ1391        |
    Then I validate status code <expectedStatusCode>
    Examples:
      | userType | range | expectedStatusCode |
      | main     | 91    | 200                |
      | main     | 92    | 200                |
      | main     | 95    | 200                |
      | main     | 98    | 200                |
      | rst      | 91    | 403                |
      | rst      | 92    | 403                |
      | rst      | 95    | 403                |
      | rst      | 98    | 403                |
      | ust      | 91    | 403                |
      | ust      | 92    | 403                |
      | ust      | 95    | 403                |
      | ust      | 98    | 403                |
      | dst      | 91    | 200                |
      | dst      | 92    | 200                |
      | dst      | 95    | 200                |
      | dst      | 98    | 200                |
      | rpst     | 91    | 403                |
      | rpst     | 92    | 403                |
      | rpst     | 95    | 403                |
      | rpst     | 98    | 403                |
      | all_95   | 91    | 403                |
      | all_95   | 92    | 403                |
      | all_95   | 95    | 200                |
      | all_95   | 98    | 403                |


  @TEST_PDM-9585 @regression @authorization @get @mm
  Scenario Outline: AT API - Authorization With <userType> permissions GET Manual Mode: /{range_id}/articles/{articleNumber}/manualMode - Verify Authorization With <userType> permission and range <range>
    Given I get access token for "<userType>" user
    When I use this <range> and this "<articleNumber>" to send GET Manual Mode request
    Then I validate status code <expectedStatusCode>
    Examples:
      | userType | range | articleNumber | expectedStatusCode |
      | main     | 91    | DU1290        | 200                |
      | main     | 92    | DU1290        | 200                |
      | main     | 95    | DU1290        | 200                |
      | main     | 98    | DU1290        | 200                |
      | rst      | 91    | DU1290        | 200                |
      | rst      | 92    | DU1290        | 200                |
      | rst      | 95    | DU1290        | 200                |
      | rst      | 98    | DU1290        | 200                |
      | ust      | 91    | DU1290        | 200                |
      | ust      | 92    | DU1290        | 200                |
      | ust      | 95    | DU1290        | 200                |
      | ust      | 98    | DU1290        | 200                |
      | dst      | 91    | DU1290        | 403                |
      | dst      | 92    | DU1290        | 403                |
      | dst      | 95    | DU1290        | 403                |
      | dst      | 98    | DU1290        | 403                |
      | rpst     | 91    | DU1290        | 403                |
      | rpst     | 92    | DU1290        | 403                |
      | rpst     | 95    | DU1290        | 403                |
      | rpst     | 98    | DU1290        | 403                |
      | all_95   | 91    | DU1290        | 403                |
      | all_95   | 92    | DU1290        | 403                |
      | all_95   | 95    | DU1290        | 200                |
      | all_95   | 98    | DU1290        | 403                |


  @TEST_PDM-9586 @regression @authorization @post @mm
  Scenario Outline: AT API - Authorization With <userType> permissions POST Manual Mode: /{range_id}/articles/{articleNumber}/manualMode - Verify Authorization With <userType> permission and range <range>
    Given I get access token for "<userType>" user
    When I use this <range> and this "<articleNumber>" to send POST Manual Mode request
    Then I validate status code <expectedStatusCode>
    Examples:
      | userType | range | articleNumber | expectedStatusCode |
      | main     | 91    | DU1290        | 200                |
      | main     | 92    | DU1290        | 403                |
      | main     | 95    | DU1290        | 200                |
      | main     | 98    | DU1290        | 403                |
      | rst      | 91    | DU1290        | 403                |
      | rst      | 92    | DU1290        | 403                |
      | rst      | 95    | DU1290        | 403                |
      | rst      | 98    | DU1290        | 403                |
      | ust      | 91    | DU1290        | 403                |
      | ust      | 92    | DU1290        | 403                |
      | ust      | 95    | DU1290        | 403                |
      | ust      | 98    | DU1290        | 403                |
      | dst      | 91    | DU1290        | 403                |
      | dst      | 92    | DU1290        | 403                |
      | dst      | 95    | DU1290        | 403                |
      | dst      | 98    | DU1290        | 403                |
      | rpst     | 91    | DU1290        | 403                |
      | rpst     | 92    | DU1290        | 403                |
      | rpst     | 95    | DU1290        | 403                |
      | rpst     | 98    | DU1290        | 403                |
      | all_95   | 91    | DU1290        | 403                |
      | all_95   | 92    | DU1290        | 403                |
      | all_95   | 95    | DU1290        | 200                |
      | all_95   | 98    | DU1290        | 403                |


  @TEST_PDM-9587 @regression @authorization @delete @mm
  Scenario Outline: AT API - Authorization With <userType> permissions DELETE Manual Mode: /{range_id}/articles/{articleNumber}/manualMode - Verify Authorization With <userType> permission and range <range>
    Given I get access token for "<userType>" user
    When I use this <range> and this "<articleNumber>" to send DELETE Manual Mode request
    Then I validate status code <expectedStatusCode>
    Examples:
      | userType | range | articleNumber | expectedStatusCode |
      | main     | 91    | DU1290        | 200                |
      | main     | 92    | DU1290        | 403                |
      | main     | 95    | DU1290        | 200                |
      | main     | 98    | DU1290        | 403                |
      | rst      | 91    | DU1290        | 403                |
      | rst      | 92    | DU1290        | 403                |
      | rst      | 95    | DU1290        | 403                |
      | rst      | 98    | DU1290        | 403                |
      | ust      | 91    | DU1290        | 403                |
      | ust      | 92    | DU1290        | 403                |
      | ust      | 95    | DU1290        | 403                |
      | ust      | 98    | DU1290        | 403                |
      | dst      | 91    | DU1290        | 403                |
      | dst      | 92    | DU1290        | 403                |
      | dst      | 95    | DU1290        | 403                |
      | dst      | 98    | DU1290        | 403                |
      | rpst     | 91    | DU1290        | 403                |
      | rpst     | 92    | DU1290        | 403                |
      | rpst     | 95    | DU1290        | 403                |
      | rpst     | 98    | DU1290        | 403                |
      | all_95   | 91    | DU1290        | 403                |
      | all_95   | 92    | DU1290        | 403                |
      | all_95   | 95    | DU1290        | 200                |
      | all_95   | 98    | DU1290        | 403                |


  @TEST_PDM-9588 @regression @authorization @post @accessprivate
  Scenario Outline: AT API - Authorization With <userType> permissions POST Access Private: /{range_id}/tokens/accessprivate - Verify Authorization With <userType> permission and range <range>
    Given I get access token for "<userType>" user
    When I use this <range> to send POST Access Private request
    Then I validate status code <expectedStatusCode>
    Examples:
      | userType | range | expectedStatusCode |
      | main     | 91    | 200                |
      | main     | 92    | 403                |
      | main     | 95    | 200                |
      | main     | 98    | 403                |
      | rst      | 91    | 403                |
      | rst      | 92    | 403                |
      | rst      | 95    | 403                |
      | rst      | 98    | 403                |
      | ust      | 91    | 403                |
      | ust      | 92    | 403                |
      | ust      | 95    | 403                |
      | ust      | 98    | 403                |
      | dst      | 91    | 403                |
      | dst      | 92    | 403                |
      | dst      | 95    | 403                |
      | dst      | 98    | 403                |
      | rpst     | 91    | 403                |
      | rpst     | 92    | 403                |
      | rpst     | 95    | 403                |
      | rpst     | 98    | 403                |
      | all_95   | 91    | 403                |
      | all_95   | 92    | 403                |
      | all_95   | 95    | 200                |
      | all_95   | 98    | 403                |


  @TEST_PDM-9595 @regression @authentication @get
  Scenario Outline: AT API - Authentication by changing "main" user Token payload data for GET: /{range_id}/articles
    Given I get access token for "main" user
    When I use this <range> to send GET request
    Then I validate status code <expectedStatusCode>
    Given I get access token for "all_95" user
    Then change the token "payload" data of "main" to "all_95" data
    And send "GET" request with this <range>
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 200                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 200                | 401                 |


  @TEST_PDM-9598 @regression @authentication @get
  Scenario Outline: AT API - Authentication by changing "all_95" user Token payload data for GET: /{range_id}/articles
    Given I get access token for "all_95" user
    When I use this <range> to send GET request
    Then I validate status code <expectedStatusCode>
    Given I get access token for "main" user
    Then change the token "payload" data of "main" to "all_95" data
    And send "GET" request with this <range>
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 403                | 401                 |
      | 92    | 403                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 403                | 401                 |


  @TEST_PDM-9600 @regression @authentication @get
  Scenario Outline: AT API - Authentication by changing "main" user Token payload data for GET: /{range_id}/articles/articleNumber & /{range_id}/articles/articleNumber/manualMode
    Given I get access token for "main" user
    When I use this <range> to send GET request for endpoint "<endpoint>" and articleNumber "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Given I get access token for "all_95" user
    Then change the token "payload" data of "main" to "all_95" data
    When I use this <range> to send GET request for endpoint "<endpoint>" and articleNumber "<articleNumber>"
    Then I validate status code <expectedStatusCode2>

    Examples:
      | endpoint                                     | range | articleNumber | expectedStatusCode | expectedStatusCode2 |
      | range_articles_by_article_number             | 91    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number             | 92    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number             | 95    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number             | 98    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number_manual_mode | 91    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number_manual_mode | 92    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number_manual_mode | 95    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number_manual_mode | 98    | FX5502        | 200                | 401                 |

  @TEST_PDM-9602 @regression @authentication @get
  Scenario Outline: AT API - Authentication by changing "all_95" user Token payload data for GET: /{range_id}/articles/articleNumber & /{range_id}/articles/articleNumber/manualMode
    Given I get access token for "all_95" user
    When I use this <range> to send GET request for endpoint "<endpoint>" and articleNumber "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Given I get access token for "main" user
    Then change the token "payload" data of "main" to "all_95" data
    When I use this <range> to send GET request for endpoint "<endpoint>" and articleNumber "<articleNumber>"
    Then I validate status code <expectedStatusCode2>

    Examples:
      | endpoint                                     | range | articleNumber | expectedStatusCode | expectedStatusCode2 |
      | range_articles_by_article_number             | 91    | FX5502        | 403                | 401                 |
      | range_articles_by_article_number             | 92    | FX5502        | 403                | 401                 |
      | range_articles_by_article_number             | 95    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number             | 98    | FX5502        | 403                | 401                 |
      | range_articles_by_article_number_manual_mode | 91    | FX5502        | 403                | 401                 |
      | range_articles_by_article_number_manual_mode | 92    | FX5502        | 403                | 401                 |
      | range_articles_by_article_number_manual_mode | 95    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number_manual_mode | 98    | FX5502        | 403                | 401                 |


  @TEST_PDM-9604 @regression @authentication @get
  Scenario Outline: AT API - Authentication by changing "main" user Token signature data for GET: /{range_id}/articles
    Given I get access token for "main" user
    When I use this <range> to send GET request
    Then I validate status code <expectedStatusCode>
    Given I get access token for "all_95" user
    Then change the token "signature" data of "main" to "all_95" data
    And send "GET" request with this <range>
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 200                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 200                | 401                 |


  @TEST_PDM-9605 @regression @authentication @get
  Scenario Outline: AT API - Authentication by changing "all_95" user Token signature data for GET: /{range_id}/articles
    Given I get access token for "all_95" user
    When I use this <range> to send GET request
    Then I validate status code <expectedStatusCode>
    Given I get access token for "main" user
    Then change the token "signature" data of "main" to "all_95" data
    And send "GET" request with this <range>
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 403                | 401                 |
      | 92    | 403                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 403                | 401                 |


  @TEST_PDM-9606 @regression @authentication @get
  Scenario Outline: AT API - Authentication by changing "main" user Token signature data for GET: /{range_id}/articles/articleNumber & /{range_id}/articles/articleNumber/manualMode
    Given I get access token for "main" user
    When I use this <range> to send GET request for endpoint "<endpoint>" and articleNumber "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Given I get access token for "all_95" user
    Then change the token "signature" data of "main" to "all_95" data
    When I use this <range> to send GET request for endpoint "<endpoint>" and articleNumber "<articleNumber>"
    Then I validate status code <expectedStatusCode2>

    Examples:
      | endpoint                                     | range | articleNumber | expectedStatusCode | expectedStatusCode2 |
      | range_articles_by_article_number             | 91    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number             | 92    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number             | 95    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number             | 98    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number_manual_mode | 91    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number_manual_mode | 92    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number_manual_mode | 95    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number_manual_mode | 98    | FX5502        | 200                | 401                 |

  @TEST_PDM-9607 @regression @authentication @get
  Scenario Outline: AT API - Authentication by changing "all_95" user Token signature data for GET: /{range_id}/articles/articleNumber & /{range_id}/articles/articleNumber/manualMode
    Given I get access token for "all_95" user
    When I use this <range> to send GET request for endpoint "<endpoint>" and articleNumber "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Given I get access token for "main" user
    Then change the token "signature" data of "main" to "all_95" data
    When I use this <range> to send GET request for endpoint "<endpoint>" and articleNumber "<articleNumber>"
    Then I validate status code <expectedStatusCode2>

    Examples:
      | endpoint                                     | range | articleNumber | expectedStatusCode | expectedStatusCode2 |
      | range_articles_by_article_number             | 91    | FX5502        | 403                | 401                 |
      | range_articles_by_article_number             | 92    | FX5502        | 403                | 401                 |
      | range_articles_by_article_number             | 95    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number             | 98    | FX5502        | 403                | 401                 |
      | range_articles_by_article_number_manual_mode | 91    | FX5502        | 403                | 401                 |
      | range_articles_by_article_number_manual_mode | 92    | FX5502        | 403                | 401                 |
      | range_articles_by_article_number_manual_mode | 95    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number_manual_mode | 98    | FX5502        | 403                | 401                 |


  @TEST_PDM-9608 @regression @authentication @post
  Scenario Outline: AT API - Authentication by changing "main" user Token payload data for POST: /{range_id}/articles & /{range_id}/articles/articleNumber/manualMode
    Given I get access token for "main" user
    When I use this <range> to send POST request for "<endpoint>" and "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Given I get access token for "all_95" user
    Then change the token "payload" data of "main" to "all_95" data
    When I use this <range> to send POST request for "<endpoint>" and "<articleNumber>"
    Then I validate status code <expectedStatusCode2>

    Examples:
      | endpoint                                     | range | articleNumber | expectedStatusCode | expectedStatusCode2 |
      | range_articles                               | 91    | FX5502        | 200                | 401                 |
      | range_articles                               | 92    | FX5502        | 200                | 401                 |
      | range_articles                               | 95    | FX5502        | 200                | 401                 |
      | range_articles                               | 98    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number_manual_mode | 91    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number_manual_mode | 92    | FX5502        | 403                | 401                 |
      | range_articles_by_article_number_manual_mode | 95    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number_manual_mode | 98    | FX5502        | 403                | 401                 |


  @TEST_PDM-9609 @regression @authentication @post
  Scenario Outline: AT API - Authentication by changing "all_95" user Token payload data for POST: /{range_id}/articles & /{range_id}/articles/articleNumber/manualMode
    Given I get access token for "all_95" user
    When I use this <range> to send POST request for "<endpoint>" and "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Given I get access token for "main" user
    Then change the token "payload" data of "main" to "all_95" data
    When I use this <range> to send POST request for "<endpoint>" and "<articleNumber>"
    Then I validate status code <expectedStatusCode2>

    Examples:
      | endpoint                                     | range | articleNumber | expectedStatusCode | expectedStatusCode2 |
      | range_articles                               | 91    | FX5502        | 403                | 401                 |
      | range_articles                               | 92    | FX5502        | 403                | 401                 |
      | range_articles                               | 95    | FX5502        | 200                | 401                 |
      | range_articles                               | 98    | FX5502        | 403                | 401                 |
      | range_articles_by_article_number_manual_mode | 91    | FX5502        | 403                | 401                 |
      | range_articles_by_article_number_manual_mode | 92    | FX5502        | 403                | 401                 |
      | range_articles_by_article_number_manual_mode | 95    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number_manual_mode | 98    | FX5502        | 403                | 401                 |

  @TEST_PDM-9610 @regression @authentication @post
  Scenario Outline: AT API - Authentication by changing "main" user Token payload data for POST: /{range_id}/articles
    Given I get access token for "main" user
    When I use this <range> to send GET request
    Then I validate status code <expectedStatusCode>
    Given I get access token for "all_95" user
    Then change the token "payload" data of "main" to "all_95" data
    And send "POST" request with this <range>
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 200                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 200                | 401                 |


  @TEST_PDM-9611 @regression @authentication @post
  Scenario Outline: AT API - Authentication by changing "main" user Token signature data for POST: /{range_id}/articles & /{range_id}/articles/articleNumber/manualMode
    Given I get access token for "main" user
    When I use this <range> to send POST request for "<endpoint>" and "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Given I get access token for "all_95" user
    Then change the token "signature" data of "main" to "all_95" data
    When I use this <range> to send POST request for "<endpoint>" and "<articleNumber>"
    Then I validate status code <expectedStatusCode2>

    Examples:
      | endpoint                                     | range | articleNumber | expectedStatusCode | expectedStatusCode2 |
      | range_articles                               | 91    | FX5502        | 200                | 401                 |
      | range_articles                               | 92    | FX5502        | 200                | 401                 |
      | range_articles                               | 95    | FX5502        | 200                | 401                 |
      | range_articles                               | 98    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number_manual_mode | 91    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number_manual_mode | 92    | FX5502        | 403                | 401                 |
      | range_articles_by_article_number_manual_mode | 95    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number_manual_mode | 98    | FX5502        | 403                | 401                 |


  @TEST_PDM-9612 @regression @authentication @post
  Scenario Outline: AT API - Authentication by changing "all_95" user Token signature data for POST: /{range_id}/articles & /{range_id}/articles/articleNumber/manualMode
    Given I get access token for "all_95" user
    When I use this <range> to send POST request for "<endpoint>" and "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Given I get access token for "main" user
    Then change the token "signature" data of "main" to "all_95" data
    When I use this <range> to send POST request for "<endpoint>" and "<articleNumber>"
    Then I validate status code <expectedStatusCode2>

    Examples:
      | endpoint                                     | range | articleNumber | expectedStatusCode | expectedStatusCode2 |
      | range_articles                               | 91    | FX5502        | 403                | 401                 |
      | range_articles                               | 92    | FX5502        | 403                | 401                 |
      | range_articles                               | 95    | FX5502        | 200                | 401                 |
      | range_articles                               | 98    | FX5502        | 403                | 401                 |
      | range_articles_by_article_number_manual_mode | 91    | FX5502        | 403                | 401                 |
      | range_articles_by_article_number_manual_mode | 92    | FX5502        | 403                | 401                 |
      | range_articles_by_article_number_manual_mode | 95    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number_manual_mode | 98    | FX5502        | 403                | 401                 |

  @TEST_PDM-9613 @regression @authentication @post
  Scenario Outline: AT API - Authentication by changing "main" user Token signature data for POST: /{range_id}/articles
    Given I get access token for "main" user
    When I use this <range> to send GET request
    Then I validate status code <expectedStatusCode>
    Given I get access token for "all_95" user
    Then change the token "signature" data of "main" to "all_95" data
    And send "POST" request with this <range>
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 200                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 200                | 401                 |

  @TEST_PDM-9614 @regression @authentication @put
  Scenario Outline: AT API - Authentication by changing "main" user Token payload data for PUT: /{range_id}/articles
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Given I get access token for "all_95" user
    Then change the token "payload" data of "main" to "all_95" data
    And I send "PUT" request with this <range> with updated token
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 200                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 200                | 401                 |


  @TEST_PDM-9616 @regression @authentication @put
  Scenario Outline: AT API - Authentication by changing "main" user Token signature data for PUT: /{range_id}/articles
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Given I get access token for "all_95" user
    Then change the token "signature" data of "main" to "all_95" data
    And I send "PUT" request with this <range> with updated token
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 200                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 200                | 401                 |


  @TEST_PDM-9617 @regression @authentication @patch
  Scenario Outline: AT API - Authentication by changing "main" user Token payload data for PATCH: /{range_id}/articles/articleNumber
    Given I get access token for "main" user
    When I use this <range> to send PATCH request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY3649        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Given I get access token for "all_95" user
    Then change the token "payload" data of "main" to "all_95" data
    And I send "PATCH" request with this <range> with updated token
      | articleNumber | dirty | public | highPriority | brand  |
      | FY3649        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 200                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 200                | 401                 |

  @TEST_PDM-9619 @regression @authentication @patch
  Scenario Outline: AT API - Authentication by changing "main" user Token signature data for PATCH: /{range_id}/articles/articleNumber
    Given I get access token for "main" user
    When I use this <range> to send PATCH request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY3649        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Given I get access token for "all_95" user
    Then change the token "signature" data of "main" to "all_95" data
    And I send "PATCH" request with this <range> with updated token
      | articleNumber | dirty | public | highPriority | brand  |
      | FY3649        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 200                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 200                | 401                 |


  @TEST_PDM-9620 @regression @authentication @delete
  Scenario Outline: AT API - Authentication by changing "main" user Token payload data for DELETE: /{range_id}/articles
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Given I get access token for "all_95" user
    Then change the token "payload" data of "main" to "all_95" data
    And I send "DELETE" request with this <range> with updated token
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 200                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 200                | 401                 |


  @TEST_PDM-9621 @regression @authentication @delete
  Scenario Outline: AT API - Authentication by changing "main" user Token payload data for DELETE: /{range_id}/articles/articleNumber
    Given I get access token for "main" user
    When I use this <range> to send GET request
    Then I validate status code <expectedStatusCode>
    Given I get access token for "all_95" user
    Then change the token "payload" data of "main" to "all_95" data
    And send "DELETE" request with this <range>
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 200                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 200                | 401                 |


  @TEST_PDM-9622 @regression @authentication @delete
  Scenario Outline: AT API - Authentication by changing "main" user Token signature data for DELETE: /{range_id}/articles
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Given I get access token for "all_95" user
    Then change the token "signature" data of "main" to "all_95" data
    And I send "DELETE" request with this <range> with updated token
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 200                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 200                | 401                 |


  @TEST_PDM-9623 @regression @authentication @delete
  Scenario Outline: AT API - Authentication by changing "main" user Token signature data for DELETE: /{range_id}/articles/articleNumber
    Given I get access token for "main" user
    When I use this <range> to send GET request
    Then I validate status code <expectedStatusCode>
    Given I get access token for "all_95" user
    Then change the token "signature" data of "main" to "all_95" data
    And send "DELETE" request with this <range>
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 200                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 200                | 401                 |


  @TEST_PDM-9624 @regression @authentication @delete
  Scenario Outline: AT API - Authentication by changing "all_95" user Token signature data for DELETE: /{range_id}/articles/articleNumber/manualMode
    Given I get access token for "all_95" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    When I use this <range> to send "DELETE" request for manualMode and "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Given I get access token for "all_95" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Given I get access token for "main" user
    Then change the token "signature" data of "all_95" to "main" data
    When I use this <range> to send "DELETE" request for manualMode and "<articleNumber>"
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | articleNumber | expectedStatusCode | expectedStatusCode2 |
      | 91    | FY9272        | 403                | 401                 |
      | 92    | FY9272        | 403                | 401                 |
      | 95    | FY9272        | 200                | 401                 |
      | 98    | FY9272        | 403                | 401                 |


  @TEST_PDM-9625 @regression @authentication @delete
  Scenario Outline: AT API - Authentication by changing "main" user Token signature data for DELETE: /{range_id}/articles/articleNumber/manualMode
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    When I use this <range> to send "DELETE" request for manualMode and "<articleNumber>"
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Given I get access token for "all_95" user
    Then change the token "signature" data of "main" to "all_95" data
    When I use this <range> to send "DELETE" request for manualMode and "<articleNumber>"
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | articleNumber | expectedStatusCode | expectedStatusCode2 |
      | 91    | FY9272        | 200                | 401                 |
      | 92    | FY9272        | 200                | 401                 |
      | 95    | FY9272        | 200                | 401                 |
      | 98    | FY9272        | 200                | 401                 |


  @TEST_PDM-9626 @regression @authentication @delete
  Scenario Outline: AT API - Authentication by changing "all_95" user Token payload data for DELETE: /{range_id}/articles/articleNumber/manualMode
    Given I get access token for "all_95" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    When I use this <range> to send "DELETE" request for manualMode and "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Given I get access token for "all_95" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Given I get access token for "main" user
    Then change the token "payload" data of "all_95" to "main" data
    When I use this <range> to send "DELETE" request for manualMode and "<articleNumber>"
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | articleNumber | expectedStatusCode | expectedStatusCode2 |
      | 91    | FY9272        | 403                | 401                 |
      | 92    | FY9272        | 403                | 401                 |
      | 95    | FY9272        | 200                | 401                 |
      | 98    | FY9272        | 403                | 401                 |


  @TEST_PDM-9627 @regression @authentication @delete
  Scenario Outline: AT API - Authentication by changing "main" user Token payload data for DELETE: /{range_id}/articles/articleNumber/manualMode
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    When I use this <range> to send "DELETE" request for manualMode and "<articleNumber>"
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Given I get access token for "all_95" user
    Then change the token "payload" data of "main" to "all_95" data
    When I use this <range> to send "DELETE" request for manualMode and "<articleNumber>"
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | articleNumber | expectedStatusCode | expectedStatusCode2 |
      | 91    | FY9272        | 200                | 401                 |
      | 92    | FY9272        | 200                | 401                 |
      | 95    | FY9272        | 200                | 401                 |
      | 98    | FY9272        | 200                | 401                 |


  @TEST_PDM-9628 @regression @authorization @post @accessprivate
  Scenario Outline: AT API - Authorization With "main" user permissions POST Access Private: /{range_id}/tokens/accessprivate
    Given I get access token for "main" user
    When I use this <range> to send POST Access Private request
    Then I validate status code <expectedStatusCode>
    Given I get access token for "all_95" user
    Then change the token "payload" data of "main" to "all_95" data
    When I use this <range> to send POST Access Private request
    Then I validate status code <expectedStatusCode2>
    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 403                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 403                | 401                 |

  @TEST_PDM-9629 @regression @authorization @post @accessprivate
  Scenario Outline: AT API - Authorization With "all_95" user permissions POST Access Private: /{range_id}/tokens/accessprivate
    Given I get access token for "all_95" user
    When I use this <range> to send POST Access Private request
    Then I validate status code <expectedStatusCode>
    Given I get access token for "main" user
    Then change the token "payload" data of "all_95" to "main" data
    When I use this <range> to send POST Access Private request
    Then I validate status code <expectedStatusCode2>
    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 403                | 401                 |
      | 92    | 403                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 403                | 401                 |

  @TEST_PDM-9630 @regression @authorization @post @accessprivate
  Scenario Outline: AT API - Authorization With "main" user permissions POST Access Private: /{range_id}/tokens/accessprivate
    Given I get access token for "main" user
    When I use this <range> to send POST Access Private request
    Then I validate status code <expectedStatusCode>
    Given I get access token for "all_95" user
    Then change the token "signature" data of "main" to "all_95" data
    When I use this <range> to send POST Access Private request
    Then I validate status code <expectedStatusCode2>
    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 403                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 403                | 401                 |


  @TEST_PDM-9631 @regression @authorization @post @accessprivate
  Scenario Outline: AT API - Authorization With "all_95" user permissions POST Access Private: /{range_id}/tokens/accessprivate
    Given I get access token for "all_95" user
    When I use this <range> to send POST Access Private request
    Then I validate status code <expectedStatusCode>
    Given I get access token for "main" user
    Then change the token "signature" data of "all_95" to "main" data
    When I use this <range> to send POST Access Private request
    Then I validate status code <expectedStatusCode2>
    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 403                | 401                 |
      | 92    | 403                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 403                | 401                 |


  @TEST_PDM-9632 @regression @authentication @get
  Scenario Outline: AT API - Authentication by changing "main" user old Token with new Token payload data for GET: /{range_id}/articles
    Given I get access token for "main" user
    When I use this <range> to send GET request
    Then I validate status code <expectedStatusCode>
    Given I get access token for "main" user
    Then change the token "payload" data of old "main" with new "main" user data
    And send "GET" request with this <range>
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 200                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 200                | 401                 |


  @TEST_PDM-9634 @regression @authentication @get
  Scenario Outline: AT API - Authentication by changing "main" user old Token with new Token payload data for GET: /{range_id}/articles/articleNumber & /{range_id}/articles/articleNumber/manualMode
    Given I get access token for "main" user
    When I use this <range> to send GET request for endpoint "<endpoint>" and articleNumber "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Given I get access token for "main" user
    Then change the token "payload" data of old "main" with new "main" user data
    When I use this <range> to send GET request for endpoint "<endpoint>" and articleNumber "<articleNumber>"
    Then I validate status code <expectedStatusCode2>

    Examples:
      | endpoint                                     | range | articleNumber | expectedStatusCode | expectedStatusCode2 |
      | range_articles_by_article_number             | 91    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number             | 92    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number             | 95    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number             | 98    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number_manual_mode | 91    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number_manual_mode | 92    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number_manual_mode | 95    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number_manual_mode | 98    | FX5502        | 200                | 401                 |


  @TEST_PDM-9635 @regression @authentication @get
  Scenario Outline: AT API - Authentication by changing "main" user old Token with new Token signature data for GET: /{range_id}/articles
    Given I get access token for "main" user
    When I use this <range> to send GET request
    Then I validate status code <expectedStatusCode>
    Given I get access token for "main" user
    Then change the token "signature" data of old "main" with new "main" user data
    And send "GET" request with this <range>
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 200                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 200                | 401                 |


  @TEST_PDM-9636 @regression @authentication @get
  Scenario Outline: AT API - Authentication by changing "main" user old Token with new Token signature data for GET: /{range_id}/articles/articleNumber & /{range_id}/articles/articleNumber/manualMode
    Given I get access token for "main" user
    When I use this <range> to send GET request for endpoint "<endpoint>" and articleNumber "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Given I get access token for "main" user
    Then change the token "signature" data of old "main" with new "main" user data
    When I use this <range> to send GET request for endpoint "<endpoint>" and articleNumber "<articleNumber>"
    Then I validate status code <expectedStatusCode2>

    Examples:
      | endpoint                                     | range | articleNumber | expectedStatusCode | expectedStatusCode2 |
      | range_articles_by_article_number             | 91    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number             | 92    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number             | 95    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number             | 98    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number_manual_mode | 91    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number_manual_mode | 92    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number_manual_mode | 95    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number_manual_mode | 98    | FX5502        | 200                | 401                 |


  @TEST_PDM-9637 @regression @authentication @post
  Scenario Outline: AT API - Authentication by changing "main" user old Token with new Token payload data for POST: /{range_id}/articles & /{range_id}/articles/articleNumber/manualMode
    Given I get access token for "main" user
    When I use this <range> to send POST request for "<endpoint>" and "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Given I get access token for "main" user
    Then change the token "payload" data of old "main" with new "main" user data
    When I use this <range> to send POST request for "<endpoint>" and "<articleNumber>"
    Then I validate status code <expectedStatusCode2>

    Examples:
      | endpoint                                     | range | articleNumber | expectedStatusCode | expectedStatusCode2 |
      | range_articles                               | 91    | FX5502        | 200                | 401                 |
      | range_articles                               | 92    | FX5502        | 200                | 401                 |
      | range_articles                               | 95    | FX5502        | 200                | 401                 |
      | range_articles                               | 98    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number_manual_mode | 91    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number_manual_mode | 92    | FX5502        | 403                | 401                 |
      | range_articles_by_article_number_manual_mode | 95    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number_manual_mode | 98    | FX5502        | 403                | 401                 |


  @TEST_PDM-9638 @regression @authentication @post
  Scenario Outline: AT API - Authentication by changing "main" user old Token with new Token payload data for POST: /{range_id}/articles
    Given I get access token for "main" user
    When I use this <range> to send GET request
    Then I validate status code <expectedStatusCode>
    Given I get access token for "main" user
    Then change the token "payload" data of old "main" with new "main" user data
    And send "POST" request with this <range>
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 200                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 200                | 401                 |


  @TEST_PDM-9639 @regression @authentication @post
  Scenario Outline: AT API - Authentication by changing "main" user old Token with new Token signature data for POST: /{range_id}/articles & /{range_id}/articles/articleNumber/manualMode
    Given I get access token for "main" user
    When I use this <range> to send POST request for "<endpoint>" and "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Given I get access token for "main" user
    Then change the token "signature" data of old "main" with new "main" user data
    When I use this <range> to send POST request for "<endpoint>" and "<articleNumber>"
    Then I validate status code <expectedStatusCode2>

    Examples:
      | endpoint                                     | range | articleNumber | expectedStatusCode | expectedStatusCode2 |
      | range_articles                               | 91    | FX5502        | 200                | 401                 |
      | range_articles                               | 92    | FX5502        | 200                | 401                 |
      | range_articles                               | 95    | FX5502        | 200                | 401                 |
      | range_articles                               | 98    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number_manual_mode | 91    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number_manual_mode | 92    | FX5502        | 403                | 401                 |
      | range_articles_by_article_number_manual_mode | 95    | FX5502        | 200                | 401                 |
      | range_articles_by_article_number_manual_mode | 98    | FX5502        | 403                | 401                 |


  @TEST_PDM-9640 @regression @authentication @post
  Scenario Outline: AT API - Authentication by changing "main" user old Token with new Token signature data for POST: /{range_id}/articles
    Given I get access token for "main" user
    When I use this <range> to send GET request
    Then I validate status code <expectedStatusCode>
    Given I get access token for "main" user
    Then change the token "signature" data of old "main" with new "main" user data
    And send "POST" request with this <range>
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 200                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 200                | 401                 |

  @TEST_PDM-9641 @regression @authentication @put
  Scenario Outline: AT API - Authentication by changing "main" user old Token with new Token payload data for PUT: /{range_id}/articles
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Given I get access token for "main" user
    Then change the token "payload" data of old "main" with new "main" user data
    And I send "PUT" request with this <range> with updated token
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 200                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 200                | 401                 |


  @TEST_PDM-9642 @regression @authentication @put
  Scenario Outline: AT API - Authentication by changing "main" user old Token with new Token signature data for PUT: /{range_id}/articles
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Given I get access token for "main" user
    Then change the token "signature" data of old "main" with new "main" user data
    And I send "PUT" request with this <range> with updated token
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 200                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 200                | 401                 |


  @TEST_PDM-9643 @regression @authentication @patch
  Scenario Outline: AT API - Authentication by changing "main" user old Token with new Token payload data for PATCH: /{range_id}/articles/articleNumber
    Given I get access token for "main" user
    When I use this <range> to send PATCH request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY3649        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Given I get access token for "main" user
    Then change the token "payload" data of old "main" with new "main" user data
    And I send "PATCH" request with this <range> with updated token
      | articleNumber | dirty | public | highPriority | brand  |
      | FY3649        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 200                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 200                | 401                 |

  @TEST_PDM-9644 @regression @authentication @patch
  Scenario Outline: AT API - Authentication by changing "main" user old Token with new Token signature data for PATCH: /{range_id}/articles/articleNumber
    Given I get access token for "main" user
    When I use this <range> to send PATCH request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY3649        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Given I get access token for "main" user
    Then change the token "signature" data of old "main" with new "main" user data
    And I send "PATCH" request with this <range> with updated token
      | articleNumber | dirty | public | highPriority | brand  |
      | FY3649        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 200                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 200                | 401                 |


  @TEST_PDM-9645 @regression @authentication @delete
  Scenario Outline: AT API - Authentication by changing "main" user old Token with new Token payload data for DELETE: /{range_id}/articles
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Given I get access token for "main" user
    Then change the token "payload" data of old "main" with new "main" user data
    And I send "DELETE" request with this <range> with updated token
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 200                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 200                | 401                 |


  @TEST_PDM-9646 @regression @authentication @delete
  Scenario Outline: AT API - Authentication by changing "main" user old Token with new Token payload data for DELETE: /{range_id}/articles/articleNumber
    Given I get access token for "main" user
    When I use this <range> to send GET request
    Then I validate status code <expectedStatusCode>
    Given I get access token for "main" user
    Then change the token "payload" data of old "main" with new "main" user data
    And send "DELETE" request with this <range>
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 200                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 200                | 401                 |


  @TEST_PDM-9647 @regression @authentication @delete
  Scenario Outline: AT API - Authentication by changing "main" user old Token with new Token signature data for DELETE: /{range_id}/articles
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Given I get access token for "main" user
    Then change the token "signature" data of old "main" with new "main" user data
    And I send "DELETE" request with this <range> with updated token
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 200                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 200                | 401                 |


  @TEST_PDM-9648 @regression @authentication @delete
  Scenario Outline: AT API - Authentication by changing "main" user old Token with new Token signature data for DELETE: /{range_id}/articles/articleNumber
    Given I get access token for "main" user
    When I use this <range> to send GET request
    Then I validate status code <expectedStatusCode>
    Given I get access token for "main" user
    Then change the token "signature" data of old "main" with new "main" user data
    And send "DELETE" request with this <range>
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 200                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 200                | 401                 |


  @TEST_PDM-9649 @regression @authentication @delete
  Scenario Outline: AT API - Authentication by changing "main" user old Token with new Token signature data for DELETE: /{range_id}/articles/articleNumber/manualMode
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    When I use this <range> to send "DELETE" request for manualMode and "<articleNumber>"
    Then I validate status code <expectedStatusCode2>
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Given I get access token for "main" user
    Then change the token "signature" data of old "main" with new "main" user data
    When I use this <range> to send "DELETE" request for manualMode and "<articleNumber>"
    Then I validate status code <expectedStatusCode3>

    Examples:
      | range | articleNumber | expectedStatusCode | expectedStatusCode2 | expectedStatusCode3 |
      | 91    | FY9272        | 200                | 200                 | 401                 |
      | 92    | FY9272        | 200                | 403                 | 401                 |
      | 95    | FY9272        | 200                | 200                 | 401                 |
      | 98    | FY9272        | 200                | 403                 | 401                 |


  @TEST_PDM-9650 @regression @authentication @delete
  Scenario Outline: AT API - Authentication by changing "main" user old Token with new Token payload data for DELETE: /{range_id}/articles/articleNumber/manualMode
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    When I use this <range> to send "DELETE" request for manualMode and "<articleNumber>"
    Then I validate status code <expectedStatusCode2>
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Given I get access token for "main" user
    Then change the token "payload" data of old "main" with new "main" user data
    When I use this <range> to send "DELETE" request for manualMode and "<articleNumber>"
    Then I validate status code <expectedStatusCode3>

    Examples:
      | range | articleNumber | expectedStatusCode | expectedStatusCode2 | expectedStatusCode3 |
      | 91    | FY9272        | 200                | 200                 | 401                 |
      | 92    | FY9272        | 200                | 403                 | 401                 |
      | 95    | FY9272        | 200                | 200                 | 401                 |
      | 98    | FY9272        | 200                | 403                 | 401                 |


  @TEST_PDM-9651 @regression @authorization @post @accessprivate
  Scenario Outline: AT API - Authorization With "main" user old Token with new Token payload permissions POST Access Private: /{range_id}/tokens/accessprivate
    Given I get access token for "main" user
    When I use this <range> to send POST Access Private request
    Then I validate status code <expectedStatusCode>
    Given I get access token for "main" user
    Then change the token "payload" data of old "main" with new "main" user data
    When I use this <range> to send POST Access Private request
    Then I validate status code <expectedStatusCode2>
    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 403                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 403                | 401                 |


  @TEST_PDM-9653 @regression @authorization @post @accessprivate
  Scenario Outline: AT API - Authorization With "main" user old Token with new Token signature permissions POST Access Private: /{range_id}/tokens/accessprivate
    Given I get access token for "main" user
    When I use this <range> to send POST Access Private request
    Then I validate status code <expectedStatusCode>
    Given I get access token for "main" user
    Then change the token "signature" data of old "main" with new "main" user data
    When I use this <range> to send POST Access Private request
    Then I validate status code <expectedStatusCode2>
    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 403                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 403                | 401                 |


  @TEST_PDM-9533 @regression @authentication @get @apiKey
  Scenario Outline: AT API - Authentication using API Key for all GET:
    When I use this <range> to send GET request for "<endpoint>" and "<articleNumber>" using API Key
    Then I validate status code <expectedStatusCode>

    Examples:
      | endpoint                                     | articleNumber | range | expectedStatusCode |
      | range_articles                               |               | 91    | 200                |
      | range_articles                               |               | 92    | 200                |
      | range_articles                               |               | 95    | 200                |
      | range_articles                               |               | 98    | 200                |
      | range_articles_by_article_number             | FX5502        | 91    | 200                |
      | range_articles_by_article_number             | FX5502        | 92    | 200                |
      | range_articles_by_article_number             | FX5502        | 95    | 200                |
      | range_articles_by_article_number             | FX5502        | 98    | 200                |
      | range_articles_by_article_number_manual_mode | FX5502        | 91    | 200                |
      | range_articles_by_article_number_manual_mode | FX5502        | 92    | 200                |
      | range_articles_by_article_number_manual_mode | FX5502        | 95    | 200                |
      | range_articles_by_article_number_manual_mode | FX5502        | 98    | 200                |

  @TEST_PDM-9536 @regression @authentication @post @apiKey
  Scenario Outline: AT API - Authentication using API Key for POST: /{range_id}/articles
    When I use this <range> to send POST request with params and API Key
      | fields                                                                                                                                          | $top | $skip | $orderby          | scope |
      | articleNumber,dirty,highPriority,public,launchUtc,expiryUtc,attempt,retryAfterUtc,manualMode,manualModeUser,manualModeState,deliveries,metadata | 2    | 1     | articleNumber asc | 1     |
    Then I validate status code <expectedStatusCode>

    Examples:
      | range | expectedStatusCode |
      | 91    | 200                |
      | 92    | 200                |
      | 95    | 200                |
      | 98    | 200                |

  @TEST_PDM-9541 @regression @authentication @post @apiKey
  Scenario Outline: AT API - Authentication using API Key for POST: /{range_id}/token/accessPrivate
    When I use this <range> to send POST Access Private request using API Key
    Then I validate status code <expectedStatusCode>

    Examples:
      | range | expectedStatusCode |
      | 91    | 200                |
      | 92    | 200                |
      | 95    | 200                |
      | 98    | 200                |

