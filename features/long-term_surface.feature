Feature: Long-Term Surface Parking feature
  The parking lot calculator calculates costs for Long-Term Surface Parking.

  Scenario Outline: Calculate Long-Term Surface Parking Cost
    When I park my car in the Long-Term Surface Parking Lot for <parking duration>
    Then I will have to pay <parking costs>

    Examples:
      | parking duration | parking costs |
      | 30 minutes       | $2            |
      | 1 hour           | $2            |
      | 3 hours          | $6            |
      | 5 hours          | $10           |
      | 6 hours          | $10           |
      | 24 hours         | $10           |
      | 1 day 1 hour     | $12           |
      | 1 day 3 hours    | $16           |
      | 1 day 6 hours    | $20           |
      | 3 days           | $30           |
      | 6 days           | $60           |
      | 6 days 1 hour    | $60           |
      | 1 week           | $60           |
      | 1 week 2 days    | $80           |
      | 3 weeks          | $180          |
