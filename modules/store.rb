module Store
  def save_people
    File.open('data/people.json', 'w') do |f|
      f.write(@people.to_json)
    end
  end

  def load_people
    JSON.parse(File.read('data/people.json'), create_additions: true).map do |person|
      @people << person
    end
  end

end

