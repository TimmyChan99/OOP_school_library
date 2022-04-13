require_relative 'spec_helper'

describe Book do
	before :each do
		@book = Book.new 'Title', 'Author'
	end

	it 'It should return book title' do
	  expect(@book.title) .to eq 'Title'
  end
	it 'It should return book author' do
		expect(@book.author) .to eq 'Author'
	end

end
