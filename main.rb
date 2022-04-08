require_relative 'app'

def start_app
  puts 'Welcome to the school library'
  menu
  loop do
    menu_option = gets.chomp
    break if menu_option == '7'

    options_list(menu_option)
  end
end

def menu
  [
    'List all books',
    'List all people',
    'Create a person',
    'Create a book',
    'Create a rental',
    'List all rentals for a give person id',
    'Exit'
  ].each_with_index { |option, index| puts "#{index + 1}- #{option}" }
end

def options_list(menu_option)
  case menu_option
  when '1'
    list_all_books
  when '2'
    list_all_people
  when '3'
    create_person
  when '4'
    create_book
  when '5'
    create_rental
  when '6'
    list_rentals_for_id
  else
    puts 'Unvalid option'
  end
end

def main
  app = App.new
  app.run
  start_app
end
