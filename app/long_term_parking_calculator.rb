class LongTermParkingCalculator
  def self.calculate_garage_cost(duration)
    DISCOUNTED_WEEK_COST_FOR_GARAGE * weeks_parked(duration) +
      last_week_cost(last_week_duration(duration), DISCOUNTED_WEEK_COST_FOR_GARAGE, CUT_HOUR_FOR_GARAGE, DISCOUNTED_DAY_COST_FOR_GARAGE)
  end

  def self.calculate_surface_cost(duration)
    DISCOUNTED_WEEK_COST_FOR_SURFACE * weeks_parked(duration) +
      last_week_cost(last_week_duration(duration), DISCOUNTED_WEEK_COST_FOR_SURFACE, CUT_HOUR_FOR_SURFACE, DISCOUNTED_DAY_COST_FOR_SURFACE)
  end

  private

  A_MINUTE = 1
  AN_HOUR = 60 * A_MINUTE
  FIVE_HOURS = 5 * AN_HOUR
  SIX_HOURS = 6 * AN_HOUR
  A_DAY = 24 * AN_HOUR
  SIX_DAYS = 6 * A_DAY
  A_WEEK = 7 * A_DAY

  HOUR_COST = 2
  CUT_DAY = SIX_DAYS

  CUT_HOUR_FOR_GARAGE = SIX_HOURS
  DISCOUNTED_DAY_COST_FOR_GARAGE = 12
  DISCOUNTED_WEEK_COST_FOR_GARAGE = 72

  CUT_HOUR_FOR_SURFACE = FIVE_HOURS
  DISCOUNTED_DAY_COST_FOR_SURFACE = 10
  DISCOUNTED_WEEK_COST_FOR_SURFACE = 60

  def self.weeks_parked(duration)
    (duration - A_MINUTE) / A_WEEK
  end

  def self.last_week_cost(duration, discounted_week_cost, cut_hour, discounted_day_cost)
    duration > CUT_DAY ? discounted_week_cost : produce_week_cost(duration, cut_hour, discounted_day_cost)
  end

  def self.last_week_duration(duration)
    duration - (weeks_parked(duration) * A_WEEK)
  end

  def self.produce_week_cost(duration, cut_hour, discounted_day_cost)
    discounted_day_cost * days_parked(duration) + last_day_cost(last_day_duration(duration), cut_hour, discounted_day_cost)
  end

  def self.days_parked(duration)
    (duration - A_MINUTE) / A_DAY
  end

  def self.last_day_cost(duration, cut_hour, discounted_day_cost)
    duration > cut_hour ? discounted_day_cost : produce_day_cost(duration)
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
