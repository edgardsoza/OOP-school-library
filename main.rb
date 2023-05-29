require_relative './app'

class MainPage
  def initialize(app)
    @app = app
    @options = {
      '1' => 'List all books',
      '2' => 'List all people',
      '3' => 'Create a person',
      '4' => 'Create a book',
      '5' => 'Create a rental',
      '6' => 'List all rentals for a given person id',
      '7' => 'Exit'
    }
  end

  def display_options
    puts 'Welcome to School Library Home Page!'
    puts 'Please enter a number: '

    @options.each { |index, string| puts "#{index} - #{string}" }
  end

  def handle_option(option)
    case option
    when '1'
      @app.list_all_books
    when '2'
      @app.list_all_people
    when '3'
      @app.create_person
    when '4'
      @app.create_book
    when '5'
      @app.create_rental
    when '6'
      @app.rental_list
    when '7'
      puts 'I hope you enjoyed our app'
      exit
    else
      puts 'The selected option does not exist'
    end
  end

  def run
    loop do
      display_options
      option = gets.chomp
      handle_option(option)
    end
  end
end

def main
  app = App.new
  MainPage.new(app).run
end

main
