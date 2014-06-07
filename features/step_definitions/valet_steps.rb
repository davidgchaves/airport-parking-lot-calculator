When /^I park my car in the Valet Parking Lot for (#{CAPTURE_DURATION})$/ do |duration|
  create_a_park_calculator "Valet Parking", duration
end

Then /^I will have to pay (#{CAPTURE_CASH_AMOUNT})/ do |price|
  within "#estimated_cost" do
    expect(page).to have_content price
  end
end
