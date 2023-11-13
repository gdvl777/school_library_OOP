module UserInterface
  MENU_OPTIONS = {
    1 => :list_books,
    2 => :list_people,
    3 => :create_person,
    4 => :create_book,
    5 => :create_rental,
    6 => :list_rentals_for_person,
    7 => :exit_app
  }.freeze

  def display_menu
    puts "\nPlease choose an option:"
    MENU_OPTIONS.each { |key, value| puts "#{key} - #{value.to_s.tr('_', ' ')}" }
    print 'Option: '
    gets.chomp.to_i
  end

  def handle_option(app, option)
    action = MENU_OPTIONS[option]
    if action
      app.send(action)
    else
      puts 'Invalid option. Please try again.'
    end
  end
end
