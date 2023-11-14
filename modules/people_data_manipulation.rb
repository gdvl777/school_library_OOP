require 'json'

module PeopleDataManipulation
  def save_people_to_json(file_path, new_person)
    parsed_data = []

    # * Read existing JSON data from the file if it exists.
    if File.exist?(file_path)
      current_data = File.read(file_path)
      parsed_data = JSON.parse(current_data) unless current_data.empty?
    end

    person_data = {
      id: new_person.id,
      name: new_person.name,
      age: new_person.age
    }

    # * Append new person data to the parsed data
    parsed_data << person_data

    # * Write the updated data back to the JSON file.
    File.write(file_path, JSON.pretty_generate(parsed_data))
  end

  def load_people_from_json(file_path)
    # * Read existing JSON data from the file if it exists.
    if File.exist?(file_path)
      current_data = File.read(file_path)
      parsed_data = JSON.parse(current_data) unless current_data.empty?
      return [] if parsed_data.nil? # ! important in case json file is new and empty.
    end

    # * Prepare person data and append it to the parsed data
    parsed_data.map do |person_data|
      person = Person.new(person_data['name'], person_data['age'], person_data['id'])
      person
    end
  end
end
