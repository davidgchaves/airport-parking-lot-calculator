require 'time_difference'

class TimeInterval
  def initialize(times_and_dates)
    @starting = TimeInterval.build_time times_and_dates["starting_date"], times_and_dates["starting_time"]
    @leaving = TimeInterval.build_time times_and_dates["leaving_date"], times_and_dates["leaving_time"]
  end

  def duration
    TimeDifference.between(@starting, @leaving).in_minutes.to_i
  end

  private

  def self.build_time(date, time)
    Time.parse "#{date.chomp '/'} #{time}"
  end
end
