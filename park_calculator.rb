class ParkCalculator
  attr_reader :parking, :duration

  def initialize(parking, duration)
    @parking = parking
    @duration = duration
  end

  def estimated_cost
    0
  end
end
