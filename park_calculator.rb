class ParkCalculator
  attr_reader :parking, :duration

  def initialize(parking, duration)
    @parking = parking
    @duration = duration
  end

  def estimated_cost
    if duration > 0
      cost = 12
      if duration > five_hours
        cost += 6
        if duration > a_day
          cost *= ((duration - 1) / a_day).to_i + 1
        end
      end
    else
      cost = 0
    end
    cost
  end

  private

  def five_hours
    5*60
  end

  def a_day
    24*60
  end
end
