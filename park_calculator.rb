class ParkCalculator
  attr_reader :parking, :duration

  def initialize(parking, duration)
    @parking = parking
    @duration = duration
  end

  def estimated_cost
    if duration > 0
      cost = 12
      if duration > 5*60
        cost += 6
      end
    else
      cost = 0
    end
    return cost
  end
end
