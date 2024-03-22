Feature: Asset Trafficker API feature - Authentication positive scenarios

  Background:
    Given I get access token for "main" user

  @TEST_PDM-9589 @regression @smoke @authentication @get
  Scenario Outline: AT API - Authentication GET: /{range_id}/articles - Verify Authentication With Valid Token
    When I use this <range> to send GET request
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | expectedStatusCode |
      | 92    | 200                |
      | 91    | 200                |
      | 95    | 200                |
      | 98    | 200                |


  @TEST_PDM-9590 @regression @authentication @post
  Scenario Outline: AT API - Authentication POST: /{range_id}/articles - Verify Authentication With Valid Token
    When I use this <range> to send POST request
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | expectedStatusCode |
      | 92    | 200                |
      | 91    | 200                |
      | 95    | 200                |
      | 98    | 200                |


  @TEST_PDM-9591 @regression @authentication @put
  Scenario Outline: AT API - Authentication PUT: /{range_id}/articles - Verify Authentication With Valid Token
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | launchUtc           | brand  |
      | DZ1391        | false | true   | false        | 2016-02-13 21:17:46 | adidas |
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | expectedStatusCode |
      | 92    | 200                |
      | 91    | 200                |
      | 95    | 200                |
      | 98    | 200                |

  @TEST_PDM-9592 @regression @authentication @delete
  Scenario Outline: AT API - Authentication DELETE: /{range_id}/articles - Verify Authentication With Valid Token
    When I use this <range> to send DELETE request
      | articleNumber |
      | DZ1391        |
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | expectedStatusCode |
      | 92    | 200                |
      | 91    | 200                |
      | 95    | 200                |
      | 98    | 200                |

  @TEST_PDM-9593 @regression @authentication @get
  Scenario Outline: AT API - Authentication GET: /{range_id}/articles/{articleNumber} - Verify Authentication With Valid Token
    When I use this <range> to send GET request with "<articleNumber>" article number
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | articleNumber | expectedStatusCode |
      | 92    | FW6688        | 200                |
      | 91    | FW6688        | 200                |
      | 95    | FW6688        | 200                |
      | 98    | FW6688        | 200                |

  @TEST_PDM-9594 @regression @authentication @patch
  Scenario Outline: AT API - Authentication PATCH: /{range_id}/articles/{articleNumber} - Verify Authentication With Valid Token
    When I use this <range> to send PATCH request
      | articleNumber | dirty |
      | AH2203        | false |
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | expectedStatusCode |
      | 92    | 200                |
      | 91    | 200                |
      | 95    | 200                |
      | 98    | 200                |

  @TEST_PDM-9596 @regression @authentication @delete
  Scenario Outline: AT API - Authentication DELETE: /{range_id}/articles/{articleNumber} - Verify Authentication With Valid Token
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | launchUtc           | brand  |
      | DZ1391        | false | true   | false        | 2016-02-13 21:17:46 | adidas |
    Then I validate status code <expectedStatusCode>
    When I use this <range> to send DELETE request
      | articleNumber |
      | DZ1391        |
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | expectedStatusCode |
      | 92    | 200                |
      | 91    | 200                |
      | 95    | 200                |
      | 98    | 200                |


  @TEST_PDM-9597 @regression @authentication @get @mm
  Scenario Outline: AT API - Authentication GET Manual Mode: /{range_id}/articles/{articleNumber}/manualMode - Verify Authentication With Valid Token
    When I use this <range> and this "<articleNumber>" to send GET Manual Mode request
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | articleNumber | expectedStatusCode |
      | 92    | DU1290        | 200                |
      | 91    | DU1290        | 200                |
      | 95    | DU1290        | 200                |
      | 98    | DU1290        | 200                |


  @TEST_PDM-9599 @regression @authentication @post @mm
  Scenario Outline: AT API - Authentication POST Manual Mode: /{range_id}/articles/{articleNumber}/manualMode - Verify Authentication With Valid Token
    When I use this <range> and this "<articleNumber>" to send POST Manual Mode request
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | articleNumber | expectedStatusCode |
      | 92    | DU1290        | 403                |
      | 91    | DU1290        | 200                |
      | 95    | DU1290        | 200                |
      | 98    | DU1290        | 403                |

  @TEST_PDM-9601 @regression @authentication @delete @mm
  Scenario Outline: AT API - Authentication DELETE Manual Mode: /{range_id}/articles/{articleNumber}/manualMode - Verify Authentication With Valid Token
    When I use this <range> and this "<articleNumber>" to send DELETE Manual Mode request
    Then I validate status code <expectedStatusCode>

    Examples:
      | range | articleNumber | expectedStatusCode |
      | 92    | DU1290        | 403                |
      | 91    | DU1290        | 200                |
      | 95    | DU1290        | 200                |
      | 98    | DU1290        | 403                |

  @TEST_PDM-9603 @regression @authentication @post @accessprivate
  Scenario Outline: AT API - Authentication POST Access Private: /{range_id}/tokens/accessprivate - Verify Authentication With Valid Token
    When I use this <range> to send POST Access Private request
    Then I validate status code <expectedStatusCode>

    Examples:
      | range | expectedStatusCode |
      | 92    | 403                |
      | 91    | 200                |
      | 95    | 200                |
      | 98    | 403                |