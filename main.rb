require_relative 'app'
require_relative 'modules/user_interface'

class Main
  include UserInterface
  def initialize
    @app = App.new
  end

  def main
    loop do
      option = display_menu
      handle_option(@app, option)
    end
  end
end

Main.new.main
