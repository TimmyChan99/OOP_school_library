require_relative 'spec_helper'

describe Student do
  before :each do
    @student = Student.new 20, 'Student name', 'student classroom'
  end

  it 'Should return student age' do
    expect(@student.age).to be 20
  end

  it 'Should return student name' do
    expect(@student.name).to eq 'Student name'
  end

  it 'Should return student classroom' do
    expect(@student.classroom).to eq 'student classroom'
  end
end
