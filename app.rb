require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './classroom'
require_relative './book'
require_relative './rental'
require_relative './decorator'
require_relative './trimmerdecorator'
require_relative './capitalizedecorator'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_books
    if @books.empty?
      puts 'No books available.'
    else
      puts '=== All Books ==='
      @books.each do |book|
        puts "Title: #{book.title}"
        puts "Author: #{book.author}"
        puts '---'
      end
    end
  end

  def list_all_people
    if @people.empty?
      puts 'No people available.'
    else
      puts '=== All People ==='
      @people.each do |person|
        puts "Id: #{person.id}"
        puts "Name: #{person.name}"
        puts "Age: #{person.age}"
        puts '---'
      end
    end
  end

  def create_person
    puts 'Select the person type:'
    puts '1. Student'
    puts '2. Teacher'
    person_type = gets.chomp.to_i

    case person_type
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid option. Person not created.'
    end
  end

  def create_student
    puts 'Enter student name:'
    name = gets.chomp

    puts 'Enter student age:'
    age = gets.chomp.to_i

    puts 'Does the student have parent permission? (Y/N)'
    parent_permission = gets.chomp.strip.upcase
    case parent_permission
    when 'Y'
      student = Student.new(age, name, parent_permission: true)
      @people.push(student)
      puts 'Student with parent permission created successfully.'
    when 'N'
      student = Student.new(age, name, parent_permission: false)
      @people.push(student)
      puts 'Student without parent permission created successfully.'
    else
      puts 'Invalid option. Student not created.'
    end
  end

  def create_teacher
    puts "teacher's specialization: "
    specialization = gets.chomp

    puts 'Enter teacher age:'
    age = gets.chomp.to_i

    puts 'Enter teacher name:'
    name = gets.chomp

    teacher = Teacher.new(specialization, age, name, parent_permission: true)
    @people.push(teacher)
    puts 'Teacher created successfully.'
  end

  def create_book
    puts 'Enter the book title:'
    title = gets.chomp

    puts 'Enter the book author:'
    author = gets.chomp

    book = Book.new(title, author)
    @books << book

    puts 'Book created successfully:'
  end

  def create_rental
    return puts 'No books available.' if @books.empty?
    return puts 'No people available.' if @people.empty?

    puts '=== Select a Book ==='
    @books.each_with_index { |book, index| puts "#{index + 1}. #{book.title} by #{book.author}" }
    book_index = gets.chomp.to_i - 1
    selected_book = @books[book_index]

    puts '=== Select a Person === Use number and not Id'
    @people.each_with_index do |person, index|
      puts "#{index + 1}. #{person.name}, Id: #{person.id} , Age: #{person.age}"
    end
    person_index = gets.chomp.to_i - 1
    selected_person = @people[person_index]

    puts 'Enter the rental date (YYYY-MM-DD):'
    date = gets.chomp

    rental = Rental.new(date, selected_book, selected_person)
    @rentals << rental

    puts 'Rental created successfully:'
    puts "Book: #{selected_book.title} by #{selected_book.author}"
    puts "Person: #{selected_person.name}, Age: #{selected_person.age}"
    puts "Date: #{rental.date}"
  end

  def rental_list
    puts 'Enter the person ID:'
    person_id = gets.chomp.to_i

    rentals = @rentals.select { |rental| rental.person.id == person_id }

    if rentals.empty?
      puts "No rentals found for person with ID #{person_id}."
    else
      puts "=== Rentals for Person ID #{person_id} ==="
      rentals.each do |rental|
        puts "Book: #{rental.book.title} by #{rental.book.author}"
        puts "Rental Date: #{rental.date}"
        puts '---'
      end
    end
  end
end
