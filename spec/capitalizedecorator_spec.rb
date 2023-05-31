require_relative '../classes/capitalizedecorator'

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

describe CapitalizeDecorator do 
    context "Testing the CapitalizeDecorator class" do
        it "The correct_name method should capitalize first letter of the person's name" do
            person = Person.new(30, 'juan')
            person_capitalize = CapitalizeDecorator.new(person)
            expect(person_capitalize.correct_name.capitalize).to eq 'Juan'
        end
    end
end
