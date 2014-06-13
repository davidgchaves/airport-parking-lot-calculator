require_relative 'parkings'
require_relative 'valet_parking_calculator'
require_relative 'short_term_parking_calculator'
require_relative 'economy_parking_calculator'

class ParkCalculator
  attr_reader :parking, :duration

  def initialize(parking, duration)
    @parking = parking
    @duration = duration
  end

  def estimated_cost
    case parking
    when Parkings.valet
      ValetParkingCalculator.calculate_cost duration
    when Parkings.short_term
      ShortTimeParkingCalculator.calculate_cost duration
    when Parkings.economy
      EconomyParkingCalculator.calculate_cost duration
    when Parkings.long_term_garage
      duration > SIX_DAYS ? DISCOUNTED_WEEK_COST : produce_week_cost(duration)
    end
  end

  private

  A_MINUTE = 1
  AN_HOUR = 60 * A_MINUTE
  SIX_HOURS = 6 * AN_HOUR
  A_DAY = 24 * AN_HOUR
  SIX_DAYS = 6 * A_DAY

  HOUR_COST = 2
  DISCOUNTED_DAY_COST = 12
  DISCOUNTED_WEEK_COST = 72

  def produce_week_cost(duration)
    DISCOUNTED_DAY_COST * days_parked(duration) + last_day_cost(last_day_duration(duration))
  end

  def last_day_cost(duration)
    duration > SIX_HOURS ? DISCOUNTED_DAY_COST : produce_day_cost(duration)
  end

  def produce_day_cost(duration)
    HOUR_COST * (hours_parked(duration) + 1)
  end

  def hours_parked(duration)
    (duration - A_MINUTE) / AN_HOUR
  end

  def days_parked(duration)
    (duration - A_MINUTE) / A_DAY
  end

  def last_day_duration(duration)
    duration - (days_parked(duration) * A_DAY)
  end
end
