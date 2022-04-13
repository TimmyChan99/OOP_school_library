require_relative 'spec_helper'

describe Teacher do
  before :each do
    @teacher = Teacher.new 45, 'Math', 'teacher'
  end

  # it '@teacher is an instance of Teacher' do
  #    expect(@teacher).to be_an_instance_of Teacher
  # 	end
  it 'Should return age' do
    expect(@teacher.age).to eq 45
  end
end
