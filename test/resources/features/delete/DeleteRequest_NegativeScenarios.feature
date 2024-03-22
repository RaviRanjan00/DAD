Feature: Asset Trafficker API feature - DELETE Articles negative scenarios

  @TEST_PDM-10031 @regression @delete
  Scenario Outline: AT API - DELETE - Verify deleting articles With Invalid article Number for DELETE: /{range_id}/articles/{articleNumber}
    Given I get access token for "main" user
    When I use this <range> to send DELETE request for endpoint "<endpoint>" and articleNumber "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Then I validate the Negative response body for <expectedStatusCode>
    Examples:
      | endpoint                         | range | articleNumber | expectedStatusCode |
      | range_articles_by_article_number | 91    | GM904         | 404                |
      | range_articles_by_article_number | 92    | GM90455       | 404                |
      | range_articles_by_article_number | 95    | GM 904        | 404                |
      | range_articles_by_article_number | 98    | GM$904        | 404                |

  @TEST_PDM-10032 @regression @delete
  Scenario Outline: AT API - DELETE - Verifying Deleting the same article Number again after deleting it for DELETE: /{range_id}/articles/{articleNumber}
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber   |
      | <articleNumber> |
    Then I validate status code <expectedStatusCode>
    When I use this <range> to send DELETE request for endpoint "<endpoint>" and articleNumber "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    When I use this <range> to send DELETE request for endpoint "<endpoint>" and articleNumber "<articleNumber>"
    Then I validate status code <expectedStatusCode2>
    Then I validate the Negative response body for <expectedStatusCode2>
    Examples:
      | endpoint                         | range | articleNumber | expectedStatusCode | expectedStatusCode2 |
      | range_articles_by_article_number | 91    | FY9333        | 200                | 404                 |
      | range_articles_by_article_number | 92    | FY9333        | 200                | 404                 |
      | range_articles_by_article_number | 95    | FY9333        | 200                | 404                 |
      | range_articles_by_article_number | 98    | FY9333        | 200                | 404                 |

  @TEST_PDM-10033 @regression @delete
  Scenario Outline: AT API - DELETE - Verify deleting articles with invalid token for DELETE: /{range_id}/articles/{articleNumber}
    When I send "DELETE" request for <range> range and token "<token>" with articleNumber "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Then I validate the Negative response body for <expectedStatusCode>
    Examples:
      | range | expectedStatusCode | token             | articleNumber |
      | 92    | 401                | 4eyJ0eXAiOiJKV1Qi | FY9333        |
      | 91    | 401                | null              | FY9333        |
      | 95    | 401                |                   | FY9333        |
      | 98    | 401                | 4eyJ0eXAiOiJKV1Qi | FY9333        |

  @TEST_PDM-10092 @regression @delete
  Scenario Outline: AT API - DELETE - Verify deleting articles with user having read only access for DELETE: /{range_id}/articles/{articleNumber}
    Given I get access token for "rst" user
    When I use this <range> to send DELETE request for endpoint "<endpoint>" and articleNumber "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Then I validate the Negative response body for <expectedStatusCode>
    Examples:
      | endpoint                         | range | articleNumber | expectedStatusCode |
      | range_articles_by_article_number | 91    | FY9333        | 403                |
      | range_articles_by_article_number | 92    | FY9333        | 403                |
      | range_articles_by_article_number | 95    | FY9333        | 403                |
      | range_articles_by_article_number | 98    | FY9333        | 403                |

  @TEST_PDM-10095 @regression @delete
  Scenario Outline: Verify AT API DELETE for manualMode with E2E testing for Unsupported Ranges with "main user": 92,98
    Given I get access token for "main" user
    When I use this <range> and this "<articleNumber>" to send DELETE Manual Mode request
    Then I validate status code <expectedStatusCode>
    Then I validate the Negative response body for <expectedStatusCode>
    Examples:
      | range | articleNumber | expectedStatusCode |
      | 92    | GJ2716        | 403                |
      | 98    | GJ2716        | 403                |

  @TEST_PDM-10104 @regression @delete
  Scenario Outline: Verify AT API DELETE for manualMode to disable manualMode for "rst" user which have read-only access
    Given I get access token for "rst" user
    When I use this <range> and this "<articleNumber>" to send DELETE Manual Mode request
    Then I validate status code <expectedStatusCode>
    Then I validate the Negative response body for <expectedStatusCode>
    Examples:
      | range | articleNumber | expectedStatusCode |
      | 91    | GJ2716        | 403                |
      | 95    | GJ2716        | 403                |

  @TEST_PDM-10105 @regression @delete
  Scenario Outline: Verify AT API DELETE for manualMode with incorrect and null articleNumber
    Given I get access token for "main" user
    When I use this <range> and this "<articleNumber>" to send DELETE Manual Mode request
    Then I validate status code <expectedStatusCode>
    Then I validate the Negative response body for <expectedStatusCode>
    Examples:
      | range | articleNumber | expectedStatusCode |
      | 91    | J2716         | 404                |
      | 95    | GJ211716      | 404                |
      | 91    |               | 404                |
      | 95    |               | 404                |

  @TEST_PDM-10112 @regression @delete
  Scenario Outline: Verify AT API DELETE for manualMode with invalid and null token in authorization
    When I send "DELETE" request for "<endpoint>" with <range> and "<articleNumber>" and token "<token>"
    Then I validate status code <expectedStatusCode>
    Examples:
      | endpoint                                     | range | expectedStatusCode | token             | articleNumber |
      | range_articles_by_article_number_manual_mode | 91    | 401                | 4eyJ0eXAiOiJKV1Qi | GJ2716        |
      | range_articles_by_article_number_manual_mode | 92    | 401                | null              | GJ2716        |
      | range_articles_by_article_number_manual_mode | 95    | 401                |                   | GJ2716        |
      | range_articles_by_article_number_manual_mode | 98    | 401                | 4eyJ0eXAiOiJKV1Qi | GJ2716        |

  @TEST_PDM-10213 @regression @delete
  Scenario Outline: AT API - DELETE - Verify deleting articles more than 1000 for all ranges and verify using GET "/range/article/articleNumber"
    Given I get access token for "main" user
    When I use this <range> to send DELETE request
      | articleNumber |
      | <filter>      |
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | expectedStatusCode | filter                              |
      | 92    | 400                | /requests/1001NewArticleNumbers.txt |
      | 91    | 400                | /requests/1001NewArticleNumbers.txt |
      | 95    | 400                | /requests/1001NewArticleNumbers.txt |
      | 98    | 400                | /requests/1001NewArticleNumbers.txt |

  @TEST_PDM-10214 @regression @delete
  Scenario Outline: AT API - DELETE - Verify deleting articles for all ranges with incorrect contentType for DELETE: /{range_id}/articles
    Given I get access token for "main" user
    When I use this "<endpoint>" and <range> to send "DELETE" request for "<articleNumber>" with incorrect contentType
    Then I validate the Negative response body for <expectedStatusCode>
    Examples:
      | endpoint       | range | expectedStatusCode | articleNumber |
      | range_articles | 92    | 415                | DZ1391        |
      | range_articles | 91    | 415                | DZ1391        |
      | range_articles | 95    | 415                | DZ1391        |
      | range_articles | 98    | 415                | DZ1391        |

  @TEST_PDM-10215 @regression @delete
  Scenario Outline: AT API - DELETE - Verify deleting articles with incorrect fields in request body for DELETE: /{range_id}/articles
    Given I get access token for "main" user
    When I use this <range> to send DELETE request
      | rfr      |
      | 79087087 |
    Then I validate the Negative response body for <expectedStatusCode>
    Examples:
      | range | expectedStatusCode |
      | 92    | 400                |
      | 91    | 400                |
      | 95    | 400                |
      | 98    | 400                |

  @TEST_PDM-10216 @regression @delete
  Scenario Outline: AT API - DELETE - Verify deleting articles with "rst" user having read only access for DELETE: /{range_id}/articles
    Given I get access token for "rst" user
    When I use this <range> to send DELETE request "<articleNumber>"
    Then I validate the Negative response body for <expectedStatusCode>
    Examples:
      | range | expectedStatusCode | articleNumber |
      | 92    | 403                | DZ1391        |
      | 91    | 403                | DZ1391        |
      | 95    | 403                | DZ1391        |
      | 98    | 403                | DZ1391        |