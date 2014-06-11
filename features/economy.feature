Feature: Economy Parking feature
  The parking lot calculator calculates costs for Economy Parking.

  Scenario Outline: Calculate Economy Parking Cost
    When I park my car in the Economy Parking Lot for <parking duration>
    Then I will have to pay <parking costs>

    Examples:
      | parking duration    | parking costs |
      | 30 minutes          | $2            |
      | 1 hour              | $2            |
      | 3 hours             | $6            |
      | 4 hours             | $8            |
      | 5 hours             | $9            |
      | 6 hours             | $9            |
      | 24 hours            | $9            |
      | 1 day 1 hour        | $11           |
      | 1 day 3 hours       | $15           |
      | 1 day 5 hours       | $18           |
      | 3 days              | $27           |
      | 6 days              | $54           |
      | 1 week              | $54           |
      | 1 week 2 days       | $72           |
      | 3 weeks             | $162          |
