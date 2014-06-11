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
      @duration > FOUR_HOURS ? FULL_DAY_COST : hours_parked * PRICE_PER_HOUR
    end
  end

  private

  A_MINUTE = 1
  AN_HOUR = 60
  FOUR_HOURS = 4 * 60
  PRICE_PER_HOUR = 2
  FULL_DAY_COST = 9

  def hours_parked
    ((duration - A_MINUTE) / AN_HOUR) + 1
  end
end
