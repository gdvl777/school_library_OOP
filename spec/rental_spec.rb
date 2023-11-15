require_relative '../rental'
require_relative '../book'
require_relative '../teacher'

describe Rental do
  context 'Testing instatiation' do
    before(:each) do
      @date = '2021-01-01'

      @book = Book.new('Harry Potter', 'J.K. Rowling')

      # * Teacher inherits from Person, the same applies to Student.
      # * so person in the Rental class can be either a Student or a Teacher.
      # * Person itself is never instantiated in the program.
      @person = Teacher.new('Severus Snape', 50, 'Potions')

      @rental = Rental.new(@date, @book, @person)
    end

    it 'Should have attribue :date' do
      expected_date = @date

      expect(@rental).to have_attributes(date: expected_date)
    end

    it 'Should have attribute :book' do
      expected_book = @book

      expect(@rental).to have_attributes(book: expected_book)
    end

    it 'Should have attribute :person' do
      expected_person = @person

      expect(@rental).to have_attributes(person: expected_person)
    end

    it 'Should have attribute :date set to "2021-01-01"' do
      expected_date = @date

      expect(@rental.date).to eq(expected_date)
    end

    it 'Should have attribute :book set to object @book' do
      expected_book_object = @book

      expect(@rental.book).to eq(expected_book_object)
    end

    it 'Should have attribute :person set to object @person' do
      expected_person_object = @person

      expect(@rental.person).to eq(expected_person_object)
    end
  end
  context '#to_h' do
    before(:each) do
      @date = '2021-01-01'

      @book = Book.new('Harry Potter', 'J.K. Rowling')

      # * Teacher inherits from Person, the same applies to Student.
      # * so person in the Rental class can be either a Student or a Teacher.
      # * Person itself is never instantiated in the program.
      @person = Teacher.new('Severus Snape', 50, 'Potions')

      @rental = Rental.new(@date, @book, @person)
    end
    it 'returns a hash representation of the rental' do
      expected_hash = {
        date: @date,
        book_title: @book.title,
        person_id: @person.id
      }
      expect(@rental.to_h).to eq(expected_hash)
    end
  end
end
