module Store
  def save_people
    File.open('data/people.json', 'w') do |f|
      f.write(@people.to_json)
    end
  end

  def load_people
    if File.exist?('data/people.json')
    JSON.parse(File.read('data/people.json'), create_additions: true).map do |person|
      @people << person
    end
    end
  end

  def save_books
    File.open('data/books.json', 'w') do |f|
      f.write(@books.to_json)
    end
  end

  def load_books
    if File.exist?('data/books.json')
    JSON.parse(File.read('data/books.json'), create_additions: true).map do |book|
      @books << book
    end
    end
  end

  def save_rentals
    File.open('data/rentals.json', 'w') do |f|
      f.write(@rentals.to_json)
    end
  end

  def load_rentals
    if File.exist?('data/rentals.json')
    JSON.parse(File.read('data/rentals.json')).map do |rental|
      person = @people.find{|person| person.id == rental.person}
      book = @books.find{|book| book.id == rental.book}
      @rentals << Rental.new(rental.date, book, person)
    end
    end
  end
end

