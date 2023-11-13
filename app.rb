require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'classroom'

require_relative 'modules/create_entities'

class App
  include CreateEntities

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

  def list_books
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_people
    @people.each { |person| puts "#{person.class}: Name: #{person.name}, Id: #{person.id}, Age: #{person.age}" }
  end

  def list_rentals_for_person
    print 'Enter person id: '
    person_id = gets.chomp.to_i

    rentals = @rentals.select { |rental| rental.person.id == person_id }

    if rentals.empty?
      puts 'No rentals found for the given person id.'
    else
      puts 'Rentals:'
      rentals.each do |rental|
        puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
      end
    end
  end

  def exit_app
    puts 'Exiting the application. Goodbye!'
    exit
  end
end
