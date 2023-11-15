require 'json'

module BooksDataManipulation
  def save_books_to_json(file_path, new_person)
    parsed_data = []

    # * Read existing JSON data from the file if it exists.
    if File.exist?(file_path)
      current_data = File.read(file_path)
      parsed_data = JSON.parse(current_data) unless current_data.empty?
    end

    book_data = {
      title: new_book.title,
      author: new_book.author
    }

    # * Append new book data to the parsed data
    parsed_data << book_data

    # * Write the updated data back to the JSON file.
    File.write(file_path, JSON.pretty_generate(parsed_data))
  end

  def load_books_from_json(file_path)
    # * Read existing JSON data from the file if it exists.
    if File.exist?(file_path)
      current_data = File.read(file_path)
      parsed_data = JSON.parse(current_data) unless current_data.empty?
      return [] if parsed_data.nil? # ! important in case json file is new and empty.
    end

    # * Prepare book data and append it to the parsed data
    parsed_data.map do |book_data|
      book = Book.new(book_data['title'], book_data['author'])
      book
    end
  end
end
