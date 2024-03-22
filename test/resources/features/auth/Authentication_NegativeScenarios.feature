Feature: Asset Trafficker API feature - Authentication Negative scenarios

  @TEST_PDM-9506 @regression @smoke @authentication @get
  Scenario Outline: AT API - Authentication GET - Verify Authentication With Invalid Token
    When I send "GET" request for <range> range and token "<token>"
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

  @TEST_PDM-9507 @regression @authentication @post
  Scenario Outline: AT API - Authentication POST - Verify Authentication With Invalid Token
    When I send "POST" request for <range> range and token "<token>"
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | token             | expectedStatusCode |
      | 91    | 4eyJ0eXAiOiJKV1Qi | 401                |
      | 91    | 234234            | 401                |
      | 91    | null              | 401                |
      | 91    | ----              | 401                |
      | 91    |                   | 401                |
      | 92    | 4eyJ0eXAiOiJKV1Qi | 401                |
      | 92    | 234234            | 401                |
      | 92    | null              | 401                |
      | 92    | ----              | 401                |
      | 92    |                   | 401                |
      | 95    | 4eyJ0eXAiOiJKV1Qi | 401                |
      | 95    | 234234            | 401                |
      | 95    | null              | 401                |
      | 95    | ----              | 401                |
      | 95    |                   | 401                |
      | 98    | 4eyJ0eXAiOiJKV1Qi | 401                |
      | 98    | 234234            | 401                |
      | 98    | null              | 401                |
      | 98    | ----              | 401                |
      | 98    |                   | 401                |


  @TEST_PDM-9508 @regression @authentication @delete
  Scenario Outline: AT API - Authentication DELETE - Verify Authentication With Invalid Token
    When I send "DELETE" request for <range> range and token "<token>"
    Then I validate status code <expectedStatusCode>
    Examples:
      | range | token             | expectedStatusCode |
      | 91    | 4eyJ0eXAiOiJKV1Qi | 401                |
      | 91    | 234234            | 401                |
      | 91    | null              | 401                |
      | 91    | ----              | 401                |
      | 91    |                   | 401                |
      | 92    | 4eyJ0eXAiOiJKV1Qi | 401                |
      | 92    | 234234            | 401                |
      | 92    | null              | 401                |
      | 92    | ----              | 401                |
      | 92    |                   | 401                |
      | 95    | 4eyJ0eXAiOiJKV1Qi | 401                |
      | 95    | 234234            | 401                |
      | 95    | null              | 401                |
      | 95    | ----              | 401                |
      | 95    |                   | 401                |
      | 98    | 4eyJ0eXAiOiJKV1Qi | 401                |
      | 98    | 234234            | 401                |
      | 98    | null              | 401                |
      | 98    | ----              | 401                |
      | 98    |                   | 401                |

  @TEST_PDM-9510 @regression @authentication @delete
  Scenario Outline: AT API - Authentication - Verify Authentication With Expired Token
    When I send "<requestMethod>" request for <range> range and token "<expiredToken>"
    Then I validate status code <expectedStatusCode>
    Examples:
      | requestMethod | range | expectedStatusCode | expiredToken                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
      | GET           | 91    | 401                | eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6IjlHbW55RlBraGMzaE91UjIybXZTdmduTG83WSIsImtpZCI6IjlHbW55RlBraGMzaE91UjIybXZTdmduTG83WSJ9.eyJhdWQiOiI4YmE4MGU3OS1hZjQxLTQwYWYtOWZhMC00NzYyYzc2M2U1MDIiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC8zYmZlYjIyMi1lNDJjLTQ1MzUtYWFjZS1lYTZmNzc1MTM2OWIvIiwiaWF0IjoxNzAwMDQyOTk4LCJuYmYiOjE3MDAwNDI5OTgsImV4cCI6MTcwMDA0NzkzNiwiYWNyIjoiMSIsImFpbyI6IkFUUUF5LzhWQUFBQWVNelduanFveTJ6c09rZFMvUGR0Q2NLNkl2SHFXUVk1ZzhpcFl0ZEhpcXZZVlVIY0I5U0pTTnpKNWJSZmxmUHciLCJhbXIiOlsicHdkIl0sImFwcGlkIjoiOGJhODBlNzktYWY0MS00MGFmLTlmYTAtNDc2MmM3NjNlNTAyIiwiYXBwaWRhY3IiOiIxIiwiZmFtaWx5X25hbWUiOiJTdGVwYW55YW4iLCJnaXZlbl9uYW1lIjoiTWtydGljaCIsImlwYWRkciI6Ijg3LjIzNy4yMTguMTYyIiwibmFtZSI6IlN0ZXBhbnlhbiwgTWtydGljaCBbRXh0ZXJuYWxdIiwib2lkIjoiYzA5NjBmMjctMmJhZi00NjE5LWE5M2EtMzc2M2M4Y2QxZGYwIiwib25wcmVtX3NpZCI6IlMtMS01LTIxLTE0MDkwODIyMzMtMzYyMjg4MTI3LTcyNTM0NTU0My03MjMxNDgiLCJyaCI6IjAuQVFVQUlyTC1PeXprTlVXcXp1cHZkMUUybTNrT3FJdEJyNjlBbjZCSFlzZGo1UUlGQUZZLiIsInJvbGVzIjpbImF0X3VzdCIsImNfciIsImNfdGVzdF93IiwiY190ZXN0X2QiLCJhdF85Ml91c3QiLCJhdF85Ml9kc3QiLCJhdF85NV9pY3QiLCJhdF85NV9tbSIsImF0XzkxX21tIiwiYXRfOTFfZHN0IiwiYXRfOTVfZHN0IiwiYXRfOThfZHN0Il0sInNjcCI6IlVzZXIuUmVhZCBhbGwiLCJzdWIiOiJ4WXUxVHFnT25vaHZ5VVJ0TFl0OUdWcmFqbWw1UkgzTXJTS2VLeXNaYmNRIiwidGlkIjoiM2JmZWIyMjItZTQyYy00NTM1LWFhY2UtZWE2Zjc3NTEzNjliIiwidW5pcXVlX25hbWUiOiJta3J0aWNoLnN0ZXBhbnlhbkBleHRlcm5hbHMuYWRpZGFzLmNvbSIsInVwbiI6Im1rcnRpY2guc3RlcGFueWFuQGV4dGVybmFscy5hZGlkYXMuY29tIiwidXRpIjoiaXkyNGdwZEpnME9oZkJWZ3BxNW5BQSIsInZlciI6IjEuMCJ9.C9vcA4xZj25e903jOXPNf3ANCD8OfFbfW5QfinxjYYoGF8ZyktRTmu8yPJBrYd0snL515V78tH20md3KaXLS4Hr4ZPjpD6u6WrvlX5FJ-k04sK8VaC_7LLYTpUkaCBg6cFpc_aoFi8X1g19XEtSbs0_heoJh1ZH68EsGZcHZnxR2n5GNFT3vKqQdivBfGnKb7uaoFBHnxObRZxo4zLWWJkZJ_UDvGfm8lmhATiCrnEt5QqO-mRnI0KszfllFU0dOjo5ur2wmoDd9jDxo3SFqsSOz3SbuX6cNd7SW25G28ieLE4DrNrY3hGt1txL8wenO08TIc8mrpPUccHIZEZB-ng |
      | POST          | 91    | 401                | eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6IjlHbW55RlBraGMzaE91UjIybXZTdmduTG83WSIsImtpZCI6IjlHbW55RlBraGMzaE91UjIybXZTdmduTG83WSJ9.eyJhdWQiOiI4YmE4MGU3OS1hZjQxLTQwYWYtOWZhMC00NzYyYzc2M2U1MDIiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC8zYmZlYjIyMi1lNDJjLTQ1MzUtYWFjZS1lYTZmNzc1MTM2OWIvIiwiaWF0IjoxNzAwMDQyOTk4LCJuYmYiOjE3MDAwNDI5OTgsImV4cCI6MTcwMDA0NzkzNiwiYWNyIjoiMSIsImFpbyI6IkFUUUF5LzhWQUFBQWVNelduanFveTJ6c09rZFMvUGR0Q2NLNkl2SHFXUVk1ZzhpcFl0ZEhpcXZZVlVIY0I5U0pTTnpKNWJSZmxmUHciLCJhbXIiOlsicHdkIl0sImFwcGlkIjoiOGJhODBlNzktYWY0MS00MGFmLTlmYTAtNDc2MmM3NjNlNTAyIiwiYXBwaWRhY3IiOiIxIiwiZmFtaWx5X25hbWUiOiJTdGVwYW55YW4iLCJnaXZlbl9uYW1lIjoiTWtydGljaCIsImlwYWRkciI6Ijg3LjIzNy4yMTguMTYyIiwibmFtZSI6IlN0ZXBhbnlhbiwgTWtydGljaCBbRXh0ZXJuYWxdIiwib2lkIjoiYzA5NjBmMjctMmJhZi00NjE5LWE5M2EtMzc2M2M4Y2QxZGYwIiwib25wcmVtX3NpZCI6IlMtMS01LTIxLTE0MDkwODIyMzMtMzYyMjg4MTI3LTcyNTM0NTU0My03MjMxNDgiLCJyaCI6IjAuQVFVQUlyTC1PeXprTlVXcXp1cHZkMUUybTNrT3FJdEJyNjlBbjZCSFlzZGo1UUlGQUZZLiIsInJvbGVzIjpbImF0X3VzdCIsImNfciIsImNfdGVzdF93IiwiY190ZXN0X2QiLCJhdF85Ml91c3QiLCJhdF85Ml9kc3QiLCJhdF85NV9pY3QiLCJhdF85NV9tbSIsImF0XzkxX21tIiwiYXRfOTFfZHN0IiwiYXRfOTVfZHN0IiwiYXRfOThfZHN0Il0sInNjcCI6IlVzZXIuUmVhZCBhbGwiLCJzdWIiOiJ4WXUxVHFnT25vaHZ5VVJ0TFl0OUdWcmFqbWw1UkgzTXJTS2VLeXNaYmNRIiwidGlkIjoiM2JmZWIyMjItZTQyYy00NTM1LWFhY2UtZWE2Zjc3NTEzNjliIiwidW5pcXVlX25hbWUiOiJta3J0aWNoLnN0ZXBhbnlhbkBleHRlcm5hbHMuYWRpZGFzLmNvbSIsInVwbiI6Im1rcnRpY2guc3RlcGFueWFuQGV4dGVybmFscy5hZGlkYXMuY29tIiwidXRpIjoiaXkyNGdwZEpnME9oZkJWZ3BxNW5BQSIsInZlciI6IjEuMCJ9.C9vcA4xZj25e903jOXPNf3ANCD8OfFbfW5QfinxjYYoGF8ZyktRTmu8yPJBrYd0snL515V78tH20md3KaXLS4Hr4ZPjpD6u6WrvlX5FJ-k04sK8VaC_7LLYTpUkaCBg6cFpc_aoFi8X1g19XEtSbs0_heoJh1ZH68EsGZcHZnxR2n5GNFT3vKqQdivBfGnKb7uaoFBHnxObRZxo4zLWWJkZJ_UDvGfm8lmhATiCrnEt5QqO-mRnI0KszfllFU0dOjo5ur2wmoDd9jDxo3SFqsSOz3SbuX6cNd7SW25G28ieLE4DrNrY3hGt1txL8wenO08TIc8mrpPUccHIZEZB-ng |
      | DELETE        | 91    | 401                | eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6IjlHbW55RlBraGMzaE91UjIybXZTdmduTG83WSIsImtpZCI6IjlHbW55RlBraGMzaE91UjIybXZTdmduTG83WSJ9.eyJhdWQiOiI4YmE4MGU3OS1hZjQxLTQwYWYtOWZhMC00NzYyYzc2M2U1MDIiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC8zYmZlYjIyMi1lNDJjLTQ1MzUtYWFjZS1lYTZmNzc1MTM2OWIvIiwiaWF0IjoxNzAwMDQyOTk4LCJuYmYiOjE3MDAwNDI5OTgsImV4cCI6MTcwMDA0NzkzNiwiYWNyIjoiMSIsImFpbyI6IkFUUUF5LzhWQUFBQWVNelduanFveTJ6c09rZFMvUGR0Q2NLNkl2SHFXUVk1ZzhpcFl0ZEhpcXZZVlVIY0I5U0pTTnpKNWJSZmxmUHciLCJhbXIiOlsicHdkIl0sImFwcGlkIjoiOGJhODBlNzktYWY0MS00MGFmLTlmYTAtNDc2MmM3NjNlNTAyIiwiYXBwaWRhY3IiOiIxIiwiZmFtaWx5X25hbWUiOiJTdGVwYW55YW4iLCJnaXZlbl9uYW1lIjoiTWtydGljaCIsImlwYWRkciI6Ijg3LjIzNy4yMTguMTYyIiwibmFtZSI6IlN0ZXBhbnlhbiwgTWtydGljaCBbRXh0ZXJuYWxdIiwib2lkIjoiYzA5NjBmMjctMmJhZi00NjE5LWE5M2EtMzc2M2M4Y2QxZGYwIiwib25wcmVtX3NpZCI6IlMtMS01LTIxLTE0MDkwODIyMzMtMzYyMjg4MTI3LTcyNTM0NTU0My03MjMxNDgiLCJyaCI6IjAuQVFVQUlyTC1PeXprTlVXcXp1cHZkMUUybTNrT3FJdEJyNjlBbjZCSFlzZGo1UUlGQUZZLiIsInJvbGVzIjpbImF0X3VzdCIsImNfciIsImNfdGVzdF93IiwiY190ZXN0X2QiLCJhdF85Ml91c3QiLCJhdF85Ml9kc3QiLCJhdF85NV9pY3QiLCJhdF85NV9tbSIsImF0XzkxX21tIiwiYXRfOTFfZHN0IiwiYXRfOTVfZHN0IiwiYXRfOThfZHN0Il0sInNjcCI6IlVzZXIuUmVhZCBhbGwiLCJzdWIiOiJ4WXUxVHFnT25vaHZ5VVJ0TFl0OUdWcmFqbWw1UkgzTXJTS2VLeXNaYmNRIiwidGlkIjoiM2JmZWIyMjItZTQyYy00NTM1LWFhY2UtZWE2Zjc3NTEzNjliIiwidW5pcXVlX25hbWUiOiJta3J0aWNoLnN0ZXBhbnlhbkBleHRlcm5hbHMuYWRpZGFzLmNvbSIsInVwbiI6Im1rcnRpY2guc3RlcGFueWFuQGV4dGVybmFscy5hZGlkYXMuY29tIiwidXRpIjoiaXkyNGdwZEpnME9oZkJWZ3BxNW5BQSIsInZlciI6IjEuMCJ9.C9vcA4xZj25e903jOXPNf3ANCD8OfFbfW5QfinxjYYoGF8ZyktRTmu8yPJBrYd0snL515V78tH20md3KaXLS4Hr4ZPjpD6u6WrvlX5FJ-k04sK8VaC_7LLYTpUkaCBg6cFpc_aoFi8X1g19XEtSbs0_heoJh1ZH68EsGZcHZnxR2n5GNFT3vKqQdivBfGnKb7uaoFBHnxObRZxo4zLWWJkZJ_UDvGfm8lmhATiCrnEt5QqO-mRnI0KszfllFU0dOjo5ur2wmoDd9jDxo3SFqsSOz3SbuX6cNd7SW25G28ieLE4DrNrY3hGt1txL8wenO08TIc8mrpPUccHIZEZB-ng |
      | GET           | 92    | 401                | eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6IjlHbW55RlBraGMzaE91UjIybXZTdmduTG83WSIsImtpZCI6IjlHbW55RlBraGMzaE91UjIybXZTdmduTG83WSJ9.eyJhdWQiOiI4YmE4MGU3OS1hZjQxLTQwYWYtOWZhMC00NzYyYzc2M2U1MDIiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC8zYmZlYjIyMi1lNDJjLTQ1MzUtYWFjZS1lYTZmNzc1MTM2OWIvIiwiaWF0IjoxNzAwMDQyOTk4LCJuYmYiOjE3MDAwNDI5OTgsImV4cCI6MTcwMDA0NzkzNiwiYWNyIjoiMSIsImFpbyI6IkFUUUF5LzhWQUFBQWVNelduanFveTJ6c09rZFMvUGR0Q2NLNkl2SHFXUVk1ZzhpcFl0ZEhpcXZZVlVIY0I5U0pTTnpKNWJSZmxmUHciLCJhbXIiOlsicHdkIl0sImFwcGlkIjoiOGJhODBlNzktYWY0MS00MGFmLTlmYTAtNDc2MmM3NjNlNTAyIiwiYXBwaWRhY3IiOiIxIiwiZmFtaWx5X25hbWUiOiJTdGVwYW55YW4iLCJnaXZlbl9uYW1lIjoiTWtydGljaCIsImlwYWRkciI6Ijg3LjIzNy4yMTguMTYyIiwibmFtZSI6IlN0ZXBhbnlhbiwgTWtydGljaCBbRXh0ZXJuYWxdIiwib2lkIjoiYzA5NjBmMjctMmJhZi00NjE5LWE5M2EtMzc2M2M4Y2QxZGYwIiwib25wcmVtX3NpZCI6IlMtMS01LTIxLTE0MDkwODIyMzMtMzYyMjg4MTI3LTcyNTM0NTU0My03MjMxNDgiLCJyaCI6IjAuQVFVQUlyTC1PeXprTlVXcXp1cHZkMUUybTNrT3FJdEJyNjlBbjZCSFlzZGo1UUlGQUZZLiIsInJvbGVzIjpbImF0X3VzdCIsImNfciIsImNfdGVzdF93IiwiY190ZXN0X2QiLCJhdF85Ml91c3QiLCJhdF85Ml9kc3QiLCJhdF85NV9pY3QiLCJhdF85NV9tbSIsImF0XzkxX21tIiwiYXRfOTFfZHN0IiwiYXRfOTVfZHN0IiwiYXRfOThfZHN0Il0sInNjcCI6IlVzZXIuUmVhZCBhbGwiLCJzdWIiOiJ4WXUxVHFnT25vaHZ5VVJ0TFl0OUdWcmFqbWw1UkgzTXJTS2VLeXNaYmNRIiwidGlkIjoiM2JmZWIyMjItZTQyYy00NTM1LWFhY2UtZWE2Zjc3NTEzNjliIiwidW5pcXVlX25hbWUiOiJta3J0aWNoLnN0ZXBhbnlhbkBleHRlcm5hbHMuYWRpZGFzLmNvbSIsInVwbiI6Im1rcnRpY2guc3RlcGFueWFuQGV4dGVybmFscy5hZGlkYXMuY29tIiwidXRpIjoiaXkyNGdwZEpnME9oZkJWZ3BxNW5BQSIsInZlciI6IjEuMCJ9.C9vcA4xZj25e903jOXPNf3ANCD8OfFbfW5QfinxjYYoGF8ZyktRTmu8yPJBrYd0snL515V78tH20md3KaXLS4Hr4ZPjpD6u6WrvlX5FJ-k04sK8VaC_7LLYTpUkaCBg6cFpc_aoFi8X1g19XEtSbs0_heoJh1ZH68EsGZcHZnxR2n5GNFT3vKqQdivBfGnKb7uaoFBHnxObRZxo4zLWWJkZJ_UDvGfm8lmhATiCrnEt5QqO-mRnI0KszfllFU0dOjo5ur2wmoDd9jDxo3SFqsSOz3SbuX6cNd7SW25G28ieLE4DrNrY3hGt1txL8wenO08TIc8mrpPUccHIZEZB-ng |
      | POST          | 92    | 401                | eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6IjlHbW55RlBraGMzaE91UjIybXZTdmduTG83WSIsImtpZCI6IjlHbW55RlBraGMzaE91UjIybXZTdmduTG83WSJ9.eyJhdWQiOiI4YmE4MGU3OS1hZjQxLTQwYWYtOWZhMC00NzYyYzc2M2U1MDIiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC8zYmZlYjIyMi1lNDJjLTQ1MzUtYWFjZS1lYTZmNzc1MTM2OWIvIiwiaWF0IjoxNzAwMDQyOTk4LCJuYmYiOjE3MDAwNDI5OTgsImV4cCI6MTcwMDA0NzkzNiwiYWNyIjoiMSIsImFpbyI6IkFUUUF5LzhWQUFBQWVNelduanFveTJ6c09rZFMvUGR0Q2NLNkl2SHFXUVk1ZzhpcFl0ZEhpcXZZVlVIY0I5U0pTTnpKNWJSZmxmUHciLCJhbXIiOlsicHdkIl0sImFwcGlkIjoiOGJhODBlNzktYWY0MS00MGFmLTlmYTAtNDc2MmM3NjNlNTAyIiwiYXBwaWRhY3IiOiIxIiwiZmFtaWx5X25hbWUiOiJTdGVwYW55YW4iLCJnaXZlbl9uYW1lIjoiTWtydGljaCIsImlwYWRkciI6Ijg3LjIzNy4yMTguMTYyIiwibmFtZSI6IlN0ZXBhbnlhbiwgTWtydGljaCBbRXh0ZXJuYWxdIiwib2lkIjoiYzA5NjBmMjctMmJhZi00NjE5LWE5M2EtMzc2M2M4Y2QxZGYwIiwib25wcmVtX3NpZCI6IlMtMS01LTIxLTE0MDkwODIyMzMtMzYyMjg4MTI3LTcyNTM0NTU0My03MjMxNDgiLCJyaCI6IjAuQVFVQUlyTC1PeXprTlVXcXp1cHZkMUUybTNrT3FJdEJyNjlBbjZCSFlzZGo1UUlGQUZZLiIsInJvbGVzIjpbImF0X3VzdCIsImNfciIsImNfdGVzdF93IiwiY190ZXN0X2QiLCJhdF85Ml91c3QiLCJhdF85Ml9kc3QiLCJhdF85NV9pY3QiLCJhdF85NV9tbSIsImF0XzkxX21tIiwiYXRfOTFfZHN0IiwiYXRfOTVfZHN0IiwiYXRfOThfZHN0Il0sInNjcCI6IlVzZXIuUmVhZCBhbGwiLCJzdWIiOiJ4WXUxVHFnT25vaHZ5VVJ0TFl0OUdWcmFqbWw1UkgzTXJTS2VLeXNaYmNRIiwidGlkIjoiM2JmZWIyMjItZTQyYy00NTM1LWFhY2UtZWE2Zjc3NTEzNjliIiwidW5pcXVlX25hbWUiOiJta3J0aWNoLnN0ZXBhbnlhbkBleHRlcm5hbHMuYWRpZGFzLmNvbSIsInVwbiI6Im1rcnRpY2guc3RlcGFueWFuQGV4dGVybmFscy5hZGlkYXMuY29tIiwidXRpIjoiaXkyNGdwZEpnME9oZkJWZ3BxNW5BQSIsInZlciI6IjEuMCJ9.C9vcA4xZj25e903jOXPNf3ANCD8OfFbfW5QfinxjYYoGF8ZyktRTmu8yPJBrYd0snL515V78tH20md3KaXLS4Hr4ZPjpD6u6WrvlX5FJ-k04sK8VaC_7LLYTpUkaCBg6cFpc_aoFi8X1g19XEtSbs0_heoJh1ZH68EsGZcHZnxR2n5GNFT3vKqQdivBfGnKb7uaoFBHnxObRZxo4zLWWJkZJ_UDvGfm8lmhATiCrnEt5QqO-mRnI0KszfllFU0dOjo5ur2wmoDd9jDxo3SFqsSOz3SbuX6cNd7SW25G28ieLE4DrNrY3hGt1txL8wenO08TIc8mrpPUccHIZEZB-ng |
      | DELETE        | 92    | 401                | eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6IjlHbW55RlBraGMzaE91UjIybXZTdmduTG83WSIsImtpZCI6IjlHbW55RlBraGMzaE91UjIybXZTdmduTG83WSJ9.eyJhdWQiOiI4YmE4MGU3OS1hZjQxLTQwYWYtOWZhMC00NzYyYzc2M2U1MDIiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC8zYmZlYjIyMi1lNDJjLTQ1MzUtYWFjZS1lYTZmNzc1MTM2OWIvIiwiaWF0IjoxNzAwMDQyOTk4LCJuYmYiOjE3MDAwNDI5OTgsImV4cCI6MTcwMDA0NzkzNiwiYWNyIjoiMSIsImFpbyI6IkFUUUF5LzhWQUFBQWVNelduanFveTJ6c09rZFMvUGR0Q2NLNkl2SHFXUVk1ZzhpcFl0ZEhpcXZZVlVIY0I5U0pTTnpKNWJSZmxmUHciLCJhbXIiOlsicHdkIl0sImFwcGlkIjoiOGJhODBlNzktYWY0MS00MGFmLTlmYTAtNDc2MmM3NjNlNTAyIiwiYXBwaWRhY3IiOiIxIiwiZmFtaWx5X25hbWUiOiJTdGVwYW55YW4iLCJnaXZlbl9uYW1lIjoiTWtydGljaCIsImlwYWRkciI6Ijg3LjIzNy4yMTguMTYyIiwibmFtZSI6IlN0ZXBhbnlhbiwgTWtydGljaCBbRXh0ZXJuYWxdIiwib2lkIjoiYzA5NjBmMjctMmJhZi00NjE5LWE5M2EtMzc2M2M4Y2QxZGYwIiwib25wcmVtX3NpZCI6IlMtMS01LTIxLTE0MDkwODIyMzMtMzYyMjg4MTI3LTcyNTM0NTU0My03MjMxNDgiLCJyaCI6IjAuQVFVQUlyTC1PeXprTlVXcXp1cHZkMUUybTNrT3FJdEJyNjlBbjZCSFlzZGo1UUlGQUZZLiIsInJvbGVzIjpbImF0X3VzdCIsImNfciIsImNfdGVzdF93IiwiY190ZXN0X2QiLCJhdF85Ml91c3QiLCJhdF85Ml9kc3QiLCJhdF85NV9pY3QiLCJhdF85NV9tbSIsImF0XzkxX21tIiwiYXRfOTFfZHN0IiwiYXRfOTVfZHN0IiwiYXRfOThfZHN0Il0sInNjcCI6IlVzZXIuUmVhZCBhbGwiLCJzdWIiOiJ4WXUxVHFnT25vaHZ5VVJ0TFl0OUdWcmFqbWw1UkgzTXJTS2VLeXNaYmNRIiwidGlkIjoiM2JmZWIyMjItZTQyYy00NTM1LWFhY2UtZWE2Zjc3NTEzNjliIiwidW5pcXVlX25hbWUiOiJta3J0aWNoLnN0ZXBhbnlhbkBleHRlcm5hbHMuYWRpZGFzLmNvbSIsInVwbiI6Im1rcnRpY2guc3RlcGFueWFuQGV4dGVybmFscy5hZGlkYXMuY29tIiwidXRpIjoiaXkyNGdwZEpnME9oZkJWZ3BxNW5BQSIsInZlciI6IjEuMCJ9.C9vcA4xZj25e903jOXPNf3ANCD8OfFbfW5QfinxjYYoGF8ZyktRTmu8yPJBrYd0snL515V78tH20md3KaXLS4Hr4ZPjpD6u6WrvlX5FJ-k04sK8VaC_7LLYTpUkaCBg6cFpc_aoFi8X1g19XEtSbs0_heoJh1ZH68EsGZcHZnxR2n5GNFT3vKqQdivBfGnKb7uaoFBHnxObRZxo4zLWWJkZJ_UDvGfm8lmhATiCrnEt5QqO-mRnI0KszfllFU0dOjo5ur2wmoDd9jDxo3SFqsSOz3SbuX6cNd7SW25G28ieLE4DrNrY3hGt1txL8wenO08TIc8mrpPUccHIZEZB-ng |
      | GET           | 95    | 401                | eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6IjlHbW55RlBraGMzaE91UjIybXZTdmduTG83WSIsImtpZCI6IjlHbW55RlBraGMzaE91UjIybXZTdmduTG83WSJ9.eyJhdWQiOiI4YmE4MGU3OS1hZjQxLTQwYWYtOWZhMC00NzYyYzc2M2U1MDIiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC8zYmZlYjIyMi1lNDJjLTQ1MzUtYWFjZS1lYTZmNzc1MTM2OWIvIiwiaWF0IjoxNzAwMDQyOTk4LCJuYmYiOjE3MDAwNDI5OTgsImV4cCI6MTcwMDA0NzkzNiwiYWNyIjoiMSIsImFpbyI6IkFUUUF5LzhWQUFBQWVNelduanFveTJ6c09rZFMvUGR0Q2NLNkl2SHFXUVk1ZzhpcFl0ZEhpcXZZVlVIY0I5U0pTTnpKNWJSZmxmUHciLCJhbXIiOlsicHdkIl0sImFwcGlkIjoiOGJhODBlNzktYWY0MS00MGFmLTlmYTAtNDc2MmM3NjNlNTAyIiwiYXBwaWRhY3IiOiIxIiwiZmFtaWx5X25hbWUiOiJTdGVwYW55YW4iLCJnaXZlbl9uYW1lIjoiTWtydGljaCIsImlwYWRkciI6Ijg3LjIzNy4yMTguMTYyIiwibmFtZSI6IlN0ZXBhbnlhbiwgTWtydGljaCBbRXh0ZXJuYWxdIiwib2lkIjoiYzA5NjBmMjctMmJhZi00NjE5LWE5M2EtMzc2M2M4Y2QxZGYwIiwib25wcmVtX3NpZCI6IlMtMS01LTIxLTE0MDkwODIyMzMtMzYyMjg4MTI3LTcyNTM0NTU0My03MjMxNDgiLCJyaCI6IjAuQVFVQUlyTC1PeXprTlVXcXp1cHZkMUUybTNrT3FJdEJyNjlBbjZCSFlzZGo1UUlGQUZZLiIsInJvbGVzIjpbImF0X3VzdCIsImNfciIsImNfdGVzdF93IiwiY190ZXN0X2QiLCJhdF85Ml91c3QiLCJhdF85Ml9kc3QiLCJhdF85NV9pY3QiLCJhdF85NV9tbSIsImF0XzkxX21tIiwiYXRfOTFfZHN0IiwiYXRfOTVfZHN0IiwiYXRfOThfZHN0Il0sInNjcCI6IlVzZXIuUmVhZCBhbGwiLCJzdWIiOiJ4WXUxVHFnT25vaHZ5VVJ0TFl0OUdWcmFqbWw1UkgzTXJTS2VLeXNaYmNRIiwidGlkIjoiM2JmZWIyMjItZTQyYy00NTM1LWFhY2UtZWE2Zjc3NTEzNjliIiwidW5pcXVlX25hbWUiOiJta3J0aWNoLnN0ZXBhbnlhbkBleHRlcm5hbHMuYWRpZGFzLmNvbSIsInVwbiI6Im1rcnRpY2guc3RlcGFueWFuQGV4dGVybmFscy5hZGlkYXMuY29tIiwidXRpIjoiaXkyNGdwZEpnME9oZkJWZ3BxNW5BQSIsInZlciI6IjEuMCJ9.C9vcA4xZj25e903jOXPNf3ANCD8OfFbfW5QfinxjYYoGF8ZyktRTmu8yPJBrYd0snL515V78tH20md3KaXLS4Hr4ZPjpD6u6WrvlX5FJ-k04sK8VaC_7LLYTpUkaCBg6cFpc_aoFi8X1g19XEtSbs0_heoJh1ZH68EsGZcHZnxR2n5GNFT3vKqQdivBfGnKb7uaoFBHnxObRZxo4zLWWJkZJ_UDvGfm8lmhATiCrnEt5QqO-mRnI0KszfllFU0dOjo5ur2wmoDd9jDxo3SFqsSOz3SbuX6cNd7SW25G28ieLE4DrNrY3hGt1txL8wenO08TIc8mrpPUccHIZEZB-ng |
      | POST          | 95    | 401                | eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6IjlHbW55RlBraGMzaE91UjIybXZTdmduTG83WSIsImtpZCI6IjlHbW55RlBraGMzaE91UjIybXZTdmduTG83WSJ9.eyJhdWQiOiI4YmE4MGU3OS1hZjQxLTQwYWYtOWZhMC00NzYyYzc2M2U1MDIiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC8zYmZlYjIyMi1lNDJjLTQ1MzUtYWFjZS1lYTZmNzc1MTM2OWIvIiwiaWF0IjoxNzAwMDQyOTk4LCJuYmYiOjE3MDAwNDI5OTgsImV4cCI6MTcwMDA0NzkzNiwiYWNyIjoiMSIsImFpbyI6IkFUUUF5LzhWQUFBQWVNelduanFveTJ6c09rZFMvUGR0Q2NLNkl2SHFXUVk1ZzhpcFl0ZEhpcXZZVlVIY0I5U0pTTnpKNWJSZmxmUHciLCJhbXIiOlsicHdkIl0sImFwcGlkIjoiOGJhODBlNzktYWY0MS00MGFmLTlmYTAtNDc2MmM3NjNlNTAyIiwiYXBwaWRhY3IiOiIxIiwiZmFtaWx5X25hbWUiOiJTdGVwYW55YW4iLCJnaXZlbl9uYW1lIjoiTWtydGljaCIsImlwYWRkciI6Ijg3LjIzNy4yMTguMTYyIiwibmFtZSI6IlN0ZXBhbnlhbiwgTWtydGljaCBbRXh0ZXJuYWxdIiwib2lkIjoiYzA5NjBmMjctMmJhZi00NjE5LWE5M2EtMzc2M2M4Y2QxZGYwIiwib25wcmVtX3NpZCI6IlMtMS01LTIxLTE0MDkwODIyMzMtMzYyMjg4MTI3LTcyNTM0NTU0My03MjMxNDgiLCJyaCI6IjAuQVFVQUlyTC1PeXprTlVXcXp1cHZkMUUybTNrT3FJdEJyNjlBbjZCSFlzZGo1UUlGQUZZLiIsInJvbGVzIjpbImF0X3VzdCIsImNfciIsImNfdGVzdF93IiwiY190ZXN0X2QiLCJhdF85Ml91c3QiLCJhdF85Ml9kc3QiLCJhdF85NV9pY3QiLCJhdF85NV9tbSIsImF0XzkxX21tIiwiYXRfOTFfZHN0IiwiYXRfOTVfZHN0IiwiYXRfOThfZHN0Il0sInNjcCI6IlVzZXIuUmVhZCBhbGwiLCJzdWIiOiJ4WXUxVHFnT25vaHZ5VVJ0TFl0OUdWcmFqbWw1UkgzTXJTS2VLeXNaYmNRIiwidGlkIjoiM2JmZWIyMjItZTQyYy00NTM1LWFhY2UtZWE2Zjc3NTEzNjliIiwidW5pcXVlX25hbWUiOiJta3J0aWNoLnN0ZXBhbnlhbkBleHRlcm5hbHMuYWRpZGFzLmNvbSIsInVwbiI6Im1rcnRpY2guc3RlcGFueWFuQGV4dGVybmFscy5hZGlkYXMuY29tIiwidXRpIjoiaXkyNGdwZEpnME9oZkJWZ3BxNW5BQSIsInZlciI6IjEuMCJ9.C9vcA4xZj25e903jOXPNf3ANCD8OfFbfW5QfinxjYYoGF8ZyktRTmu8yPJBrYd0snL515V78tH20md3KaXLS4Hr4ZPjpD6u6WrvlX5FJ-k04sK8VaC_7LLYTpUkaCBg6cFpc_aoFi8X1g19XEtSbs0_heoJh1ZH68EsGZcHZnxR2n5GNFT3vKqQdivBfGnKb7uaoFBHnxObRZxo4zLWWJkZJ_UDvGfm8lmhATiCrnEt5QqO-mRnI0KszfllFU0dOjo5ur2wmoDd9jDxo3SFqsSOz3SbuX6cNd7SW25G28ieLE4DrNrY3hGt1txL8wenO08TIc8mrpPUccHIZEZB-ng |
      | DELETE        | 95    | 401                | eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6IjlHbW55RlBraGMzaE91UjIybXZTdmduTG83WSIsImtpZCI6IjlHbW55RlBraGMzaE91UjIybXZTdmduTG83WSJ9.eyJhdWQiOiI4YmE4MGU3OS1hZjQxLTQwYWYtOWZhMC00NzYyYzc2M2U1MDIiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC8zYmZlYjIyMi1lNDJjLTQ1MzUtYWFjZS1lYTZmNzc1MTM2OWIvIiwiaWF0IjoxNzAwMDQyOTk4LCJuYmYiOjE3MDAwNDI5OTgsImV4cCI6MTcwMDA0NzkzNiwiYWNyIjoiMSIsImFpbyI6IkFUUUF5LzhWQUFBQWVNelduanFveTJ6c09rZFMvUGR0Q2NLNkl2SHFXUVk1ZzhpcFl0ZEhpcXZZVlVIY0I5U0pTTnpKNWJSZmxmUHciLCJhbXIiOlsicHdkIl0sImFwcGlkIjoiOGJhODBlNzktYWY0MS00MGFmLTlmYTAtNDc2MmM3NjNlNTAyIiwiYXBwaWRhY3IiOiIxIiwiZmFtaWx5X25hbWUiOiJTdGVwYW55YW4iLCJnaXZlbl9uYW1lIjoiTWtydGljaCIsImlwYWRkciI6Ijg3LjIzNy4yMTguMTYyIiwibmFtZSI6IlN0ZXBhbnlhbiwgTWtydGljaCBbRXh0ZXJuYWxdIiwib2lkIjoiYzA5NjBmMjctMmJhZi00NjE5LWE5M2EtMzc2M2M4Y2QxZGYwIiwib25wcmVtX3NpZCI6IlMtMS01LTIxLTE0MDkwODIyMzMtMzYyMjg4MTI3LTcyNTM0NTU0My03MjMxNDgiLCJyaCI6IjAuQVFVQUlyTC1PeXprTlVXcXp1cHZkMUUybTNrT3FJdEJyNjlBbjZCSFlzZGo1UUlGQUZZLiIsInJvbGVzIjpbImF0X3VzdCIsImNfciIsImNfdGVzdF93IiwiY190ZXN0X2QiLCJhdF85Ml91c3QiLCJhdF85Ml9kc3QiLCJhdF85NV9pY3QiLCJhdF85NV9tbSIsImF0XzkxX21tIiwiYXRfOTFfZHN0IiwiYXRfOTVfZHN0IiwiYXRfOThfZHN0Il0sInNjcCI6IlVzZXIuUmVhZCBhbGwiLCJzdWIiOiJ4WXUxVHFnT25vaHZ5VVJ0TFl0OUdWcmFqbWw1UkgzTXJTS2VLeXNaYmNRIiwidGlkIjoiM2JmZWIyMjItZTQyYy00NTM1LWFhY2UtZWE2Zjc3NTEzNjliIiwidW5pcXVlX25hbWUiOiJta3J0aWNoLnN0ZXBhbnlhbkBleHRlcm5hbHMuYWRpZGFzLmNvbSIsInVwbiI6Im1rcnRpY2guc3RlcGFueWFuQGV4dGVybmFscy5hZGlkYXMuY29tIiwidXRpIjoiaXkyNGdwZEpnME9oZkJWZ3BxNW5BQSIsInZlciI6IjEuMCJ9.C9vcA4xZj25e903jOXPNf3ANCD8OfFbfW5QfinxjYYoGF8ZyktRTmu8yPJBrYd0snL515V78tH20md3KaXLS4Hr4ZPjpD6u6WrvlX5FJ-k04sK8VaC_7LLYTpUkaCBg6cFpc_aoFi8X1g19XEtSbs0_heoJh1ZH68EsGZcHZnxR2n5GNFT3vKqQdivBfGnKb7uaoFBHnxObRZxo4zLWWJkZJ_UDvGfm8lmhATiCrnEt5QqO-mRnI0KszfllFU0dOjo5ur2wmoDd9jDxo3SFqsSOz3SbuX6cNd7SW25G28ieLE4DrNrY3hGt1txL8wenO08TIc8mrpPUccHIZEZB-ng |
      | GET           | 98    | 401                | eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6IjlHbW55RlBraGMzaE91UjIybXZTdmduTG83WSIsImtpZCI6IjlHbW55RlBraGMzaE91UjIybXZTdmduTG83WSJ9.eyJhdWQiOiI4YmE4MGU3OS1hZjQxLTQwYWYtOWZhMC00NzYyYzc2M2U1MDIiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC8zYmZlYjIyMi1lNDJjLTQ1MzUtYWFjZS1lYTZmNzc1MTM2OWIvIiwiaWF0IjoxNzAwMDQyOTk4LCJuYmYiOjE3MDAwNDI5OTgsImV4cCI6MTcwMDA0NzkzNiwiYWNyIjoiMSIsImFpbyI6IkFUUUF5LzhWQUFBQWVNelduanFveTJ6c09rZFMvUGR0Q2NLNkl2SHFXUVk1ZzhpcFl0ZEhpcXZZVlVIY0I5U0pTTnpKNWJSZmxmUHciLCJhbXIiOlsicHdkIl0sImFwcGlkIjoiOGJhODBlNzktYWY0MS00MGFmLTlmYTAtNDc2MmM3NjNlNTAyIiwiYXBwaWRhY3IiOiIxIiwiZmFtaWx5X25hbWUiOiJTdGVwYW55YW4iLCJnaXZlbl9uYW1lIjoiTWtydGljaCIsImlwYWRkciI6Ijg3LjIzNy4yMTguMTYyIiwibmFtZSI6IlN0ZXBhbnlhbiwgTWtydGljaCBbRXh0ZXJuYWxdIiwib2lkIjoiYzA5NjBmMjctMmJhZi00NjE5LWE5M2EtMzc2M2M4Y2QxZGYwIiwib25wcmVtX3NpZCI6IlMtMS01LTIxLTE0MDkwODIyMzMtMzYyMjg4MTI3LTcyNTM0NTU0My03MjMxNDgiLCJyaCI6IjAuQVFVQUlyTC1PeXprTlVXcXp1cHZkMUUybTNrT3FJdEJyNjlBbjZCSFlzZGo1UUlGQUZZLiIsInJvbGVzIjpbImF0X3VzdCIsImNfciIsImNfdGVzdF93IiwiY190ZXN0X2QiLCJhdF85Ml91c3QiLCJhdF85Ml9kc3QiLCJhdF85NV9pY3QiLCJhdF85NV9tbSIsImF0XzkxX21tIiwiYXRfOTFfZHN0IiwiYXRfOTVfZHN0IiwiYXRfOThfZHN0Il0sInNjcCI6IlVzZXIuUmVhZCBhbGwiLCJzdWIiOiJ4WXUxVHFnT25vaHZ5VVJ0TFl0OUdWcmFqbWw1UkgzTXJTS2VLeXNaYmNRIiwidGlkIjoiM2JmZWIyMjItZTQyYy00NTM1LWFhY2UtZWE2Zjc3NTEzNjliIiwidW5pcXVlX25hbWUiOiJta3J0aWNoLnN0ZXBhbnlhbkBleHRlcm5hbHMuYWRpZGFzLmNvbSIsInVwbiI6Im1rcnRpY2guc3RlcGFueWFuQGV4dGVybmFscy5hZGlkYXMuY29tIiwidXRpIjoiaXkyNGdwZEpnME9oZkJWZ3BxNW5BQSIsInZlciI6IjEuMCJ9.C9vcA4xZj25e903jOXPNf3ANCD8OfFbfW5QfinxjYYoGF8ZyktRTmu8yPJBrYd0snL515V78tH20md3KaXLS4Hr4ZPjpD6u6WrvlX5FJ-k04sK8VaC_7LLYTpUkaCBg6cFpc_aoFi8X1g19XEtSbs0_heoJh1ZH68EsGZcHZnxR2n5GNFT3vKqQdivBfGnKb7uaoFBHnxObRZxo4zLWWJkZJ_UDvGfm8lmhATiCrnEt5QqO-mRnI0KszfllFU0dOjo5ur2wmoDd9jDxo3SFqsSOz3SbuX6cNd7SW25G28ieLE4DrNrY3hGt1txL8wenO08TIc8mrpPUccHIZEZB-ng |
      | POST          | 98    | 401                | eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6IjlHbW55RlBraGMzaE91UjIybXZTdmduTG83WSIsImtpZCI6IjlHbW55RlBraGMzaE91UjIybXZTdmduTG83WSJ9.eyJhdWQiOiI4YmE4MGU3OS1hZjQxLTQwYWYtOWZhMC00NzYyYzc2M2U1MDIiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC8zYmZlYjIyMi1lNDJjLTQ1MzUtYWFjZS1lYTZmNzc1MTM2OWIvIiwiaWF0IjoxNzAwMDQyOTk4LCJuYmYiOjE3MDAwNDI5OTgsImV4cCI6MTcwMDA0NzkzNiwiYWNyIjoiMSIsImFpbyI6IkFUUUF5LzhWQUFBQWVNelduanFveTJ6c09rZFMvUGR0Q2NLNkl2SHFXUVk1ZzhpcFl0ZEhpcXZZVlVIY0I5U0pTTnpKNWJSZmxmUHciLCJhbXIiOlsicHdkIl0sImFwcGlkIjoiOGJhODBlNzktYWY0MS00MGFmLTlmYTAtNDc2MmM3NjNlNTAyIiwiYXBwaWRhY3IiOiIxIiwiZmFtaWx5X25hbWUiOiJTdGVwYW55YW4iLCJnaXZlbl9uYW1lIjoiTWtydGljaCIsImlwYWRkciI6Ijg3LjIzNy4yMTguMTYyIiwibmFtZSI6IlN0ZXBhbnlhbiwgTWtydGljaCBbRXh0ZXJuYWxdIiwib2lkIjoiYzA5NjBmMjctMmJhZi00NjE5LWE5M2EtMzc2M2M4Y2QxZGYwIiwib25wcmVtX3NpZCI6IlMtMS01LTIxLTE0MDkwODIyMzMtMzYyMjg4MTI3LTcyNTM0NTU0My03MjMxNDgiLCJyaCI6IjAuQVFVQUlyTC1PeXprTlVXcXp1cHZkMUUybTNrT3FJdEJyNjlBbjZCSFlzZGo1UUlGQUZZLiIsInJvbGVzIjpbImF0X3VzdCIsImNfciIsImNfdGVzdF93IiwiY190ZXN0X2QiLCJhdF85Ml91c3QiLCJhdF85Ml9kc3QiLCJhdF85NV9pY3QiLCJhdF85NV9tbSIsImF0XzkxX21tIiwiYXRfOTFfZHN0IiwiYXRfOTVfZHN0IiwiYXRfOThfZHN0Il0sInNjcCI6IlVzZXIuUmVhZCBhbGwiLCJzdWIiOiJ4WXUxVHFnT25vaHZ5VVJ0TFl0OUdWcmFqbWw1UkgzTXJTS2VLeXNaYmNRIiwidGlkIjoiM2JmZWIyMjItZTQyYy00NTM1LWFhY2UtZWE2Zjc3NTEzNjliIiwidW5pcXVlX25hbWUiOiJta3J0aWNoLnN0ZXBhbnlhbkBleHRlcm5hbHMuYWRpZGFzLmNvbSIsInVwbiI6Im1rcnRpY2guc3RlcGFueWFuQGV4dGVybmFscy5hZGlkYXMuY29tIiwidXRpIjoiaXkyNGdwZEpnME9oZkJWZ3BxNW5BQSIsInZlciI6IjEuMCJ9.C9vcA4xZj25e903jOXPNf3ANCD8OfFbfW5QfinxjYYoGF8ZyktRTmu8yPJBrYd0snL515V78tH20md3KaXLS4Hr4ZPjpD6u6WrvlX5FJ-k04sK8VaC_7LLYTpUkaCBg6cFpc_aoFi8X1g19XEtSbs0_heoJh1ZH68EsGZcHZnxR2n5GNFT3vKqQdivBfGnKb7uaoFBHnxObRZxo4zLWWJkZJ_UDvGfm8lmhATiCrnEt5QqO-mRnI0KszfllFU0dOjo5ur2wmoDd9jDxo3SFqsSOz3SbuX6cNd7SW25G28ieLE4DrNrY3hGt1txL8wenO08TIc8mrpPUccHIZEZB-ng |
      | DELETE        | 98    | 401                | eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6IjlHbW55RlBraGMzaE91UjIybXZTdmduTG83WSIsImtpZCI6IjlHbW55RlBraGMzaE91UjIybXZTdmduTG83WSJ9.eyJhdWQiOiI4YmE4MGU3OS1hZjQxLTQwYWYtOWZhMC00NzYyYzc2M2U1MDIiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC8zYmZlYjIyMi1lNDJjLTQ1MzUtYWFjZS1lYTZmNzc1MTM2OWIvIiwiaWF0IjoxNzAwMDQyOTk4LCJuYmYiOjE3MDAwNDI5OTgsImV4cCI6MTcwMDA0NzkzNiwiYWNyIjoiMSIsImFpbyI6IkFUUUF5LzhWQUFBQWVNelduanFveTJ6c09rZFMvUGR0Q2NLNkl2SHFXUVk1ZzhpcFl0ZEhpcXZZVlVIY0I5U0pTTnpKNWJSZmxmUHciLCJhbXIiOlsicHdkIl0sImFwcGlkIjoiOGJhODBlNzktYWY0MS00MGFmLTlmYTAtNDc2MmM3NjNlNTAyIiwiYXBwaWRhY3IiOiIxIiwiZmFtaWx5X25hbWUiOiJTdGVwYW55YW4iLCJnaXZlbl9uYW1lIjoiTWtydGljaCIsImlwYWRkciI6Ijg3LjIzNy4yMTguMTYyIiwibmFtZSI6IlN0ZXBhbnlhbiwgTWtydGljaCBbRXh0ZXJuYWxdIiwib2lkIjoiYzA5NjBmMjctMmJhZi00NjE5LWE5M2EtMzc2M2M4Y2QxZGYwIiwib25wcmVtX3NpZCI6IlMtMS01LTIxLTE0MDkwODIyMzMtMzYyMjg4MTI3LTcyNTM0NTU0My03MjMxNDgiLCJyaCI6IjAuQVFVQUlyTC1PeXprTlVXcXp1cHZkMUUybTNrT3FJdEJyNjlBbjZCSFlzZGo1UUlGQUZZLiIsInJvbGVzIjpbImF0X3VzdCIsImNfciIsImNfdGVzdF93IiwiY190ZXN0X2QiLCJhdF85Ml91c3QiLCJhdF85Ml9kc3QiLCJhdF85NV9pY3QiLCJhdF85NV9tbSIsImF0XzkxX21tIiwiYXRfOTFfZHN0IiwiYXRfOTVfZHN0IiwiYXRfOThfZHN0Il0sInNjcCI6IlVzZXIuUmVhZCBhbGwiLCJzdWIiOiJ4WXUxVHFnT25vaHZ5VVJ0TFl0OUdWcmFqbWw1UkgzTXJTS2VLeXNaYmNRIiwidGlkIjoiM2JmZWIyMjItZTQyYy00NTM1LWFhY2UtZWE2Zjc3NTEzNjliIiwidW5pcXVlX25hbWUiOiJta3J0aWNoLnN0ZXBhbnlhbkBleHRlcm5hbHMuYWRpZGFzLmNvbSIsInVwbiI6Im1rcnRpY2guc3RlcGFueWFuQGV4dGVybmFscy5hZGlkYXMuY29tIiwidXRpIjoiaXkyNGdwZEpnME9oZkJWZ3BxNW5BQSIsInZlciI6IjEuMCJ9.C9vcA4xZj25e903jOXPNf3ANCD8OfFbfW5QfinxjYYoGF8ZyktRTmu8yPJBrYd0snL515V78tH20md3KaXLS4Hr4ZPjpD6u6WrvlX5FJ-k04sK8VaC_7LLYTpUkaCBg6cFpc_aoFi8X1g19XEtSbs0_heoJh1ZH68EsGZcHZnxR2n5GNFT3vKqQdivBfGnKb7uaoFBHnxObRZxo4zLWWJkZJ_UDvGfm8lmhATiCrnEt5QqO-mRnI0KszfllFU0dOjo5ur2wmoDd9jDxo3SFqsSOz3SbuX6cNd7SW25G28ieLE4DrNrY3hGt1txL8wenO08TIc8mrpPUccHIZEZB-ng |


  @TEST_PDM-9511 @regression @authentication @get
  Scenario Outline: AT API - Authentication by passing invalid "main" user Token payload data for GET: /{range_id}/articles
    Given I get access token for "main" user
    When I use this <range> to send GET request
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "payload" data of "main" data
    And send "GET" request with this <range>
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 200                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 200                | 401                 |

  @TEST_PDM-9512 @regression @authentication @get
  Scenario Outline: AT API - Authentication by passing invalid "all_95" user Token payload data for GET: /{range_id}/articles
    Given I get access token for "all_95" user
    When I use this <range> to send GET request
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "payload" data of "all_95" data
    And send "GET" request with this <range>
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 403                | 401                 |
      | 92    | 403                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 403                | 401                 |


  @TEST_PDM-9513 @regression @authentication @get
  Scenario Outline: AT API - Authentication by passing invalid "main" user Token signature data for GET: /{range_id}/articles
    Given I get access token for "main" user
    When I use this <range> to send GET request
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "signature" data of "main" data
    And send "GET" request with this <range>
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 200                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 200                | 401                 |

  @TEST_PDM-9514 @regression @authentication @get
  Scenario Outline: AT API - Authentication by passing invalid "all_95" user Token signature data for GET: /{range_id}/articles
    Given I get access token for "all_95" user
    When I use this <range> to send GET request
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "signature" data of "all_95" data
    And send "GET" request with this <range>
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 403                | 401                 |
      | 92    | 403                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 403                | 401                 |

  @TEST_PDM-9515 @regression @authentication @get
  Scenario Outline: AT API - Authentication by passing invalid "main" user Token header data for GET: /{range_id}/articles
    Given I get access token for "main" user
    When I use this <range> to send GET request
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "header" data of "main" data
    And send "GET" request with this <range>
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 200                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 200                | 401                 |

  @TEST_PDM-9516 @regression @authentication @get
  Scenario Outline: AT API - Authentication by passing invalid "all_95" user Token header data for GET: /{range_id}/articles
    Given I get access token for "all_95" user
    When I use this <range> to send GET request
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "header" data of "all_95" data
    And send "GET" request with this <range>
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 403                | 401                 |
      | 92    | 403                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 403                | 401                 |

  @TEST_PDM-9517 @regression @authentication @get
  Scenario Outline: AT API - Authentication by passing invalid "main" user Token payload data for GET: /{range_id}/articles/articleNumber & /{range_id}/articles/articleNumber/manualMode
    Given I get access token for "main" user
    When I use this <range> to send GET request for endpoint "<endpoint>" and articleNumber "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "payload" data of "main" data
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

  @TEST_PDM-9518 @regression @authentication @get
  Scenario Outline: AT API - Authentication by passing invalid "all_95" user Token payload data for GET: /{range_id}/articles/articleNumber & /{range_id}/articles/articleNumber/manualMode
    Given I get access token for "all_95" user
    When I use this <range> to send GET request for endpoint "<endpoint>" and articleNumber "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "payload" data of "all_95" data
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


  @TEST_PDM-9519 @regression @authentication @get
  Scenario Outline: AT API - Authentication by passing invalid "main" user Token signature data for GET: /{range_id}/articles/articleNumber & /{range_id}/articles/articleNumber/manualMode
    Given I get access token for "main" user
    When I use this <range> to send GET request for endpoint "<endpoint>" and articleNumber "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "signature" data of "main" data
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

  @TEST_PDM-9523 @regression @authentication @get
  Scenario Outline: AT API - Authentication by passing invalid "all_95" user Token signature data for GET: /{range_id}/articles/articleNumber & /{range_id}/articles/articleNumber/manualMode
    Given I get access token for "all_95" user
    When I use this <range> to send GET request for endpoint "<endpoint>" and articleNumber "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "signature" data of "all_95" data
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


  @TEST_PDM-9524 @regression @authentication @get
  Scenario Outline: AT API - Authentication by passing invalid "main" user Token header data for GET: /{range_id}/articles/articleNumber & /{range_id}/articles/articleNumber/manualMode
    Given I get access token for "main" user
    When I use this <range> to send GET request for endpoint "<endpoint>" and articleNumber "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "header" data of "main" data
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

  @TEST_PDM-9576 @regression @authentication @get
  Scenario Outline: AT API - Authentication by passing invalid "all_95" user Token header data for GET: /{range_id}/articles/articleNumber & /{range_id}/articles/articleNumber/manualMode
    Given I get access token for "all_95" user
    When I use this <range> to send GET request for endpoint "<endpoint>" and articleNumber "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "header" data of "all_95" data
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

  @TEST_PDM-9525 @regression @authentication @post
  Scenario Outline: AT API - Authentication by passing invalid "main" user Token payload data for POST: /{range_id}/articles & /{range_id}/articles/articleNumber/manualMode
    Given I get access token for "main" user
    When I use this <range> to send POST request for "<endpoint>" and "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "payload" data of "main" data
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

  @TEST_PDM-9526 @regression @authentication @post
  Scenario Outline: AT API - Authentication by passing invalid "all_95" user Token payload data for POST: /{range_id}/articles & /{range_id}/articles/articleNumber/manualMode
    Given I get access token for "all_95" user
    When I use this <range> to send POST request for "<endpoint>" and "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "payload" data of "all_95" data
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

  @TEST_PDM-9527 @regression @authentication @post
  Scenario Outline: AT API - Authentication by passing invalid "main" user Token signature data for POST: /{range_id}/articles & /{range_id}/articles/articleNumber/manualMode
    Given I get access token for "main" user
    When I use this <range> to send POST request for "<endpoint>" and "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "signature" data of "main" data
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

  @TEST_PDM-9528 @regression @authentication @post
  Scenario Outline: AT API - Authentication by passing invalid "all_95" user Token signature data for POST: /{range_id}/articles & /{range_id}/articles/articleNumber/manualMode
    Given I get access token for "all_95" user
    When I use this <range> to send POST request for "<endpoint>" and "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "signature" data of "all_95" data
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

  @TEST_PDM-9529 @regression @authentication @post
  Scenario Outline: AT API - Authentication by passing invalid "main" user Token header data for POST: /{range_id}/articles & /{range_id}/articles/articleNumber/manualMode
    Given I get access token for "main" user
    When I use this <range> to send POST request for "<endpoint>" and "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "header" data of "main" data
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

  @TEST_PDM-9530 @regression @authentication @post
  Scenario Outline: AT API - Authentication by passing invalid "all_95" user Token header data for POST: /{range_id}/articles & /{range_id}/articles/articleNumber/manualMode
    Given I get access token for "all_95" user
    When I use this <range> to send POST request for "<endpoint>" and "<articleNumber>"
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "header" data of "all_95" data
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

  @TEST_PDM-9531 @regression @authentication @put
  Scenario Outline: AT API - Authentication by passing invalid "main" user Token payload data for PUT: /{range_id}/articles
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "payload" data of "main" data
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

  @TEST_PDM-9532 @regression @authentication @put
  Scenario Outline: AT API - Authentication by passing invalid "all_95" user Token payload data for PUT: /{range_id}/articles
    Given I get access token for "all_95" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "payload" data of "all_95" data
    And I send "PUT" request with this <range> with updated token
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 403                | 401                 |
      | 92    | 403                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 403                | 401                 |

  @TEST_PDM-9534 @regression @authentication @put
  Scenario Outline: AT API - Authentication by passing invalid "main" user Token signature data for PUT: /{range_id}/articles
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "signature" data of "main" data
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

  @TEST_PDM-9543 @regression @authentication @put
  Scenario Outline: AT API - Authentication by passing invalid "all_95" user Token signature data for PUT: /{range_id}/articles
    Given I get access token for "all_95" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "signature" data of "all_95" data
    And I send "PUT" request with this <range> with updated token
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 403                | 401                 |
      | 92    | 403                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 403                | 401                 |

  @TEST_PDM-9545 @regression @authentication @put
  Scenario Outline: AT API - Authentication by passing invalid "main" user Token header data for PUT: /{range_id}/articles
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "header" data of "main" data
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

  @TEST_PDM-9548 @regression @authentication @put
  Scenario Outline: AT API - Authentication by passing invalid "all_95" user Token header data for PUT: /{range_id}/articles
    Given I get access token for "all_95" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "header" data of "all_95" data
    And I send "PUT" request with this <range> with updated token
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 403                | 401                 |
      | 92    | 403                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 403                | 401                 |

  @TEST_PDM-9549 @regression @authentication @patch
  Scenario Outline: AT API - Authentication by passing invalid "main" user Token payload data for PATCH: /{range_id}/articles/articleNumber
    Given I get access token for "main" user
    When I use this <range> to send PATCH request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY3649        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "payload" data of "main" data
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

  @TEST_PDM-9550 @regression @authentication @patch
  Scenario Outline: AT API - Authentication by passing invalid "all_95" user Token payload data for PATCH: /{range_id}/articles/articleNumber
    Given I get access token for "all_95" user
    When I use this <range> to send PATCH request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY3649        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "payload" data of "all_95" data
    And I send "PATCH" request with this <range> with updated token
      | articleNumber | dirty | public | highPriority | brand  |
      | FY3649        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 403                | 401                 |
      | 92    | 403                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 403                | 401                 |

  @TEST_PDM-9551 @regression @authentication @patch
  Scenario Outline: AT API - Authentication by passing invalid "main" user Token signature data for PATCH: /{range_id}/articles/articleNumber
    Given I get access token for "main" user
    When I use this <range> to send PATCH request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY3649        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "signature" data of "main" data
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

  @TEST_PDM-9552 @regression @authentication @patch
  Scenario Outline: AT API - Authentication by passing invalid "all_95" user Token signature data for PATCH: /{range_id}/articles/articleNumber
    Given I get access token for "all_95" user
    When I use this <range> to send PATCH request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY3649        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "signature" data of "all_95" data
    And I send "PATCH" request with this <range> with updated token
      | articleNumber | dirty | public | highPriority | brand  |
      | FY3649        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 403                | 401                 |
      | 92    | 403                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 403                | 401                 |

  @TEST_PDM-9553 @regression @authentication @patch
  Scenario Outline: AT API - Authentication by passing invalid "main" user Token header data for PATCH: /{range_id}/articles/articleNumber
    Given I get access token for "main" user
    When I use this <range> to send PATCH request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY3649        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "header" data of "main" data
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

  @TEST_PDM-9554 @regression @authentication @patch
  Scenario Outline: AT API - Authentication by passing invalid "all_95" user Token signature data for PATCH: /{range_id}/articles/articleNumber
    Given I get access token for "all_95" user
    When I use this <range> to send PATCH request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY3649        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "header" data of "all_95" data
    And I send "PATCH" request with this <range> with updated token
      | articleNumber | dirty | public | highPriority | brand  |
      | FY3649        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 403                | 401                 |
      | 92    | 403                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 403                | 401                 |

  @TEST_PDM-9555 @regression @authentication @delete
  Scenario Outline: AT API - Authentication by passing invalid "main" user Token payload data for DELETE: /{range_id}/articles
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "payload" data of "main" data
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

  @TEST_PDM-9556 @regression @authentication @delete
  Scenario Outline: AT API - Authentication by passing invalid "all_95" user Token payload data for DELETE: /{range_id}/articles
    Given I get access token for "all_95" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "payload" data of "all_95" data
    And I send "DELETE" request with this <range> with updated token
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 403                | 401                 |
      | 92    | 403                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 403                | 401                 |

  @TEST_PDM-9557 @regression @authentication @delete
  Scenario Outline: AT API - Authentication by passing invalid "main" user Token payload data for DELETE: /{range_id}/articles/articleNumber
    Given I get access token for "main" user
    When I use this <range> to send GET request
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "payload" data of "main" data
    And send "DELETE" request with this <range>
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 200                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 200                | 401                 |

  @TEST_PDM-9558 @regression @authentication @delete
  Scenario Outline: AT API - Authentication by passing invalid "all_95" user Token payload data for DELETE: /{range_id}/articles/articleNumber
    Given I get access token for "all_95" user
    When I use this <range> to send GET request
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "payload" data of "all_95" data
    And send "DELETE" request with this <range>
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 403                | 401                 |
      | 92    | 403                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 403                | 401                 |

  @TEST_PDM-9559 @regression @authentication @delete
  Scenario Outline: AT API - Authentication by passing invalid "main" user Token payload data for DELETE: /{range_id}/articles/articleNumber/manualMode
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
    Then make some changes in token "payload" data of "main" data
    When I use this <range> to send "DELETE" request for manualMode and "<articleNumber>"
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | articleNumber | expectedStatusCode | expectedStatusCode2 |
      | 91    | FY9272        | 200                | 401                 |
      | 92    | FY9272        | 200                | 401                 |
      | 95    | FY9272        | 200                | 401                 |
      | 98    | FY9272        | 200                | 401                 |

  @TEST_PDM-9560 @regression @authentication @delete
  Scenario Outline: AT API - Authentication by passing invalid "all_95" user Token payload data for DELETE: /{range_id}/articles/articleNumber/manualMode
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
    Then make some changes in token "payload" data of "all_95" data
    When I use this <range> to send "DELETE" request for manualMode and "<articleNumber>"
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | articleNumber | expectedStatusCode | expectedStatusCode2 |
      | 91    | FY9272        | 403                | 401                 |
      | 92    | FY9272        | 403                | 401                 |
      | 95    | FY9272        | 200                | 401                 |
      | 98    | FY9272        | 403                | 401                 |

  @TEST_PDM-9561 @regression @authentication @delete
  Scenario Outline: AT API - Authentication by passing invalid "main" user Token signature data for DELETE: /{range_id}/articles
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "signature" data of "main" data
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

  @TEST_PDM-9563 @regression @authentication @delete
  Scenario Outline: AT API - Authentication by passing invalid "all_95" user Token signature data for DELETE: /{range_id}/articles
    Given I get access token for "all_95" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "signature" data of "all_95" data
    And I send "DELETE" request with this <range> with updated token
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 403                | 401                 |
      | 92    | 403                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 403                | 401                 |

  @TEST_PDM-9564 @regression @authentication @delete
  Scenario Outline: AT API - Authentication by passing invalid "main" user Token signature data for DELETE: /{range_id}/articles/articleNumber
    Given I get access token for "main" user
    When I use this <range> to send GET request
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "signature" data of "main" data
    And send "DELETE" request with this <range>
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 200                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 200                | 401                 |

  @TEST_PDM-9566 @regression @authentication @delete
  Scenario Outline: AT API - Authentication by passing invalid "all_95" user Token signature data for DELETE: /{range_id}/articles/articleNumber
    Given I get access token for "all_95" user
    When I use this <range> to send GET request
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "signature" data of "all_95" data
    And send "DELETE" request with this <range>
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 403                | 401                 |
      | 92    | 403                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 403                | 401                 |

  @TEST_PDM-9567 @regression @authentication @delete
  Scenario Outline: AT API - Authentication by passing invalid "main" user Token signature data for DELETE: /{range_id}/articles/articleNumber/manualMode
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
    Then make some changes in token "signature" data of "main" data
    When I use this <range> to send "DELETE" request for manualMode and "<articleNumber>"
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | articleNumber | expectedStatusCode | expectedStatusCode2 |
      | 91    | FY9272        | 200                | 401                 |
      | 92    | FY9272        | 200                | 401                 |
      | 95    | FY9272        | 200                | 401                 |
      | 98    | FY9272        | 200                | 401                 |

  @TEST_PDM-9568 @regression @authentication @delete
  Scenario Outline: AT API - Authentication by passing invalid "all_95" user Token signature data for DELETE: /{range_id}/articles/articleNumber/manualMode
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
    Then make some changes in token "signature" data of "all_95" data
    When I use this <range> to send "DELETE" request for manualMode and "<articleNumber>"
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | articleNumber | expectedStatusCode | expectedStatusCode2 |
      | 91    | FY9272        | 403                | 401                 |
      | 92    | FY9272        | 403                | 401                 |
      | 95    | FY9272        | 200                | 401                 |
      | 98    | FY9272        | 403                | 401                 |

  @TEST_PDM-9569 @regression @authentication @delete
  Scenario Outline: AT API - Authentication by passing invalid "main" user Token header data for DELETE: /{range_id}/articles
    Given I get access token for "main" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "header" data of "main" data
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

  @TEST_PDM-9571 @regression @authentication @delete
  Scenario Outline: AT API - Authentication by passing invalid "all_95" user Token header data for DELETE: /{range_id}/articles
    Given I get access token for "all_95" user
    When I use this <range> to send PUT request
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "header" data of "all_95" data
    And I send "DELETE" request with this <range> with updated token
      | articleNumber | dirty | public | highPriority | brand  |
      | FY9272        | false | true   | false        | adidas |
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 403                | 401                 |
      | 92    | 403                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 403                | 401                 |

  @TEST_PDM-9572 @regression @authentication @delete
  Scenario Outline: AT API - Authentication by passing invalid "main" user Token header data for DELETE: /{range_id}/articles/articleNumber
    Given I get access token for "main" user
    When I use this <range> to send GET request
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "header" data of "main" data
    And send "DELETE" request with this <range>
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 200                | 401                 |
      | 92    | 200                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 200                | 401                 |

  @TEST_PDM-9573 @regression @authentication @delete
  Scenario Outline: AT API - Authentication by passing invalid "all_95" user Token header data for DELETE: /{range_id}/articles/articleNumber
    Given I get access token for "all_95" user
    When I use this <range> to send GET request
    Then I validate status code <expectedStatusCode>
    Then make some changes in token "header" data of "all_95" data
    And send "DELETE" request with this <range>
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | expectedStatusCode | expectedStatusCode2 |
      | 91    | 403                | 401                 |
      | 92    | 403                | 401                 |
      | 95    | 200                | 401                 |
      | 98    | 403                | 401                 |

  @TEST_PDM-9574 @regression @authentication @delete
  Scenario Outline: AT API - Authentication by passing invalid "main" user Token header data for DELETE: /{range_id}/articles/articleNumber/manualMode
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
    Then make some changes in token "header" data of "main" data
    When I use this <range> to send "DELETE" request for manualMode and "<articleNumber>"
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | articleNumber | expectedStatusCode | expectedStatusCode2 |
      | 91    | FY9272        | 200                | 401                 |
      | 92    | FY9272        | 200                | 401                 |
      | 95    | FY9272        | 200                | 401                 |
      | 98    | FY9272        | 200                | 401                 |

  @TEST_PDM-9575 @regression @authentication @delete
  Scenario Outline: AT API - Authentication by passing invalid "all_95" user Token header data for DELETE: /{range_id}/articles/articleNumber/manualMode
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
    Then make some changes in token "header" data of "all_95" data
    When I use this <range> to send "DELETE" request for manualMode and "<articleNumber>"
    Then I validate status code <expectedStatusCode2>

    Examples:
      | range | articleNumber | expectedStatusCode | expectedStatusCode2 |
      | 91    | FY9272        | 403                | 401                 |
      | 92    | FY9272        | 403                | 401                 |
      | 95    | FY9272        | 200                | 401                 |
      | 98    | FY9272        | 403                | 401                 |


  @TEST_PDM-9542 @regression @authentication @get @apiKey
  Scenario Outline: AT API - Authentication using incorrect x-api-key & adidas-api-key for all GET:
    When I use this <range> to send GET request for "<endpoint>" and "<articleNumber>" using API Key "<x-api-key>" & "<Adidas-API-Key>"
    Then I validate status code <expectedStatusCode>

    Examples:
      | endpoint                                     | articleNumber | range | expectedStatusCode | x-api-key                           | Adidas-API-Key                                                                                                                                                                                                                                                                                                                                                |
      | range_articles                               |               | 91    | 401                | TarasIstheBest202322                | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vsIgTg-PGZkxakKwxxgwCkCNXwY                    |
      | range_articles                               |               | 91    | 401                | TarasIstheBest2022                  | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vsIgTg-PGZkxakKwxxgwCkCNXwY                    |
      | range_articles                               |               | 91    | 401                | TarasIstheBest202322                | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vse6uevD1rCIgTg-PGZkxakKwxxgwCkCNXwY           |
      | range_articles                               |               | 92    | 401                | TarasIstheBest202                   | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vse6uevD1rCIgTg-PGdcZkxakKwxxgwCkCNXwY         |
      | range_articles                               |               | 92    | 401                | TarasIstheBest2022                  | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vsIgTg-PGZkxakKwxxgwCkCNXwY                    |
      | range_articles                               |               | 92    | 401                | TarasIstheBest202322                | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vse6uevD1rCIgTg-PGZkxakKwxxgwCkCNXwY           |
      | range_articles                               |               | 95    | 401                | TarasIstheB.est2022                 | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.                                                      |
      | range_articles                               |               | 95    | 401                | TarasIstheBest2022                  | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vsIgTg-PGZkxakKwxxgwCkCNXwY                    |
      | range_articles                               |               | 95    | 401                | TarasIstheBest202322                | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vse6uevD1rCIgTg-PGZkxakKwxxgwCkCNXwY           |
      | range_articles                               |               | 98    | 401                | 1TarasIstheBest2022                 | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWacsQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vse6uevD1rCIgTg-PGZkxakKwxxgwCkCNXwY        |
      | range_articles                               |               | 98    | 401                | TarasIstheBest2022                  | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vsIgTg-PGZkxakKwxxgwCkCNXwY                    |
      | range_articles                               |               | 98    | 401                | TarasIstheBest202322                | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vse6uevD1rCIgTg-PGZkxakKwxxgwCkCNXwY           |
      | range_articles_by_article_number             | FX5502        | 91    | 401                | TarasIstheBest202322                | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldscdE1hbmFnZXIifQ.ChB3-59vse6usdevD1rCIgTg-PGZkxakKwxxgwCkCNXwY      |
      | range_articles_by_article_number             | FX5502        | 91    | 401                | TarasIstheBest2022                  | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vsIgTg-PGZkxakKwxxgwCkCNXwY                    |
      | range_articles_by_article_number             | FX5502        | 91    | 401                | TarasIstheBest202322                | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vse6uevD1rCIgTg-PGZkxakKwxxgwCkCNXwY           |
      | range_articles_by_article_number             | FX5502        | 92    | 401                | TarasIstheBest202                   | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.                                                      |
      | range_articles_by_article_number             | FX5502        | 92    | 401                | TarasIstheBest2022                  | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vsIgTg-PGZkxakKwxxgwCkCNXwY                    |
      | range_articles_by_article_number             | FX5502        | 92    | 401                | TarasIstheBest202322                | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vse6uevD1rCIgTg-PGZkxakKwxxgwCkCNXwY           |
      | range_articles_by_article_number             | FX5502        | 95    | 401                | TarasIstheB.est2022                 | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vse6uevD1rCIgTg-PxakKwxxgwCkCNXwY              |
      | range_articles_by_article_number             | FX5502        | 95    | 401                | TarasIstheBest2022                  | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vsIgTg-PGZkxakKwxxgwCkCNXwY                    |
      | range_articles_by_article_number             | FX5502        | 95    | 401                | TarasIstheBest202322                | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vse6uevD1rCIgTg-PGZkxakKwxxgwCkCNXwY           |
      | range_articles_by_article_number             | FX5502        | 98    | 401                | 1TarasIstheBest2022                 | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vse6uevD1rCIgTg-PGZkxakKwxxgwCkCNXwY           |
      | range_articles_by_article_number             | FX5502        | 98    | 401                | TarasIstheBest2022                  | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vsIgTg-PGZkxakKwxxgwCkCNXwY                    |
      | range_articles_by_article_number             | FX5502        | 98    | 401                | TarasIstheBest202322                | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vse6uevD1rCIgTg-PGZkxakKwxxgwCkCNXwY           |
      | range_articles_by_article_number_manual_mode | FX5502        | 91    | 401                | TarasIstheBest202322                | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldEsdc1hbmFnZXIifQ.ChB3-59vse6uevDsdc1rCIgTg-PGZkxakKwxxgwCkCNXwY     |
      | range_articles_by_article_number_manual_mode | FX5502        | 91    | 401                | TarasIstheBest2022                  | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vsIgTg-PGZkxakKwxxgwCkCNXwY                    |
      | range_articles_by_article_number_manual_mode | FX5502        | 91    | 401                | TarasIstheBest202322                | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vse6uevD1rCIgTg-PGZkxakKwxxgwCkCNXwY           |
      | range_articles_by_article_number_manual_mode | FX5502        | 92    | 401                | TarasIstheBest202                   | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vse6usdccdsevD1rCIgTg-PGZkxakKwxxgwCkCNXwY     |
      | range_articles_by_article_number_manual_mode | FX5502        | 92    | 401                | TarasIstheBest2022                  | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vsIgTg-PGZkxakKwxxgwCkCNXwY                    |
      | range_articles_by_article_number_manual_mode | FX5502        | 92    | 401                | TarasIstheBest202322                | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vse6uevD1rCIgTg-PGZkxakKwxxgwCkCNXwY           |
      | range_articles_by_article_number_manual_mode | FX5502        | 95    | 401                | TarasIstheB.est2022                 | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.                                                      |
      | range_articles_by_article_number_manual_mode | FX5502        | 95    | 401                | TarasIstheBest2022                  | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vsIgTg-PGZkxakKwxxgwCkCNXwY                    |
      | range_articles_by_article_number_manual_mode | FX5502        | 95    | 401                | TarasIstheBest202322                | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vse6uevD1rCIgTg-PGZkxakKwxxgwCkCNXwY           |
      | range_articles_by_article_number_manual_mode | FX5502        | 98    | 401                | 1TarasIstheBest2022                 | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vse6uevD1rCIgTgGZkxakKwxxgwCkCNXwY             |
      | range_articles_by_article_number_manual_mode | FX5502        | 98    | 401                | TarasIstheBest2022                  | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vsIgTg-PGZkxakKwxxgwCkCNXwY                    |
      | range_articles_by_article_number_manual_mode | FX5502        | 98    | 401                | TarasIstheBest202322                | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vse6uevD1rCIgTg-PGZkxakKwxxgwCkCNXwY           |
      | range_articles                               |               | 91    | 401                | gRNXsbTFjDK90OAmdSddXC58CLZ         | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.                                                      |
      | range_articles                               |               | 91    | 401                | gRNXsbTFjDD39MSK90OAmdSddXC58CLZ    | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOq8UFwk4_Ovjezly5IgegdpgyojEYwg       |
      | range_articles                               |               | 91    | 401                | gRNXsbTFjDK9mdSddXC58CLZ            | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOq8UFwk4_Ovjezly5IpgyojEYwg           |
      | range_articles                               |               | 92    | 401                | gRNXsbTFjDdasD39MSK90OAmdSddXC58CLZ | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hacdbmFnZXIifQ.AwQAmNz0xdascxsdHlbThOWOq8UFwk4_Ovjezly5IpgyojEYwg |
      | range_articles                               |               | 92    | 401                | gRNXsbTFjDD39MSK90OAmdSddXC58CLZ    | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOq8UFwk4_Ovjezly5IpgyodfvfjEYwg       |
      | range_articles                               |               | 92    | 401                | gRNXsbTFjDK9mdSddXC58CLZ            | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOq8UFwk4_Ovjezly5IpgyojEYwg           |
      | range_articles                               |               | 95    | 401                | 12gRNXsbTFjDD39MSK90OAmdSddXC58CLZ  | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbTUFwk4_Ovjezly5IpgyojEYwg                 |
      | range_articles                               |               | 95    | 401                | gRNXsbTFjDD39MSK90OAmdSddXC58CLZ    | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbTsfdvchOWOq8UFwk4_Ovjezly5IpgyojEYwg      |
      | range_articles                               |               | 95    | 401                | gRNXsbTFjDK9mdSddXC58CLZ            | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOq8UFwk4_Ovjezly5IpgyojEYwg           |
      | range_articles                               |               | 98    | 401                | gRNXsbTFjDD39MSK90OAmdSddXC58CLZlcd | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbT00hOWOq8UFwk4_Ovjezly5IpgyojEYwg         |
      | range_articles                               |               | 98    | 401                | gRNXsbTFjDD39MSK90OAmdSddXC58CLZ    | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOqsfvz8UFwk4_Ovjezly5IpgyojEYwg       |
      | range_articles                               |               | 98    | 401                | gRNXsbTFjDK9mdSddXC58CLZ            | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOq8UFwk4_Ovjezly5IpgyojEYwg           |
      | range_articles_by_article_number             | FX5502        | 91    | 401                | gRNXsbTFjDK90OAmdSddXC58CLZ         | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.                                                      |
      | range_articles_by_article_number             | FX5502        | 91    | 401                | gRNXsbTFjDD39MSK90OAmdSddXC58CLZ    | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOq8UFwzvxxvfk4_Ovjezly5IpgyojEYwg     |
      | range_articles_by_article_number             | FX5502        | 91    | 401                | gRNXsbTFjDK9mdSddXC58CLZ            | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOq8UFwk4_Ovjezly5IpgyojEYwg           |
      | range_articles_by_article_number             | FX5502        | 92    | 401                | gRNXsbTFjDdasD39MSK90OAmdSddXC58CLZ | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hacdbmFnZXIifQ.AwQAmNz0xdascxsdHlbThOWOq8UFwk4_Ovjezly5IpgyojEYwg |
      | range_articles_by_article_number             | FX5502        | 92    | 401                | gRNXsbTFjDD39MSK90OAmdSddXC58CLZ    | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOq8UFwk4_Ovjsfvdfvzezly5IpgyojEYwg    |
      | range_articles_by_article_number             | FX5502        | 92    | 401                | gRNXsbTFjDK9mdSddXC58CLZ            | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOq8UFwk4_Ovjezly5IpgyojEYwg           |
      | range_articles_by_article_number             | FX5502        | 95    | 401                | 12gRNXsbTFjDD39MSK90OAmdSddXC58CLZ  | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbTUFwk4_Ovjezly5IpgyojEYwg                 |
      | range_articles_by_article_number             | FX5502        | 95    | 401                | gRNXsbTFjDD39MSK90OAmdSddXC58CLZ    | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AvdfwQAmNz0xHlbThOWOq8UFwk4_Ovjezly5IpgyojEYwg        |
      | range_articles_by_article_number             | FX5502        | 95    | 401                | gRNXsbTFjDK9mdSddXC58CLZ            | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOq8UFwk4_Ovjezly5IpgyojEYwg           |
      | range_articles_by_article_number             | FX5502        | 98    | 401                | gRNXsbTFjDD39MSK90OAmdSddXC58CLZlcd | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbT00hOWOq8UFwk4_Ovjezly5IpgyojEYwg         |
      | range_articles_by_article_number             | FX5502        | 98    | 401                | gRNXsbTFjDD39MSK90OAmdSddXC58CLZ    | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAsfvzmNz0xHlbThOWOq8UFwk4_Ovjezly5IpgyojEYwg       |
      | range_articles_by_article_number             | FX5502        | 98    | 401                | gRNXsbTFjDK9mdSddXC58CLZ            | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOq8UFwk4_Ovjezly5IpgyojEYwg           |
      | range_articles_by_article_number_manual_mode | FX5502        | 91    | 401                | gRNXsbTFjDK90OAmdSddXC58CLZ         | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.                                                      |
      | range_articles_by_article_number_manual_mode | FX5502        | 91    | 401                | gRNXsbTFjDD39MSK90OAmdSddXC58CLZ    | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0vsxxHlbThOWOq8UFwk4_Ovjezly5IpgyojEYwg        |
      | range_articles_by_article_number_manual_mode | FX5502        | 91    | 401                | gRNXsbTFjDK9mdSddXC58CLZ            | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOq8UFwk4_Ovjezly5IpgyojEYwg           |
      | range_articles_by_article_number_manual_mode | FX5502        | 92    | 401                | gRNXsbTFjDdasD39MSK90OAmdSddXC58CLZ | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hacdbmFnZXIifQ.AwQAmNz0xdascxsdHlbThOWOq8UFwk4_Ovjezly5IpgyojEYwg |
      | range_articles_by_article_number_manual_mode | FX5502        | 92    | 401                | gRNXsbTFjDD39MSK90OAmdSddXC58CLZ    | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlsdvcdbThOWOq8UFwk4_Ovjezly5IpgyojEYwg      |
      | range_articles_by_article_number_manual_mode | FX5502        | 92    | 401                | gRNXsbTFjDK9mdSddXC58CLZ            | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOq8UFwk4_Ovjezly5IpgyojEYwg           |
      | range_articles_by_article_number_manual_mode | FX5502        | 95    | 401                | 12gRNXsbTFjDD39MSK90OAmdSddXC58CLZ  | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbTUFwk4_Ovjezly5IpgyojEYwg                 |
      | range_articles_by_article_number_manual_mode | FX5502        | 95    | 401                | gRNXsbTFjDD39MSK90OAmdSddXC58CLZ    | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWadscsfOq8UFwk4_Ovjezly5IpgyojEYwg     |
      | range_articles_by_article_number_manual_mode | FX5502        | 95    | 401                | gRNXsbTFjDK9mdSddXC58CLZ            | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOq8UFwk4_Ovjezly5IpgyojEYwg           |
      | range_articles_by_article_number_manual_mode | FX5502        | 98    | 401                | gRNXsbTFjDD39MSK90OAmdSddXC58CLZlcd | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbT00hOWOq8UFwk4_Ovjezly5IpgyojEYwg         |
      | range_articles_by_article_number_manual_mode | FX5502        | 98    | 401                | gRNXsbTFjDD39MSK90OAmdSddXC58CLZ    | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOq8UFwsfdvck4_Ovjezly5IpgyojEYwg      |
      | range_articles_by_article_number_manual_mode | FX5502        | 98    | 401                | gRNXsbTFjDK9mdSddXC58CLZ            | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOq8UFwk4_Ovjezly5IpgyojEYwg           |


  @TEST_PDM-9544 @regression @authentication @post @apiKey
  Scenario Outline: AT API - Authentication using incorrect x-api-key & adidas-api-key for POST: /{range_id}/articles
    When I use this <range> to send POST request with params and API Key "<x-api-key>" & "<Adidas-API-Key>"
      | fields                                                                                                                                          | $top | $skip | $orderby          | scope |
      | articleNumber,dirty,highPriority,public,launchUtc,expiryUtc,attempt,retryAfterUtc,manualMode,manualModeUser,manualModeState,deliveries,metadata | 2    | 1     | articleNumber asc | 1     |
    Then I validate status code <expectedStatusCode>

    Examples:
      | range | expectedStatusCode | x-api-key                           | Adidas-API-Key                                                                                                                                                                                                                                                                                                                                           |
      | 91    | 401                | TarasIstheBest202322                | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.                                                 |
      | 91    | 401                | TarasIstheBest2022                  | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vsIgTg-PGZkxakKwxxgwCkCNXwY               |
      | 91    | 401                | TarasIstheBest202322                | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vse6uevD1rCIgTg-PGZkxakKwxxgwCkCNXwY      |
      | 92    | 401                | TarasIstheBest202322                | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.                                                 |
      | 92    | 401                | TarasIstheBest2022                  | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vsIgTg-PGZkxakKwxxgwCkCNXwY               |
      | 92    | 401                | TarasIstheBest202322                | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vse6uevD1rCIgTg-PGZkxakKwxxgwCkCNXwY      |
      | 95    | 401                | TarasIstheBest202322                | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.                                                 |
      | 95    | 401                | TarasIstheBest2022                  | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vsIgTg-PGZkxakKwxxgwCkCNXwY               |
      | 95    | 401                | TarasIstheBest202322                | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vse6uevD1rCIgTg-PGZkxakKwxxgwCkCNXwY      |
      | 98    | 401                | TarasIstheBest202322                | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.                                                 |
      | 98    | 401                | TarasIstheBest2022                  | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vsIgTg-PGZkxakKwxxgwCkCNXwY               |
      | 98    | 401                | TarasIstheBest202322                | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vse6uevD1rCIgTg-PGZkxakKwxxgwCkCNXwY      |
      | 91    | 401                | gRNXsbTFjDD39MSK90OAmdSddXC58CLZlcd | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.                                                 |
      | 91    | 401                | gRNXsbTFjDD39MSK90OAmdSddXC58CLZ    | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOq8UFwsfdvck4_Ovjezly5IpgyojEYwg |
      | 91    | 401                | gRNXsbTFjDK9mdSddXC58CLZ            | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOq8UFwk4_Ovjezly5IpgyojEYwg      |
      | 92    | 401                | gRNXsbTFjDD39MSK90OAmdSddXC58CLZlcd | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.                                                 |
      | 92    | 401                | gRNXsbTFjDD39MSK90OAmdSddXC58CLZ    | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOq8UFwsfdvck4_Ovjezly5IpgyojEYwg |
      | 92    | 401                | gRNXsbTFjDK9mdSddXC58CLZ            | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOq8UFwk4_Ovjezly5IpgyojEYwg      |
      | 95    | 401                | gRNXsbTFjDD39MSK90OAmdSddXC58CLZlcd | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.                                                 |
      | 95    | 401                | gRNXsbTFjDD39MSK90OAmdSddXC58CLZ    | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOq8UFwsfdvck4_Ovjezly5IpgyojEYwg |
      | 95    | 401                | gRNXsbTFjDK9mdSddXC58CLZ            | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOq8UFwk4_Ovjezly5IpgyojEYwg      |
      | 98    | 401                | gRNXsbTFjDD39MSK90OAmdSddXC58CLZlcd | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.                                                 |
      | 98    | 401                | gRNXsbTFjDD39MSK90OAmdSddXC58CLZ    | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOq8UFwsfdvck4_Ovjezly5IpgyojEYwg |
      | 98    | 401                | gRNXsbTFjDK9mdSddXC58CLZ            | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOq8UFwk4_Ovjezly5IpgyojEYwg      |


  @TEST_PDM-9547 @regression @authentication @post @apiKey
  Scenario Outline: AT API - Authentication using incorrect x-api-key & adidas-api-key for POST: /{range_id}/token/accessPrivate
    When I use this <range> to send POST Access Private request using API Key "<x-api-key>" & "<Adidas-API-Key>"
    Then I validate status code <expectedStatusCode>

    Examples:
      | range | expectedStatusCode | x-api-key                           | Adidas-API-Key                                                                                                                                                                                                                                                                                                                                           |
      | 91    | 401                | TarasIstheBest202322                | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.                                                 |
      | 91    | 401                | TarasIstheBest2022                  | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vsIgTg-PGZkxakKwxxgwCkCNXwY               |
      | 91    | 401                | TarasIstheBest202322                | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vse6uevD1rCIgTg-PGZkxakKwxxgwCkCNXwY      |
      | 92    | 401                | TarasIstheBest202322                | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.                                                 |
      | 92    | 401                | TarasIstheBest2022                  | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vsIgTg-PGZkxakKwxxgwCkCNXwY               |
      | 92    | 401                | TarasIstheBest202322                | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vse6uevD1rCIgTg-PGZkxakKwxxgwCkCNXwY      |
      | 95    | 401                | TarasIstheBest202322                | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.                                                 |
      | 95    | 401                | TarasIstheBest2022                  | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vsIgTg-PGZkxakKwxxgwCkCNXwY               |
      | 95    | 401                | TarasIstheBest202322                | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vse6uevD1rCIgTg-PGZkxakKwxxgwCkCNXwY      |
      | 98    | 401                | TarasIstheBest202322                | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.                                                 |
      | 98    | 401                | TarasIstheBest2022                  | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vsIgTg-PGZkxakKwxxgwCkCNXwY               |
      | 98    | 401                | TarasIstheBest202322                | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.ChB3-59vse6uevD1rCIgTg-PGZkxakKwxxgwCkCNXwY      |
      | 91    | 401                | gRNXsbTFjDD39MSK90OAmdSddXC58CLZlcd | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.                                                 |
      | 91    | 401                | gRNXsbTFjDD39MSK90OAmdSddXC58CLZ    | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOq8UFwsfdvck4_Ovjezly5IpgyojEYwg |
      | 91    | 401                | gRNXsbTFjDK9mdSddXC58CLZ            | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOq8UFwk4_Ovjezly5IpgyojEYwg      |
      | 92    | 401                | gRNXsbTFjDD39MSK90OAmdSddXC58CLZlcd | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.                                                 |
      | 92    | 401                | gRNXsbTFjDD39MSK90OAmdSddXC58CLZ    | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOq8UFwsfdvck4_Ovjezly5IpgyojEYwg |
      | 92    | 401                | gRNXsbTFjDK9mdSddXC58CLZ            | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOq8UFwk4_Ovjezly5IpgyojEYwg      |
      | 95    | 401                | gRNXsbTFjDD39MSK90OAmdSddXC58CLZlcd | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.                                                 |
      | 95    | 401                | gRNXsbTFjDD39MSK90OAmdSddXC58CLZ    | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOq8UFwsfdvck4_Ovjezly5IpgyojEYwg |
      | 95    | 401                | gRNXsbTFjDK9mdSddXC58CLZ            | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOq8UFwk4_Ovjezly5IpgyojEYwg      |
      | 98    | 401                | gRNXsbTFjDD39MSK90OAmdSddXC58CLZlcd | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.                                                 |
      | 98    | 401                | gRNXsbTFjDD39MSK90OAmdSddXC58CLZ    | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOq8UFwsfdvck4_Ovjezly5IpgyojEYwg |
      | 98    | 401                | gRNXsbTFjDK9mdSddXC58CLZ            | eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVtYmVsbGlzaG1lbnQiLCJkc2MiOiIwIiwicm5nIjoiOTUiLCJyb2xlIjpbInJTdCIsInVTdCIsImljdCIsImNfZW1iZWxsaXNobWVudF9vdyJdLCJuYmYiOjE1NTE5NTYwNDYsImV4cCI6MTcwOTYzNjA0NiwiaWF0IjoxNTUxOTU2MDQ2LCJpc3MiOiJBc3NldE1hbmFnZXIiLCJhdWQiOiJBc3NldE1hbmFnZXIifQ.AwQAmNz0xHlbThOWOq8UFwk4_Ovjezly5IpgyojEYwg      |