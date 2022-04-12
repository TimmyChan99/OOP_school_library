require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'
require_relative 'load'

class App
  include LoadData
  def initialize
    @books = load_books
    @people = load_people
    @rentals = []
  end

  def input
    gets.chomp
  end

  def list_all_books
    if @books.empty?

      puts 'The book list is empty'
    else
      puts 'List of all books'
      @books.each_with_index { |book, index| puts "Title: #{book.title}, Author: #{book.author}, ID: #{index}" }
    end
  end

  def list_all_people
    if @people.empty?
      puts 'The list is empty'
    else

      puts 'List of all people'
      @people.each do |person|
        puts "[#{person.class.name}] Name: #{person.name}, Age: #{person.age}, Id: #{person.id}"
      end
    end
  end

  def list_rentals_for_id
    print 'ID of person: '
    id = gets.chomp.to_i

    @rentals.each do |rental|
      if rental.person.id == id
        puts 'Rentals:'
        puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
      else
        puts 'This person has no rentals'
      end
    end
  end

  def create_student
    print 'Age: '
    age = input.to_i

    print 'Name: '
    name = input

    print 'Has parent permission? [Y/N]: '
    permission = input.downcase

    print 'Classroom: '
    classroom = input

    if %w[y n].include?(permission)
      case permission
      when 'y'
        parent_permission = true
      when 'n'
        parent_permission = false
      end
      @people << Student.new(age, name, classroom, parent_permission)
    else
      puts 'Please pick a value "Y" or "N"'
      create_student
    end
  end

  def create_teacher
    print 'Age: '
    age = input.to_i
    print 'Name: '
    name = input
    print 'Specialization: '
    specialization = input

    @people << Teacher.new(age, specialization, name)
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    role = input.downcase

    case role
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Unvalid option'
    end
  end

  def create_book
    print 'Title: '
    title = input
    print 'Author: '
    author = input

    @books << Book.new(title, author)
  end

  def create_rental
    puts 'Select a book from the following list by number (not id)'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_id = input.to_i

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    id = input.to_i

    print 'Date: '
    date = input.to_s

    @rentals << Rental.new(@books[book_id], date, @people[id])
  end
end
