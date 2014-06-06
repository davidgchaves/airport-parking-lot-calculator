ENV['RACK_ENV'] = 'test'

require_relative '../../sinatra_app.rb'

require 'capybara/cucumber'

Capybara.app = Sinatra::Application
