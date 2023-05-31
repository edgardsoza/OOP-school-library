require 'json'

class Book
  attr_accessor :title, :author, :rentals
  attr_reader :id

  def initialize(title, author, id: Random.rand(1..10_000))
    @id = id
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end

  def to_json(*args)
    {
      'json_class' => self.class.name,
      'id' => @id,
      'title' => @title,
      'author' => @author
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['title'], object['author'], id: object['id'])
  end
end
