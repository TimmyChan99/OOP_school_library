require_relative 'spec_helper'

describe Rental do
  before :each do
    @person = Person.new 10, 'Student1'
    @book = Book.new 'Title', 'Author'
    @rental = Rental.new @book, '2022-12-03', @person
  end

  it 'Should return the person object' do
    expect(@rental.person).to be @person
  end

  it 'Should return the book object' do
    expect(@rental.book).to be @book
  end

  it 'Should return the date' do
    expect(@rental.date).to eq '2022-12-03'
  end
end
