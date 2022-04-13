require_relative 'spec_helper'

describe Person do
	
	before :each do
		@person = Person.new 10, 'Student1'
	end

	it 'Should return person age' do
		expect(@person.age).to eq 10
	end

	it 'Should return person name' do
		expect(@person.name).to eq 'Student1'
	end

	# it "Should return person's parent_permission" do
	# 	expect(@person.parent_permission) .to be true
	# end
end
