require_relative '../app/time_interval'

describe TimeInterval do
  let(:starting_date) { "2014/12/20" }
  let(:starting_time) { "20:10" }
  let(:leaving_date) { "2014/12/20" }
  let(:times_and_dates) { {"starting_date" => "2014/12/20", "starting_time" => "20:10",
                           "leaving_date"  => "2014/12/20", "leaving_time"  => "20:40"} }

  it "can be constructed as a 30 minutes interval" do
    a_time_interval = TimeInterval.new times_and_dates
    expect(a_time_interval.duration).to eq 30
  end

  it "can be constructed as a 2 hours interval" do
    times_and_dates["leaving_time"] = "22:10"

    a_time_interval = TimeInterval.new times_and_dates
    expect(a_time_interval.duration).to eq 2*60
  end

  it "can be constructed as a 1 week and 2 minutes interval" do
    times_and_dates["leaving_date"] = "2014/12/27"
    times_and_dates["leaving_time"] = "20:12"

    a_time_interval = TimeInterval.new times_and_dates
    expect(a_time_interval.duration).to eq 7*24*60 + 2
  end
end
