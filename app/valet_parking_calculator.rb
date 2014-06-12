class ValetParkingCalculator
  def self.calculate_cost(duration)
    day_cost(duration) * (days_parked(duration) + 1)
  end

  private

  A_MINUTE = 1
  FIVE_HOURS = 5*60
  A_DAY = 24*60

  FIVE_HOURS_COST = 12
  DAY_COST = 18

  def self.day_cost(duration)
    duration > FIVE_HOURS ? DAY_COST : FIVE_HOURS_COST
  end

  def self.days_parked(duration)
    (duration - A_MINUTE) / A_DAY
  end
end
