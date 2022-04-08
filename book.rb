require_relative 'rental'

class Book
  attr_reader :rentals
  attr_accessor :title, :author, :date

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(self, date, person)
  end
end
