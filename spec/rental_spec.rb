require_relative '../classes/rental'

class Person
  attr_accessor :name, :age, :parent_permission
  attr_reader :id, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true, id: Random.rand(1..10_000))
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end
end

class Book
  attr_accessor :title, :author, :rentals
  attr_reader :id

  def initialize(title, author, id: Random.rand(1..10_000))
    @id = id
    @title = title
    @author = author
    @rentals = []
  end
end

describe Rental do
  person = Person.new(22, 'Yusef', parent_permission: true, id: 1)
  book = Book.new('Carpenter', 'Jack Wild', id: 1)
  rental = Rental.new('2023-02-08', book, person)

  context 'Testing the Rental class' do
    it 'creating an instance of the rental class' do
      expect(rental).to be_instance_of(Rental)
    end
  end

  context 'Test the to_json method in Rental' do
    it 'passes the info as a json format to store' do
      expect(rental.to_json).to eq('{"json_class":"Rental","date":"2023-02-08","book":1,"person":1}')
    end
  end
end
