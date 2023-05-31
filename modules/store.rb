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

end

