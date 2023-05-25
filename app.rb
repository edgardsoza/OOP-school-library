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
    puts "Enter student name:"
    name = gets.chomp
  
    puts "Enter student age:"
    age = gets.chomp.to_i
  
    puts "Does the student have parent permission? (Y/N)"
    parent_permission = gets.chomp.downcase
  
    case parent_permission
    when 'y'
      student = Student.new(name, age, parent_permission: true)
      @people << student
      puts "Student with parent permission created successfully."
    when 'n'
      student = Student.new(name, age, parent_permission: false)
      @people << student
      puts "Student without parent permission created successfully."
    else
      puts "Invalid option. Student not created."
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
    @people << teacher
    puts 'Teacher created successfully.'
  end

  def create_book
    puts "Enter the book title:"
    title = gets.chomp
  
    puts "Enter the book author:"
    author = gets.chomp
  
    book = Book.new(title, author)
    @books << book
  
    puts "Book created successfully:"
  end
end
