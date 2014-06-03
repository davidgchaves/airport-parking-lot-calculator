CAPTURE_DURATION = Transform /^(\d+)\s(\w+)$/ do |duration, unit|
  duration.to_i if unit == "minutes"
end

CAPTURE_CASH_AMOUNT = Transform /^\$(\d+)$/ do |amount|
  amount.to_i
end
