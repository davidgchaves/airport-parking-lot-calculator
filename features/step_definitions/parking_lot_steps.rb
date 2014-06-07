When /^I park my car in the (.*) Lot for (.*)$/ do |parking_lot, duration|
  create_a_park_calculator parking_lot, duration
end

Then /^I will have to pay (#{CAPTURE_CASH_AMOUNT})/ do |price|
  within "#estimated_cost" do
    expect(page).to have_content price
  end
end
