require_relative 'spec_helper'

describe Person do
  before :each do
    @person = Person.new 10, 'Student1', parent_permission: true
    @person2 = Person.new 15, 'Student2', parent_permission: false
    @book = Book.new 'Title', 'Author'
  end

  it 'Should return person age' do
    expect(@person.age).to eq 10
  end

  it 'Should return person name' do
    expect(@person.name).to eq 'Student1'
  end

  it 'Test parent_permission: Should return true' do
    expect(@person.parent_permission).to be true
  end

  it 'Test can_use_services?: Should return true' do
    expect(@person.can_use_services?).to be true
  end

  it 'Test can_use_services?: Should return false' do
    expect(@person2.can_use_services?).to be false
  end

  it 'Test correct_name: Should return student name' do
    expect(@person.correct_name).to eq 'Student1'
  end

  it 'Test add_rental: Should return rental length' do
    @person.add_rental(@book, '2022-02-02')
    expect(@person.rentals).to have_attributes(size: 1)
  end
end
