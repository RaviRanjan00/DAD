Feature: Asset Trafficker API feature - DELETE Articles positive scenarios

  Background:
    Given I get access token for "main" user

  @TEST_PDM-7656 @regression @smoke @delete
  Scenario Outline: AT API - DELETE - Verify deleting articles for all ranges with db
    When I use this <range> to send PUT request and "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    When I use this <range> to send DELETE request "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Then I validate the data removed in DB for <range> and "<articleNumber>"
    Examples:
      | range | expectedStatusCode | articleNumber |
      | 92    | 200                | DZ1391        |
      | 91    | 200                | DZ1391        |
      | 95    | 200                | DZ1391        |
      | 98    | 200                | DZ1391        |

  @TEST_PDM-7665 @regression @delete
  Scenario Outline: AT API - DELETE - Verify deleting articles for all ranges with get api method
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | launchUtc           | brand  |
      | DZ1391        | false | true   | false        | 2016-02-13 21:17:46 | adidas |
      | FX5541        | false | true   | false        | 2016-02-13 21:17:46 | adidas |
    Then I validate status code <expectedStatusCode>
    When I use this <range> to send DELETE request
      | articleNumber |
      | DZ1391        |
      | FX5541        |
    Then I validate status code <expectedStatusCode>
    Then I use this <range> to send GET request for "<endpoint>" which are deleted
      | articleNumber | statusCode |
      | DZ1391        | 404        |
      | FX5541        | 404        |
    Examples:
      | endpoint                         | range | expectedStatusCode |
      | range_articles_by_article_number | 92    | 200                |
      | range_articles_by_article_number | 91    | 200                |
      | range_articles_by_article_number | 95    | 200                |
      | range_articles_by_article_number | 98    | 200                |

  @TEST_PDM-10030 @regression @delete
  Scenario Outline: AT API - DELETE - Verify deleting articles With Correct Data for DELETE: /{range_id}/articles/{articleNumber}
    When I use this <range> to send PUT request
      | articleNumber   |
      | <articleNumber> |
    Then I validate status code <expectedStatusCode>
    When I use this <range> to send DELETE request for endpoint "<endpoint>" and articleNumber "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Then I use this <range> to send GET request for "<endpoint>" which are deleted
      | articleNumber | statusCode |
      | FY9272        | 404        |
    Examples:
      | endpoint                         | range | articleNumber | expectedStatusCode |
      | range_articles_by_article_number | 91    | FY9272        | 200                |
      | range_articles_by_article_number | 92    | FY9272        | 200                |
      | range_articles_by_article_number | 95    | FY9272        | 200                |
      | range_articles_by_article_number | 98    | FY9272        | 200                |

  @TEST_PDM-10094 @regression @delete
  Scenario Outline: Verify AT API DELETE with supported range: 91,95 to disable manualMode for the given ArticleNumber
    When I use this <range> and this "<articleNumber>" to send DELETE Manual Mode request with no content type
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | articleNumber | expectedStatusCode |
      | 91    | GJ2716        | 200                |
      | 95    | GJ2716        | 200                |

  @TEST_PDM-10211 @regression @delete
  Scenario Outline: AT API - DELETE - Verify deleting articles up to 1000 article number for all ranges and verify using GET "/range/article"
    When I use this <range> to send PUT request
      | articleNumber |
      | <filter>      |
    Then I validate status code <expectedStatusCode>
    When I use this <range> to send DELETE request
      | articleNumber |
      | <filter>      |
    Then I validate status code <expectedStatusCode>
    Then I Validate Response by json schema "DeleteResponseSchema.json"
    Then I use this <range> to send GET request for "<endpoint>" which are deleted
      | articleNumber                             | statusCode |
      | /requests/20randomArticleNumbers.txt      | 404        |
    Examples:
      | endpoint                         | range | expectedStatusCode | filter                              |
      | range_articles_by_article_number | 92    | 200                | /requests/1000NewArticleNumbers.txt |
      | range_articles_by_article_number | 91    | 200                | /requests/1000NewArticleNumbers.txt |
      | range_articles_by_article_number | 95    | 200                | /requests/1000NewArticleNumbers.txt |
      | range_articles_by_article_number | 98    | 200                | /requests/1000NewArticleNumbers.txt |

  @TEST_PDM-10212 @regression @delete
  Scenario Outline: AT API - DELETE - Verify deleting articles again after deleting the same articles
    When I use this <range> to send PUT request
      | articleNumber |
      | DZ1391        |
      | FX5541        |
    Then I validate status code <expectedStatusCode>
    When I use this <range> to send DELETE request
      | articleNumber |
      | DZ1391        |
      | FX5541        |
    Then I validate status code <expectedStatusCode>
    Then I use this <range> to send GET request for "<endpoint>" which are deleted
      | articleNumber | statusCode |
      | DZ1391        | 404        |
      | FX5541        | 404        |
    When I use this <range> to send DELETE request
      | articleNumber |
      | DZ1391        |
      | FX5541        |
    Then I validate status code <expectedStatusCode>
    Then I Validate Response by json schema "DeleteAgainResponseSchema.json"
    Then I validate DELETE response body again after deleting the articles
    Examples:
      | endpoint                         | range | expectedStatusCode |
      | range_articles_by_article_number | 92    | 200                |
      | range_articles_by_article_number | 91    | 200                |
      | range_articles_by_article_number | 95    | 200                |
      | range_articles_by_article_number | 98    | 200                |