When /^I park my car in the Valet Parking Lot for (.*)$/ do |duration|
  @park_calculator = ParkCalculator.new "Valet Parking", duration
end

Then /^I will have to pay \$ (.*)$/ do |price|
  expect(@park_calculator.estimated_cost).to eq price
end
