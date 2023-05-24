require_relative './person'
require_relative './classroom'

class Student < Person
  def initialize(id, age, classroom, name = 'Unknown', parent_permission: true)
    super(id, age, name, parent_permission)
    self.classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
  def classroom
    @classroom
  end
end
