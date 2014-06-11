require 'sinatra'
require 'sinatra/form_helpers'
require_relative 'time_interval'
require_relative 'park_calculator'

class SinatraApp < Sinatra::Base
  helpers Sinatra::FormHelpers

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
  end

  def set_parking_lot_and_dates
    @parking_lot = params["parking-lot"]
    @times_and_dates = params["times_and_dates"]
  end

  def calculate_estimated_cost
    time_interval = TimeInterval.new @times_and_dates
    park_calculator = ParkCalculator.new @parking_lot, time_interval.duration
    park_calculator.estimated_cost
  end
end
