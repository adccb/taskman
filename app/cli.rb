require "optparse"

require_relative "lib/meetings.rb"
require_relative "lib/fs.rb"

ARGV << '-h' if ARGV.empty?

OptionParser.new do |p|
  p.on('--meeting WHOM', 'who are you meeting with?') do |val|
    Meetings.new.add_person(val)
    puts "Generated new meeting notes with #{val}."
  end
  
  p.on('--tasks', 'create your daily task tracker') do |val|
    FS.new.create_tasks
    puts "Generated new task space for today's date."
  end
end.parse!

