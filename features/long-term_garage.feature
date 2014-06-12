Feature: Long-Term Garage Parking feature
  The parking lot calculator calculates costs for Long-Term Garage Parking.

  Scenario Outline: Calculate Long-Term Garage Parking Cost
    When I park my car in the Long-Term Garage Parking Lot for <parking duration>
    Then I will have to pay <parking costs>

    Examples:
      | parking duration | parking costs |
      | 30 minutes       | $2            |
      | 1 hour           | $2            |
      | 3 hours          | $6            |
      | 6 hours          | $12           |
      | 7 hours          | $12           |
      | 24 hours         | $12           |
      | 1 day 1 hour     | $14           |
      | 1 day 3 hours    | $18           |
      | 1 day 7 hours    | $24           |
      | 6 days           | $72           |
      | 6 days 1 hour    | $72           |
      | 1 week           | $72           |
      | 1 week 2 days    | $96           |
      | 3 weeks          | $216          |
