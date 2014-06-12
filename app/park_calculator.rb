require_relative 'parkings'
require_relative 'valet_parking_calculator'
require_relative 'short_time_parking_calculator'

class ParkCalculator
  attr_reader :parking, :duration

  def initialize(parking, duration)
    @parking = parking
    @duration = duration
  end

  def estimated_cost
    if parking == Parkings.valet
      ValetParkingCalculator.calculate_cost duration
    elsif parking == Parkings.short_term
      ShortTimeParkingCalculator.calculate_cost duration
    else parking == Parkings.economy
      duration > SIX_DAYS ? DISCOUNTED_WEEK_COST : (DISCOUNTED_DAY_COST * full_days_parked(duration)) + last_day_cost(last_day_duration(duration))
    end
  end

  private

  A_MINUTE = 1
  AN_HOUR = 60
  FOUR_HOURS = 4 * AN_HOUR
  A_DAY = 24 * AN_HOUR
  SIX_DAYS = 6 * A_DAY

  HOUR_COST = 2
  DISCOUNTED_DAY_COST = 9
  DISCOUNTED_WEEK_COST = 54

  def full_days_parked(duration)
    (duration - A_MINUTE) / A_DAY
  end

  def last_day_cost(duration)
    duration > FOUR_HOURS ? DISCOUNTED_DAY_COST : (hours_parked(duration) + 1) * HOUR_COST
  end

  def last_day_duration(duration)
    duration - (full_days_parked(duration) * A_DAY)
  end

  def hours_parked(duration)
    ((duration - A_MINUTE) / AN_HOUR)
  end
end
