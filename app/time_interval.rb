require 'time_difference'

class TimeInterval
  def initialize(starting_date, starting_time, leaving_date, leaving_time)
    @starting = TimeInterval.build_time starting_date, starting_time
    @leaving = TimeInterval.build_time leaving_date, leaving_time
  end

  def duration
    TimeDifference.between(@starting, @leaving).in_minutes.to_i
  end

  private

  def self.build_time(date, time)
    Time.parse "#{date.chomp '/'} #{time}"
  end
end
