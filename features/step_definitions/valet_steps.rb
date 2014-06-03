When /^I park my car in the Valet Parking Lot for (#{CAPTURE_DURATION})$/ do |duration|
  create_a_park_calculator "Valet Parking", duration
end

Then /^I will have to pay (#{CAPTURE_CASH_AMOUNT})/ do |price|
  expect(park_calculator.estimated_cost).to eq price
end
