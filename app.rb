require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
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
      @people.each { |person| puts "[#{person.class.name}] Name: #{person.name}, Age: #{person.age}, Id: #{person.id}" }
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
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp.downcase

    print 'Classroom: '
    classroom = gets.chomp

    case permission
    when 'y'
      parent_permission = true
      @people << Student.new(age, name, classroom, parent_permission)
    when 'n'
      parent_permission = false
      @people << Student.new(age, name, classroom, parent_permission)
    else
      puts 'Unvalid option here'
    end
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp

    @people << Teacher.new(age, specialization, name)
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    role = gets.chomp.downcase

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
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)
  end

  def create_rental
    puts 'Select a book from the following list by number (not id)'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_id = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    id = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp.to_s

    @rentals << Rental.new(@books[book_id], date, @people[id])
  end
end
