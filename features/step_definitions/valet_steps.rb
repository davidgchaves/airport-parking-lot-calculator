When /^I park my car in the Valet Parking Lot for (.*)$/ do |duration|
  ParkCalculator.park_car_in "Valet Parking"
  ParkCalculator.for duration
end

Then /^I will have to pay (.*)$/ do |price|
  pending # express the regexp above with the code you wish you had
end
