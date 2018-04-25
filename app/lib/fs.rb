require "date"
require_relative "day"

class FS
  def initialize
    @day = Day.new
    @file_contents = Proc.new { |f, date| f.write("# #{date}\n\n") }
  end

  def get_persons
    Dir.entries("meetings").map { |p| p.gsub('.md', '') }
  end

  def should_create_file(path)
    not File.exist? path
  end

  def create_meeting(name) 
    path = "meetings/#{name}.md"
    opt = should_create_file(path) ? 'w' : 'a+'
    File.open(path, opt) { |f| @file_contents.call(f, @day.today) }
  end
  
  def create_tasks
    path = "tasks/week-of-#{@day.this_monday}.md"
    opt = @day.should_create_new_week ? 'w' : 'a+'
    File.open(path, opt) { |f| @file_contents.call(f, @day.today) }
  end
end

