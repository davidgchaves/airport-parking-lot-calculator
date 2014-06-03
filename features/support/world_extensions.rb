module KnowsTheParkCalculator
  def create_a_park_calculator(parking, duration)
    @park_calculator = ParkCalculator.new parking, duration
  end

  def park_calculator
    @park_calculator ||= create_a_park_calculator "test", 0
  end
end

World KnowsTheParkCalculator
