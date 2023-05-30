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
  option
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
      when 7
        exit_app
      else
        invalid_option
      end
  end

  def invalid_option
    puts 'Invalid option. Please try again.'
    option = gets.chomp.to_i
    handle_option(option)
  end

  def display_options
    puts 'Welcome to School Library Home Page!'
    puts 'Please enter a number: '

    options.each { |index, string| puts "#{index} - #{string}" }
  end

  def exit_app
    puts 'I hope you enjoyed our app'
    exit
  end

  def main
    loop do
      option = menu
      handle_option(option)
    end
  end

main
