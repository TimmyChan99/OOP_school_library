require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

class App 

	def initialize
		@books = []
		@pepole = []
		@rentals = []
	end
  
 def list_all_books
	if @book.length > 0
		
		puts "List of all books"
		@books.each { |book| puts "Title: #{book.title}, Author: #{book.author}"}
	else
		puts "The book list is empty"
	end
 end
end
