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
    else
      ShortTimeParkingCalculator.calculate_cost duration
    end
  end
end
