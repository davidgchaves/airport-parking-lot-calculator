class ShortTimeParkingCalculator
  def self.calculate_cost(duration)
    @duration = duration
    (FULL_DAY_COST * full_days_parked_in) + calculated_cost_for_last_day
  end

  private

  FULL_DAY_COST = 24
  A_MINUTE = 1
  HALF_HOUR = 30
  TWO_HALF_HOURS = 2 * HALF_HOUR
  A_DAY = 24 * 60

  def self.full_days_parked_in
    (@duration + A_MINUTE) / A_DAY
  end

  def self.calculated_cost_for_last_day
    if @duration > 0
      half_hours_parked > 24 ? FULL_DAY_COST : produce_partial_day_cost
    else
      0
    end
  end

  def self.produce_partial_day_cost
    @duration > TWO_HALF_HOURS ? half_hours_parked : 2
  end

  def self.half_hours_parked
    last_day_duration = @duration % A_DAY
    ((last_day_duration - A_MINUTE) / HALF_HOUR) + 1
  end
end
