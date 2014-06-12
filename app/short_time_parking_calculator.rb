class ShortTimeParkingCalculator
  def self.calculate_cost(duration)
    @duration = duration
    (DISCOUNTED_DAY_COST * days_parked(duration)) + last_day_cost(last_day_duration(duration))
  end

  private

  A_MINUTE = 1
  A_HALF_HOUR = 30
  TWO_HALF_HOURS = 2 * A_HALF_HOUR
  TWENTY_FOUR_HALF_HOURS = 24 * A_HALF_HOUR
  A_DAY = 48 * A_HALF_HOUR

  DISCOUNTED_DAY_COST = 24

  def self.days_parked(duration)
    (duration - A_MINUTE) / A_DAY
  end

  def self.half_hours_parked(duration)
    (duration - A_MINUTE) / A_HALF_HOUR
  end

  def self.last_day_cost(duration)
    duration > TWENTY_FOUR_HALF_HOURS ? DISCOUNTED_DAY_COST : produce_day_cost(duration)
  end

  def self.produce_day_cost(duration)
    @duration > TWO_HALF_HOURS ? half_hours_parked(duration) + 1 : 2
  end

  def self.last_day_duration(duration)
    duration - (days_parked(duration) * A_DAY)
  end
end
