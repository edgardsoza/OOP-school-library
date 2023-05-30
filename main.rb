require_relative './app'

def menu
  puts 'Welcome to School Library Home Page!'
  puts 'Please enter a number: '
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
  option = gets.chomp.to_i
  (option < 1) || (option > 7) ? invalid_option : option
end

def handle_option(option)
  app = App.new
  case option
  when 1
    app.list_all_books
  when 2
    app.list_all_people
  when 3
    app.create_person
  when 4
    app.create_book
  when 5
    app.create_rental
  when 6
    app.rental_list
  end
end

def invalid_option
  puts 'Invalid option. Please try again.'
  menu
end

def main
  option = 1
  while (option < 7) && option.positive?
    option = menu
    handle_option(option)
  end
  puts 'I hope you enjoyed our app'
end

main
