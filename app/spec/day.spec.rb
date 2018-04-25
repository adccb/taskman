require "minitest/autorun"
require "date"

require_relative "../lib/day.rb"

describe Day, :initialize do
  it "should use the provided date or today's date" do
    today = Date.today
    day = Day.new

    assert_equal today, day.instance_variable_get(:@date)
    
    today = Date.parse "2016-12-25"
    day = Day.new today

    assert_equal today, day.instance_variable_get(:@date)
  end
end

describe Day, :this_monday do
  it "should return the date of this monday" do
    this_monday = Date.parse "2018-04-23"
    today = Date.parse "2018-04-25"
    day = Day.new today

    assert_equal this_monday, day.this_monday
  end
end


