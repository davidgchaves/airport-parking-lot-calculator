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
      duration > SIX_HOURS ? DISCOUNTED_DAY_COST : (hours_parked(duration) + 1) * HOUR_COST
    end
  end

  private

  A_MINUTE = 1
  AN_HOUR = 60 * A_MINUTE
  SIX_HOURS = 6 * AN_HOUR

  HOUR_COST = 2
  DISCOUNTED_DAY_COST = 12

  def hours_parked(duration)
    (duration - A_MINUTE) / AN_HOUR
  end
end
