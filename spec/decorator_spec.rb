require_relative 'spec_helper'

describe Person do
  context 'Test for decorator' do
    person = Person.new(22, 'maximilianus')
    capitalized_person = CapitalizeDecorator.new(person)
    capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)

    it 'Test capitalized person name' do
      expect(capitalized_person.correct_name).to eq 'Maximilianus'
    end

    it 'Test capitalized person name' do
      expect(capitalized_trimmed_person.correct_name).to eq 'Maximilian'
    end
  end
end
