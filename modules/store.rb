module Store
  def save_people
    File.write('data/people.json', @people.to_json)
  end

  def load_people
    return unless File.exist?('data/people.json')

    JSON.parse(File.read('data/people.json'), create_additions: true).map do |person|
      @people << person
    end
  end

  def save_books
    File.write('data/books.json', @books.to_json)
  end

  def load_books
    return unless File.exist?('data/books.json')

    JSON.parse(File.read('data/books.json'), create_additions: true).map do |book|
      @books << book
    end
  end

  def save_rentals
    File.write('data/rentals.json', @rentals.to_json)
  end

  def load_rentals
    return unless File.exist?('data/rentals.json')

    JSON.parse(File.read('data/rentals.json')).map do |rental|
      person = @people.find { |person_object| person_object.id == rental['person'] }
      book = @books.find { |book_object| book_object.id == rental['book'] }
      @rentals << Rental.new(rental['date'], book, person)
    end
  end
end
