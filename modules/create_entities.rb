require_relative 'classroom'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

module CreateEntities
  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp

    case person_type
    when '1'
      student = create_student
      puts 'Student created successfully'
      student
    when '2'
      teacher = create_teacher
      puts 'Teacher created successfully'
      teacher
    else
      puts 'Invalid option'
    end
  end

  def create_student
    print 'Name: '
    name = gets.chomp

    print 'Age: '
    age = gets.chomp.to_i

    print 'Classroom: '
    classroom_name = gets.chomp
    classroom = Classroom.new(classroom_name)

    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'

    Student.new(name, age, classroom, parent_permission: parent_permission)
  end

  def create_teacher
    print 'Name: '
    name = gets.chomp

    print 'Age: '
    age = gets.chomp.to_i

    print 'Specialization: '
    specialization = gets.chomp

    Teacher.new(name, age, specialization)
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    puts 'Book created successfully'
    Book.new(title, author)
  end

  def create_rental(books, people)
    puts 'Select a book from the following list by number:'
    books.each_with_index { |book, index| puts "#{index}) #{book.title}" }

    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number:'
    people.each_with_index { |person, index| puts "#{index}) #{person.name}" }

    person_index = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    puts 'Rental created successfully'
    Rental.new(date, books[book_index], people[person_index])
  end
end
