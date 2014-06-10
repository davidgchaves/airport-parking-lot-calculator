class ValetParkingCalculator
  def self.calculate_cost(duration)
    @duration = duration
    charge_per_day * number_of_days
  end

  private

  FIVE_HOURS = 5*60
  A_DAY = 24*60

  def self.charge_per_day
    12 + more_than_five_hours_charge
  end

  def self.number_of_days
    ((@duration - 1) / A_DAY) + 1
  end

  def self.more_than_five_hours_charge
    @duration > FIVE_HOURS ? 6 : 0
  end
end
