class Person
  
	attr_reader :id
	attr_accessor :name, :age

	def initialize(age, parent_permission = true, name = "Unknown")
	 @id
	 @name = name
	 @age = age 
	 @parent_permission = parent_permission
	end

	private

	def is_of_age?
	if @age >= 18 
		return true
	else
		return false
	end
	end

	public

	def can_use_services?

	if is_of_age? || @parent_permission 
		return true
		else 
			return false
	end
	end

end

# person = Person.new(13, true)
# puts person.can_use_services?
#puts person.name
