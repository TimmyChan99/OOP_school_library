class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, parent_permission: true, name: 'Unknown')
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    if of_age? || @parent_permission
      true
    else
      false
    end
  end
end

person = Person.new(13)
puts person.can_use_services?
