require_relative 'app'

def main
  app = App.new

  loop do
    option = display_menu
    handle_option(app, option)
  end
end

main
