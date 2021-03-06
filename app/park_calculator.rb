require_relative 'parkings'
require_relative 'valet_parking_calculator'
require_relative 'short_term_parking_calculator'
require_relative 'economy_parking_calculator'
require_relative 'long_term_parking_calculator'

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
      LongTermParkingCalculator.calculate_garage_cost duration
    when Parkings.long_term_surface
      LongTermParkingCalculator.calculate_surface_cost duration
    end
  end
end
