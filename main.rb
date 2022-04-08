require_relative 'app'

def start_app
  puts 'Welcome to the school library'
  menu
  loop do
    menu_option = gets.chomp
    break if menu_option == '7'
  end
end

def menu
  [
    'list all books',
    'list all people',
    'create a person',
    'create a book',
    'create a rental',
    'list all rentals for a give person id',
    'exit'
  ].each_with_index { |option, index| puts "#{index + 1}- #{option}" }
end


def main
  app = App.new
end
