require 'json'
require 'fileutils'
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

RENTALS_PATH = './db/rentals.json'.freeze
PEOPLE_PATH = './db/people.json'.freeze

class App
  include CreateEntities
  include ListEntities
  include RentalsDataManipulation
  include PeopleDataManipulation

  attr_accessor :books, :people, :rentals

  def initialize
    FileUtils.mkdir_p('./data')

    @books = []
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

  def save_to_files
    File.write('./data/books.json', JSON.dump(@books.map(&:to_h)))
    File.write('./data/people.json', JSON.dump(@people.map(&:to_h)))
  end

  def load_from_files
    @books = load_data('./data/books.json') { |book| Book.new(book['title'], book['author']) }

    @people = load_data('./data/people.json') do |person|
      new_person = Person.new(person['name'], person['age'])

      new_person.id = person['id']

      new_person
    end
  end

  def load_data(file_name, &block)
    return [] unless File.exist?(file_name)

    json_data = JSON.parse(File.read(file_name))

    json_data.map(&block)
  end
end
