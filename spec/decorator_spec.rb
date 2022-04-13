require_relative 'spec_helper'

describe Person do
  context 'Test for decorator' do
    person = Person.new(22, 'maximilianus')
    capitalizedPerson = CapitalizeDecorator.new(person)
    capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)

    it 'Test capitalized person name' do
      expect(capitalizedPerson.correct_name).to eq 'Maximilianus'
    end

    it 'Test capitalized person name' do
      expect(capitalizedTrimmedPerson.correct_name).to eq 'Maximilian'
    end
  end
end
