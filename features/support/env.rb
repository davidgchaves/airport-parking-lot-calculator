ENV['RACK_ENV'] = 'test'

require_relative '../../app/sinatra_app.rb'

require 'capybara/cucumber'

Capybara.app = SinatraApp
