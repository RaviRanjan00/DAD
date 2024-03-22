Feature: Asset Trafficker API feature - Access Private negative scenarios

  @TEST_PDM-9475 @post @regression @accessprivate
  Scenario Outline: AT API - Access Private - Verify POST /accessprivate articles with incorrect permissions
    Given I get access token for "<userType>" user
    When I use this <range> to send POST Access Private request
    Then I validate status code <expectedStatusCode>
    Examples:
      | userType | range | expectedStatusCode |
      | main     | 92    | 403                |
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
      | all_95   | 98    | 403                |

  @TEST_PDM-9476 @post @regression @accessprivate
  Scenario Outline: AT API - Access Private - Verify POST /accessprivate with Invalid Token
    When I send "ACCESS_PRIVATE" request for <range> range and token "<token>"
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | token             | expectedStatusCode |
      | 91    | 4eyJ0eXAiOiJKV1Qi | 401                |
      | 91    | null              | 401                |
      | 91    |                   | 401                |
      | 92    | 4eyJ0eXAiOiJKV1Qi | 401                |
      | 92    | null              | 401                |
      | 92    |                   | 401                |
      | 95    | 4eyJ0eXAiOiJKV1Qi | 401                |
      | 95    | null              | 401                |
      | 95    |                   | 401                |
      | 98    | 4eyJ0eXAiOiJKV1Qi | 401                |
      | 98    | null              | 401                |
      | 98    |                   | 401                |