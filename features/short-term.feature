Feature: Short-Term Parking feature
  The parking lot calculator calculates costs for Short-Term Parking.

  Scenario Outline: Calculate Short-Term Parking Cost
    When I park my car in the Short-Term Parking Lot for <parking duration>
    Then I will have to pay <parking costs>

    Examples:
      | parking duration    | parking costs |
      | 30 minutes          | $2            |
      | 1 hour              | $2            |
      | 1 hour 30 minutes   | $3            |
      | 2 hours             | $4            |
      | 3 hours 30 minutes  | $7            |
      | 12 hours 30 minutes | $24           |
      | 1 day 30 minutes    | $25           |
      | 1 day 1 hour        | $26           |
