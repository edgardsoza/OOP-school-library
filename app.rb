require_relative 'classes/person'
require_relative 'classes/student'
require_relative 'classes/teacher'
require_relative 'classes/classroom'
require_relative 'classes/book'
require_relative 'classes/rental'
require_relative 'classes/decorator'
require_relative 'classes/trimmerdecorator'
require_relative 'classes/capitalizedecorator'
require_relative 'modules/store'

class App
  include Store
  attr_accessor :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def wait_for_keypress
    puts 'Press any key to continue...'
    gets
  end

  def clear_screen
    system('cls')
    system('clear')
  end

  def list_all_books
    clear_screen
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
    wait_for_keypress
  end

  def list_all_people
    clear_screen
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
    wait_for_keypress
  end

  def create_person
    clear_screen
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
      wait_for_keypress
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
    wait_for_keypress
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
    wait_for_keypress
  end

  def create_book
    puts 'Enter the book title:'
    title = gets.chomp

    puts 'Enter the book author:'
    author = gets.chomp

    book = Book.new(title, author)
    @books << book

    puts 'Book created successfully:'
    wait_for_keypress
  end

  def create_rental
    clear_screen
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

    puts 'Rental created successfully'
    wait_for_keypress
  end

  def rental_list
    clear_screen
    @people.each do |person|
      puts "Id: #{person.id} Name: #{person.name}"
    end
    puts 'Enter the person ID:'
    person_id = gets.chomp.to_i

    rentals = @rentals.select { |rental| rental.person.id == person_id }

    if rentals.empty?
      puts "No rentals found for person with ID #{person_id}."
    else
      puts "=== Rentals for Person ID #{person_id} ==="
      rentals.each do |rental|
        puts "Person: #{rental.person.name}"
        puts "Book: #{rental.book.title} by #{rental.book.author}"
        puts "Rental Date: #{rental.date}"
        puts '---'
      end
    end
    wait_for_keypress
  end
end
