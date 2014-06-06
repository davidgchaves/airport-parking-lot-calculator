module KnowsTheSinatraApp
  class SinatraUserInterface
    include Capybara::DSL

    def calculate_estimated_cost parking, duration
      fill_in_parking_lot_form_with parking, duration
      calculate_cost
    end

    private

    def duration_map_for_ui
      {
        "30" => ["2014/11/20", "11:00", "2014/11/20", "11:30"]
      }
    end

    def fill_in_parking_lot_form_with(parking, duration)
      starting_date, starting_time, leaving_date, leaving_time = duration_map_for_ui[duration.to_s]

      visit "/"

      select parking, from: "parking-lot"

      fill_in "starting-date", with: starting_date
      fill_in "starting-time", with: starting_time

      fill_in "leaving-date", with: leaving_date
      fill_in "leaving-time", with: leaving_time
    end

    def calculate_cost
      click_button "Calculate"
    end
  end

  def create_a_park_calculator(parking, duration)
    @park_calculator = SinatraUserInterface.new
    @park_calculator.calculate_estimated_cost parking, duration
  end

  def park_calculator
    @park_calculator ||= create_a_park_calculator "test", 0
  end
end

World KnowsTheSinatraApp
