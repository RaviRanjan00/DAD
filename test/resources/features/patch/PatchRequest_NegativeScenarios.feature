Feature: Asset Trafficker API feature - PATCH Articles negative scenarios

  @TEST_PDM-10385 @regression @patch
  Scenario Outline: AT API - PATCH - Verify updating articles for all ranges when we pass valid Article Number in endpoint and different article Number in Request Body
    Given I get access token for "main" user
    When I use this <range> to send PATCH request with "<articleNumber>"
      | articleNumber |
      | GM0496        |
    Then I validate status code <expectedStatusCode>
    Then I validate the Negative response body for <expectedStatusCode>

    Examples:
      | range | expectedStatusCode | articleNumber |
      | 92    | 400                | FY3649        |
      | 91    | 400                | FY3649        |
      | 95    | 400                | FY3649        |
      | 98    | 400                | FY3649        |

  @TEST_PDM-10387 @regression @patch
  Scenario Outline: AT API - PATCH - Verify updating articles for all ranges when we pass valid Article Number in endpoint and incorrect fields in Request Body
    Given I get access token for "main" user
    When I use this <range> to send PATCH request with "<articleNumber>"
      | sdfcfdv |
      | sfv     |
    Then I validate status code <expectedStatusCode>
    Then I validate the Negative response body for <expectedStatusCode>

    Examples:
      | range | expectedStatusCode | articleNumber |
      | 92    | 400                | FY3649        |
      | 91    | 400                | FY3649        |
      | 95    | 400                | FY3649        |
      | 98    | 400                | FY3649        |

  @TEST_PDM-10388 @regression @patch
  Scenario Outline: AT API - PATCH - Verify updating articles for all ranges when we pass incorrect Article Number in endpoint and in Request Body
    Given I get access token for "main" user
    When I use this <range> to send PATCH request with "<articleNumber>"
      | articleNumber   |
      | <articleNumber> |
    Then I validate status code <expectedStatusCode>
    Then I validate the Negative response body for <expectedStatusCode>

    Examples:
      | range | expectedStatusCode | articleNumber |
      | 92    | 404                | kodfov        |
      | 91    | 404                | kodfov        |
      | 95    | 404                | kodfov        |
      | 98    | 404                | kodfov        |

  @TEST_PDM-10389 @regression @patch
  Scenario Outline: AT API - PATCH - Verify updating articles for all ranges when we pass invalid value in highPriority in Request Body
    Given I get access token for "main" user
    When I use this <range> to send PATCH request with "<articleNumber>"
      | articleNumber   | public |
      | <articleNumber> | 132    |
    Then I validate status code <expectedStatusCode>
    Then I validate the Negative response body for <expectedStatusCode>

    Examples:
      | range | expectedStatusCode | articleNumber |
      | 92    | 400                | FY3649        |
      | 91    | 400                | FY3649        |
      | 95    | 400                | FY3649        |
      | 98    | 400                | FY3649        |

  @TEST_PDM-10390 @regression @patch
  Scenario Outline: AT API - PATCH - Verify updating articles for all ranges when we pass invalid value in highPriority in Request Body
    Given I get access token for "main" user
    When I use this <range> to send PATCH request with "<articleNumber>"
      | articleNumber   | highPriority |
      | <articleNumber> | abc          |
    Then I validate status code <expectedStatusCode>
    Then I validate the Negative response body for <expectedStatusCode>

    Examples:
      | range | expectedStatusCode | articleNumber |
      | 92    | 400                | FY3649        |
      | 91    | 400                | FY3649        |
      | 95    | 400                | FY3649        |
      | 98    | 400                | FY3649        |

  @TEST_PDM-10391 @regression @patch
  Scenario Outline: AT API - PATCH - Verify updating articles for all ranges when we pass invalid value in launchUtc in Request Body
    Given I get access token for "main" user
    When I use this <range> to send PATCH request with "<articleNumber>"
      | articleNumber   | launchUtc |
      | <articleNumber> | abc       |
    Then I validate status code <expectedStatusCode>
    Then I validate the Negative response body for <expectedStatusCode>

    Examples:
      | range | expectedStatusCode | articleNumber |
      | 92    | 400                | FY3649        |
      | 91    | 400                | FY3649        |
      | 95    | 400                | FY3649        |
      | 98    | 400                | FY3649        |

  @TEST_PDM-10393 @regression @patch
  Scenario Outline: AT API - PATCH - Verify updating articles for all ranges when we pass invalid value in brand in Request Body
    Given I get access token for "main" user
    When I use this <range> to send PATCH request with "<articleNumber>"
      | articleNumber   | brand |
      | <articleNumber> | <brand>   |
    Then I validate status code <expectedStatusCode>
    Then I validate the Negative response body for <expectedStatusCode>

    Examples:
      | range | expectedStatusCode | articleNumber | brand  |
      | 92    | 400                | FY3649        | adi    |
      | 91    | 400                | FY3649        | adi    |
      | 95    | 400                | FY3649        | adi    |
      | 98    | 400                | FY3649        | adi    |
      | 92    | 400                | FY3649        | Reebok |
      | 91    | 400                | FY3649        | Reebok |
      | 95    | 400                | FY3649        | Reebok |
      | 98    | 400                | FY3649        | Reebok |

  @TEST_PDM-10395 @patch
  Scenario Outline: AT API - PATCH - Verify updating articles for all ranges when we pass invalid fields with article number in Request Body
    Given I get access token for "main" user
    When I use this <range> to send PATCH request with "<articleNumber>"
      | articleNumber   | hbsefh |
      | <articleNumber> | acjnj  |
    Then I validate status code <expectedStatusCode>
    Then I validate the Negative response body for <expectedStatusCode>

    Examples:
      | range | expectedStatusCode | articleNumber |
      | 92    | 400                | FY3649        |
      | 91    | 400                | FY3649        |
      | 95    | 400                | FY3649        |
      | 98    | 400                | FY3649        |

  @TEST_PDM-10396 @regression @patch
  Scenario Outline: AT API - POST - Verify PATCH articles for all ranges with Incorrect Content-Type
    Given I get access token for "main" user
    When I use this <range> and "<articleNumber>" to send PATCH request with Incorrect Content-Type
      | articleNumber   |
      | <articleNumber> |
    Then I validate status code <expectedStatusCode>
    Then I validate the Negative response body for <expectedStatusCode>
    Examples:
      | range | expectedStatusCode | articleNumber |
      | 92    | 415                | FY3649        |
      | 91    | 415                | FY3649        |
      | 95    | 415                | FY3649        |
      | 98    | 415                | FY3649        |

  @TEST_PDM-10397 @regression @patch
  Scenario Outline: AT API - POST - Verify updating articles for all ranges with user having read only access
    Given I get access token for "rst" user
    When I use this <range> to send PATCH request
      | articleNumber   |
      | <articleNumber> |
    Then I validate status code <expectedStatusCode>
    Then I validate the Negative response body for <expectedStatusCode>
    Examples:
      | range | expectedStatusCode | articleNumber |
      | 92    | 403                | FY3649        |
      | 91    | 403                | FY3649        |
      | 95    | 403                | FY3649        |
      | 98    | 403                | FY3649        |