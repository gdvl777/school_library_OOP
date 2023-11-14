require 'json'



module RentalsDataManipulation
  def save_rentals_to_json(file_path, new_rental)
    parsed_data = []



    # * Read existing JSON data from the file if it exists.

    if File.exist?(file_path)

      current_data = File.read(file_path)

      parsed_data = JSON.parse(current_data) unless current_data.empty?

    end



    rental_data = {

      date: new_rental.date,

      person: {

        id: new_rental.person.id,

        name: new_rental.person.name,

        age: new_rental.person.age

      },

      book: {

        title: new_rental.book.title,

        author: new_rental.book.author

      }

    }



    # * Append new rental data to the parsed data

    parsed_data << rental_data



    # * Write the updated data back to the JSON file.

    File.write(file_path, JSON.pretty_generate(parsed_data))
  end

  def load_rentals_from_json(file_path)
    # * Read existing JSON data from the file if it exists.

    if File.exist?(file_path)

      current_data = File.read(file_path)

      parsed_data = JSON.parse(current_data) unless current_data.empty?

      return [] if parsed_data.nil? # ! important in case json file is new and empty.

    end



    # * Prepare rental data and append it to the parsed data

    parsed_data.map do |rental_data|
      person = Person.new(rental_data['person']['name'], rental_data['person']['age'], rental_data['person']['id'])

      book = Book.new(rental_data['book']['title'], rental_data['book']['author'])

      rental = Rental.new(rental_data['date'], book, person)

      rental
    end
  end
end
