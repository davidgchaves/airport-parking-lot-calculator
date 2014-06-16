class LongTermParkingCalculator
  def self.calculate_cost(parking, duration)
    DISCOUNTED_WEEK_COST * weeks_parked(duration) + last_week_cost(last_week_duration(duration))
  end

  private

  A_MINUTE = 1
  AN_HOUR = 60 * A_MINUTE
  SIX_HOURS = 6 * AN_HOUR
  A_DAY = 24 * AN_HOUR
  SIX_DAYS = 6 * A_DAY
  A_WEEK = 7 * A_DAY

  HOUR_COST = 2
  DISCOUNTED_DAY_COST = 12
  DISCOUNTED_WEEK_COST = 72

  def self.weeks_parked(duration)
    (duration - A_MINUTE) / A_WEEK
  end

  def self.last_week_cost(duration)
    duration > SIX_DAYS ? DISCOUNTED_WEEK_COST : produce_week_cost(duration)
  end

  def self.last_week_duration(duration)
    duration - (weeks_parked(duration) * A_WEEK)
  end

  def self.produce_week_cost(duration)
    DISCOUNTED_DAY_COST * days_parked(duration) + last_day_cost(last_day_duration(duration))
  end

  def self.days_parked(duration)
    (duration - A_MINUTE) / A_DAY
  end

  def self.last_day_cost(duration)
    duration > SIX_HOURS ? DISCOUNTED_DAY_COST : produce_day_cost(duration)
  end

  def self.last_day_duration(duration)
    duration - (days_parked(duration) * A_DAY)
  end

  def self.produce_day_cost(duration)
    HOUR_COST * (hours_parked(duration) + 1)
  end

  def self.hours_parked(duration)
    (duration - A_MINUTE) / AN_HOUR
  end
end
