require_relative '../classes/trimmerdecorator'

class Person < Nameable
  attr_reader :name

  def initialize(age, name = 'Unknown', parent_permission: true, id: Random.rand(1..10_000))
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end
end

describe TrimmerDecorator do
  context 'Testing the TrimmerDecorator class' do
    it "The correct_name method should trim the person's name" do
      person = Person.new(30, 'Maximilianus')
      person_trim = TrimmerDecorator.new(person)
      expect(person_trim.correct_name).to eq 'Maximilian'
    end
  end
end
