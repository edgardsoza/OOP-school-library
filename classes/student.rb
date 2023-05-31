require_relative './person'
require_relative './classroom'
require 'json'

class Student < Person
  def initialize(age, name = 'Unknown', parent_permission: true, id: Random.rand(1..10_000))
    super(age, name, parent_permission: parent_permission, id: id)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  attr_reader :classroom

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def to_json(*a)
    {
      'json_class' => self.class.name,
      'data' => { 'id' => @id, 'age' => @age, 'name' => @name, 'parent_permission' => @parent_permission }
    }.to_json(*a)
  end 

  def self.json_create(o)
    new(o['data']['age'], o['data']['name'], parent_permission: o['data']['parent_permission'], id: o['data']['id'])
  end

end
