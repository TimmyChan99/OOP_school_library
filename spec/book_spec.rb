require_relative 'spec_helper'

describe Book do
  before :each do
    @book = Book.new 'Title', 'Author'
    @person = Person.new 10, 'Student1'
    @person2 = Person.new 15, 'Student2'
  end

  it 'It should return book title' do
    expect(@book.title).to eq 'Title'
  end
  it 'It should return book author' do
    expect(@book.author).to eq 'Author'
  end

  it 'Test add_rental: Should return return rental length' do
    @book.add_rental(@person, '2022-05-02')
    @book.add_rental(@person2, '2021-05-16')
    expect(@book.rentals).to have_attributes(size: 2)
  end
end
