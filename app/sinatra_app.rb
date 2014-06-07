require 'sinatra'
require_relative 'time_interval'
require_relative 'park_calculator'

class SinatraApp < Sinatra::Base
  get "/" do
    @estimated_cost ||= 0
    erb :index
  end

  post "/" do
    time_interval = TimeInterval.new params["starting-date"], params["starting-time"], params["leaving-date"], params["leaving-time"]
    park_calculator = ParkCalculator.new params["parking-lot"], time_interval.duration

    @estimated_cost = park_calculator.estimated_cost
    erb :index
  end
end
