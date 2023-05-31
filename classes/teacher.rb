require_relative './person'

class Teacher < Person
  def initialize(specialization, age, name, parent_permission: true, id: Random.rand(1..10_000))
    super(age, name, parent_permission: parent_permission, id: id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(*args)
    {
      'json_class' => self.class.name,
      'data' => { 'id' => @id, 'age' => @age, 'name' => @name, 'specialization' => @specialization }
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['data']['specialization'], object['data']['age'], object['data']['name'],
        parent_permission: object['data']['parent_permission'], id: object['data']['id'])
  end
end
