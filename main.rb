require_relative './app'

class MainPage
  def initialize(app)
    @app = app
    @options = {
      '1' => [:list_all_books, 'List all books'],
      '2' => [:list_all_people, 'List all people'],
      '3' => [:create_person, 'Create a person'],
      '4' => [:create_book, 'Create a book'],
      '5' => [:create_rental, 'Create a rental'],
      '6' => [:rental_list, 'List all rentals for a given person id'],
      '7' => [:exit_app, 'Exit']
    }
  end

  def display_options
    puts 'Welcome to School Library Home Page!'
    puts 'Please enter a number: '

    @options.each { |index, (_method_name, string)| puts "#{index} - #{string}" }
  end

  def handle_option(option)
    action = @options[option]
    if action
      send(action[0])
    else
      puts 'The selected option does not exist'
    end
  end

  def list_all_books
    @app.list_all_books
  end

  def list_all_people
    @app.list_all_people
  end

  def create_person
    @app.create_person
  end

  def create_book
    @app.create_book
  end

  def create_rental
    @app.create_rental
  end

  def rental_list
    @app.rental_list
  end

  def exit_app
    puts 'I hope you enjoyed our app'
    exit
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
