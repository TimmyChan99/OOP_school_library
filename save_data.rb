require_relative 'app'

module SaveData
  def options
    {
      array_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '
    }
  end

  def save_books
    data = []
    @books.each do |book|
      data.push({ title: book.title, author: book.author })
    end
    File.write('./data/books.json', JSON.generate(data, options))
  end

  def save_person
    data = []
    @people.each do |person|
      data << if person.instance_of?(Student)
                { Json_class: person.class,
                  age: person.age,
                  id: person.id,
                  name: person.name,
                  classroom: person.classroom,
                  parent_permission: person.parent_permission }
              else
                {
                  Json_class: person.class,
                  age: person.age,
                  id: person.id,
                  name: person.name,
                  specialization: person.specialization
                }
              end
      File.write('./data/people.json', JSON.generate(data, options))
    end
  end

  def save_rentals
    data = []
    @rentals.each do |rental|
      data.push({
				          Json_class: "Rental",
                  date: rental.date,
                  person: rental.person.id,
                  book: rental.book.title
                })
    end
		File.write('./data/rentals.json', JSON.generate(data, options))
  end
end
