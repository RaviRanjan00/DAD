Feature: Asset Trafficker API feature - Access Private positive scenarios

  @TEST_PDM-9478 @post @regression @accessprivate
  Scenario Outline: AT API - Access Private - Verify POST /accessprivate articles for all ranges
    Given I get access token for "<userType>" user
    When I use this <range> to send POST Access Private request
    Then I validate status code <expectedStatusCode>
    Then I Validate POST Access Private Response by json schema
    Then I Validate POST Access Private Response body for "<userType>" user and <range> range
    Examples:
      | userType | range | expectedStatusCode |
      | main     | 91    | 200                |
      | main     | 95    | 200                |
      | all_95   | 95    | 200                |