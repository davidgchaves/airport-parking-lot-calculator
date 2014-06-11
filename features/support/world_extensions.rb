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
        "30 minutes"          => ["2014/11/20", "11:00", "2014/11/20", "11:30"],
        "1 hour"              => ["2014/11/20", "11:00", "2014/11/20", "12:00"],
        "1 hour 30 minutes"   => ["2014/11/20", "11:00", "2014/11/20", "12:30"],
        "2 hours"             => ["2014/11/20", "11:00", "2014/11/20", "13:00"],
        "3 hours"             => ["2014/11/20", "11:00", "2014/11/20", "14:00"],
        "3 hours 30 minutes"  => ["2014/11/20", "11:00", "2014/11/20", "14:30"],
        "5 hours"             => ["2014/11/20", "11:00", "2014/11/20", "16:00"],
        "5 hours 1 minute"    => ["2014/11/20", "11:00", "2014/11/20", "16:01"],
        "12 hours"            => ["2014/11/20", "11:00", "2014/11/20", "23:00"],
        "12 hours 30 minutes" => ["2014/11/20", "11:00", "2014/11/20", "23:30"],
        "24 hours"            => ["2014/11/20", "11:00", "2014/11/21", "11:00"],
        "1 day 1 minute"      => ["2014/11/20", "11:00", "2014/11/21", "11:01"],
        "1 day 30 minutes"    => ["2014/11/20", "11:00", "2014/11/21", "11:30"],
        "1 day 1 hour"        => ["2014/11/20", "11:00", "2014/11/21", "12:00"],
        "3 days"              => ["2014/11/20", "11:00", "2014/11/23", "11:00"],
        "6 days 1 hour"       => ["2014/11/20", "11:00", "2014/11/26", "12:00"],
        "1 week"              => ["2014/11/20", "11:00", "2014/11/27", "11:00"],
      }
    end

    def fill_in_parking_lot_form_with(parking, duration)
      starting_date, starting_time, leaving_date, leaving_time = duration_map_for_ui[duration.to_s]

      visit "/"

      select parking, from: "parking-lot"

      fill_in "times_and_dates_starting_date", with: starting_date
      fill_in "times_and_dates_starting_time", with: starting_time

      fill_in "times_and_dates_leaving_date", with: leaving_date
      fill_in "times_and_dates_leaving_time", with: leaving_time
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
