require "date"

class Day
  def initialize(date=Date.today)
    @date = date
  end

  def today
    @date.to_s
  end

  def should_create_new_week
    @date.monday?
  end

  def this_monday
    @date - (@date.wday - 1)
  end
end

