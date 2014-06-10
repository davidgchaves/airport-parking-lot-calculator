require_relative 'parkings'

class ParkCalculator
  attr_reader :parking, :duration

  def initialize(parking, duration)
    @parking = parking
    @duration = duration
  end

  def estimated_cost
    if parking == Parkings.valet
      charge_per_day * number_of_days
    else
      (full_days_parked_in * MAXIMUM_COST_PER_DAY) + calculated_cost_for_last_day
    end
  end

  private
  # Short-Time Helpers
  MAXIMUM_COST_PER_DAY = 24

  def full_days_parked_in
    (duration + 1) / (24 * 60)
  end

  def calculated_cost_for_last_day
    if duration > 0
      2 + ((in_what_half_hour > 24 ? MAXIMUM_COST_PER_DAY : calculated_cost) - 2)
    else
      0
    end
  end

  def calculated_cost
    duration > 2*30 ? in_what_half_hour : 2
  end

  def in_what_half_hour
    last_day_duration = duration % (24 * 60)
    ((last_day_duration - 1) / 30) + 1
  end

  # Valet Helpers
  FIVE_HOURS = 5*60
  A_DAY = 24*60

  def charge_per_day
    12 + more_than_five_hours_charge
  end

  def number_of_days
    ((duration - 1) / A_DAY).to_i + 1
  end

  def more_than_five_hours_charge
    duration > FIVE_HOURS ? 6 : 0
  end
end
