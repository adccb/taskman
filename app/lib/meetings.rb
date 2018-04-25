require_relative "fs"

class Meetings 
  def initialize
    @fs = FS.new
    @persons = @fs.get_persons
  end

  def person_exists?(name)
    @persons.include? name
  end

  def add_person(name)
    if(not person_exists? name)
      @persons.push(name)
    end
    
    @fs.create_meeting(name)
  end
end

