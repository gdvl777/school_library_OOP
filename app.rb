require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'classroom'

require_relative 'modules/create_entities'
require_relative 'modules/list_entities'

class App
  include CreateEntities
  include ListEntities
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def create_person
    # * First it will promp the user to choose between student or teacher
    person = super # ! super = create_person from CreateEntities module.
    # * Then it will return the person instance.
    @people << person
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
    @rentals << rental
  end

  def exit_app
    puts 'Exiting the application. Goodbye!'
    exit
  end
end
