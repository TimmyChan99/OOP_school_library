require_relative 'spec_helper'

describe Classroom do
  before :each do
    @classroom = Classroom.new 'label'
    @student = Student.new 12, 'Student1', @classroom
  end

  it 'classroom is an instance of Classroom class' do
    expect(@classroom).to be_an_instance_of Classroom
  end

  it 'Should return classroom label' do
    expect(@classroom.label).to eq 'label'
  end

  it 'Test add_student' do
    @classroom.add_student(@student)
    expect(@classroom.students).to have_attributes(size: 1)
    expect(@classroom.students[0].name).to eq 'Student1'
  end
end
