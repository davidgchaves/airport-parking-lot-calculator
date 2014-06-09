require_relative 'parkings'

class ParkCalculator
  attr_reader :parking, :duration

  def initialize(parking, duration)
    @parking = parking
    @duration = duration
  end

  def estimated_cost
    if parking == Parkings.valet
      duration > 0 ? charge_per_day * number_of_days : 0
    else
      duration > 0 ? 2 : 0
    end
  end

  private

  def charge_per_day
    12 + more_than_five_hours_charge
  end

  def number_of_days
    ((duration - 1) / a_day).to_i + 1
  end

  def more_than_five_hours_charge
    duration > five_hours ? 6 : 0
  end

  def five_hours
    5*60
  end

  def a_day
    24*60
  end
end
