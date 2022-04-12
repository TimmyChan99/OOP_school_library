require './student'
require './teacher'
require './book'
require './rental'
require 'json'

module LoadData
  def load_books
    file = 'data/books.json'
    data = []
    if File.exist?(file)
      JSON.parse(File.read(file)).each do |item|
        data.push(Book.new(item['title'], item['author']))
      end
    end
    data
  end

  def load_people
    file = 'data/people.json'
    data = []
    if File.exist?(file)
      JSON.parse(File.read(file)).each do |item|
        if item['Json_class'] == 'Student'
          data.push(Student.new(item['age'], item['name'], item['classroom'], item['parent_permission']))
        else
          data.push(Teacher.new(item['age'], item['specialization'], item['name']))
        end
      end
    end
    data
  end

  def person_with_id(name)
    @people.each { |element| return element if element.name == name }
  end

  def book_with_title(title)
    @books.each { |element| return element if element.title == title }
  end

  def load_rentals
    file = 'data/rentals.json'
    data = []
    if File.exist?(file)
      JSON.parse(File.read(file)).each do |item|
        person = person_with_id(item['person_name'])
        book = book_with_title(item['title'])
        data.push(Rental.new(book, item['data'], person))
      end
    end
    data
  end
end
