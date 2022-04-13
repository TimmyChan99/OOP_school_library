require_relative 'spec_helper'

describe Classroom do
  before :each do
    @classroom = Classroom.new 'label'
  end

  it 'classroom is an instance of Classroom class' do
    expect(@classroom).to be_an_instance_of Classroom
  end

  it 'Should return classroom label' do
    expect(@classroom.label).to eq 'label'
  end
end
