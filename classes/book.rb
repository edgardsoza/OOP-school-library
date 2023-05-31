require 'json'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author, id: Random.rand(1..10_000))
    @id = id
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end

  def to_json(*a)
    {
      "id" => @id,
      "title" => @title,
      "author" => @author
    }.to_json(*a)
  end

  def self.json_create(o)
    new(o["title"], o["author"], id: o["id"])
  end

end
