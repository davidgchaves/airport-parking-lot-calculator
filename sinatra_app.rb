require 'sinatra'

get "/" do
  erb :index 
end

post "/calculate" do
  p params.inspect
end
