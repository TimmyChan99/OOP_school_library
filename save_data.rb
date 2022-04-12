require_relative 'app'

module SaveData
	def save_books
		data = []
		@books.each do |book|
			data.push({ title: book.title, author: book.author })
		end
		File.write('./data/books.json', JSON.generate(data))
	end

end
