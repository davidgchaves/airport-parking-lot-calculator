require 'sinatra'
require_relative 'time_interval'
require_relative 'park_calculator'

class SinatraApp < Sinatra::Base
  get "/" do
    initialize_ui_values

    erb :index
  end

  post "/" do
    set_parking_lot_and_dates
    @estimated_cost = calculate_estimated_cost

    erb :index
  end

  private

  def initialize_ui_values
    @estimated_cost ||= 0
    @starting_date ||= "YYYY/MM/DD"
    @starting_time ||= "12:00"
    @leaving_date ||=  "YYYY/MM/DD"
    @leaving_time ||= "12:00"
  end

  def set_parking_lot_and_dates
    @parking_lot = params["parking-lot"]
    @starting_date = params["starting-date"]
    @starting_time = params["starting-time"]
    @leaving_date = params["leaving-date"]
    @leaving_time = params["leaving-time"]
  end

  def calculate_estimated_cost
    time_interval = TimeInterval.new @starting_date, @starting_time, @leaving_date, @leaving_time
    park_calculator = ParkCalculator.new @parking_lot, time_interval.duration
    park_calculator.estimated_cost
  end
end
