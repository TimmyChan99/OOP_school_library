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
    print 'Please enter the person id:'
    id = gets.chomp.to_i

    @rentals.each do |rental|
      if rental.person.id == id
        puts 'List of rentals'
        puts "Rented Book: Title: #{rental.book.title}, Author: #{rental.book.author},
				Date of rent: #{rental.book.date}"
      else
        puts 'This person has no rentals'
      end
    end
  end

  def create_student
    puts 'Please enter the student name'
    name = gets.chomp
    puts 'Please enter the student age'
    age = gets.chomp.to_i
    puts 'Please enter the student classroom'
    classroom = gets.chomp
    puts 'Does the studend have the parent permission'
    puts 'Type (yes) if they have it'
    puts "Type (no) if they don't have it"
    permission = gets.chomp.downcase

    case permission
    when 'yes'
      parent_permission = true
      @people << Student.new(age, name, classroom, parent_permission)
    when  'no'
      parent_permission = false
      @people << Student.new(age, name, classroom, parent_permission)
    else
      puts 'Unvalid option here'
    end

    
  end

  def create_teacher
    puts 'Please enter the teacher name'
    name = gets.chomp
    puts 'Please enter the teacher age'
    age = gets.chomp.to_i
    puts 'Please enter the teacher specialization'
    specialization = gets.chomp

    @people << Teacher.new(age, specialization, name: name)
  end

  def create_person
    puts 'If the person is a student type (s) else if the person is a teacher type (t)'
    role = gets.chomp.downcase
    
   if role == 's'
    create_student
   elsif role == 't'
    create_teacher
   else
    puts 'Unvalid option'
   end
  
  end

  def create_book
    puts 'Please enter the book title'
    title = gets.chomp
    puts 'Please enter the book author'
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
    date = gets.chomp

    @rentals << Rental.new(@books[book_id], date, @people[id])
  end
end
