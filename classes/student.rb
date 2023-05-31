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

  def to_json(*args)
    {
      'json_class' => self.class.name,
      'data' => { 'id' => @id, 'age' => @age, 'name' => @name, 'classroom' => @classroom, 'parent_permission' => @parent_permission }
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['data']['age'], object['data']['name'], parent_permission: object['data']['parent_permission'],
                                                       id: object['data']['id'])
  end
end
