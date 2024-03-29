require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'classroom'

require_relative 'modules/create_entities'
require_relative 'modules/list_entities'
require_relative 'modules/rentals_data_manipulation'
require_relative 'modules/people_data_manipulation'
require_relative 'modules/books_data_manipulation'

RENTALS_PATH = './db/rentals.json'.freeze
PEOPLE_PATH = './db/people.json'.freeze
BOOKS_PATH = './db/books.json'.freeze

class App
  include CreateEntities
  include ListEntities
  include RentalsDataManipulation
  include PeopleDataManipulation
  include BooksDataManipulation

  attr_accessor :books, :people, :rentals

  def initialize
    @books = load_books_from_json(BOOKS_PATH)
    @people = load_people_from_json(PEOPLE_PATH)
    @rentals = load_rentals_from_json(RENTALS_PATH)
  end

  def create_person
    # * First it will promp the user to choose between student or teacher
    person = super # ! super = create_person from CreateEntities module.
    # * Then it will return the person instance.

    @people << person

    save_people_to_json(PEOPLE_PATH, person)
  end

  def create_book
    # * First it will promp the user for the creation of a book.
    book = super # ! super = create_book from CreateEntities module.
    # * Then it will return the book instance.

    @books << book

    save_books_to_json(BOOKS_PATH, book)
  end

  def create_rental
    # * First it will promp the user for the creation of a rental, by
    # * iterating over the books and people arrays, and asking the user
    # * to choose one of each.
    rental = super(@books, @people) # ! super = create_rental from CreateEntities module.
    # * Then it will return the rental instance.

    @rentals << rental # * adds the rental to the rentals array which already has the rentals loaded from the json file.

    save_rentals_to_json(RENTALS_PATH, rental)
  end

  def exit_app
    puts 'Exiting the application. Goodbye!'

    exit
  end
end
