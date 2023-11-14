# this class represents the rental
class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def book=(book)
    @book = book # * sets the book to the rental.
    book.add_rental(self) # * adds the rental to the book.
  end

  def person=(person)
    @person = person # * sets the person to the rental.
    person.add_rental(self) # * adds the rental to the person.
  end

  def to_h
    {
      date: @date,
      book_title: @book.title, # Usando el título del libro como un identificador único
      person_id: @person.id # Suponiendo que las personas tienen un ID único
    }
  end
end
