Feature: Asset Trafficker API feature - PATCH Articles positive scenarios

  Background:
    Given I get access token for "main" user

  @TEST_PDM-9546 @regression @smoke @patch
  Scenario Outline: AT API - PATCH - Verify fetching articles for all ranges
    When I use this <range> to send PATCH request
      | articleNumber   | public | highPriority | launchUtc           | expiryUtc           | brand  |
      | <articleNumber> | true   | false        | 2016-02-13 21:17:46 | 2016-02-13 21:17:46 | adidas |
    Then I validate status code <expectedStatusCode>
    Then I Validate Response by json schema "PatchResponseSchema.json"
    Then I validate the data in DB for <range> and "<articleNumber>"
    Examples:
      | range | expectedStatusCode | articleNumber |
      | 92    | 200                | FY3649        |
      | 91    | 200                | FY3649        |
      | 95    | 200                | FY3649        |
      | 98    | 200                | FY3649        |
