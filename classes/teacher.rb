require_relative './person'

class Teacher < Person
  def initialize(specialization, age, name, parent_permission: true, id: Random.rand(1..10_000))
    super(age, name, parent_permission: parent_permission, id: id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(*a)
    {
      'json_class' => self.class.name,
      'data' => { 'id' => @id, 'age' => @age, 'name' => @name, 'specialization' => @specialization}
    }.to_json(*a)
  end 

  def self.json_create(o)
    new(o['data']['specialization'], o['data']['age'], o['data']['name'], parent_permission: o['data']['parent_permission'], id: o['data']['id'])
  end

end