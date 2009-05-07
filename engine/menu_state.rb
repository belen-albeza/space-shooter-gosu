module Engine
  # This game state is the main menu screen
  class MenuState < GameState
    
    TextX = Game::ScreenWidth / 2
    TextY = (2 * Game::ScreenHeight) / 3
    TextGap = 50
    
    # Constructor
    def initialize
      @img_background = Game::images["background"]
      @img_logo = Game::images["logo"]
      @font = Game::fonts["menu"]
      
      @options = ["New Game", "Credits", "Quit"]
      @selected = 0
    end
    
    # Updates the main menu screen elements
    def update
    end
    
    # Draws the main menu screen elements
    def draw
      @img_background.draw(0, 0, 0)
      @img_logo.draw_rot(Game::ScreenWidth / 2, 120, ZOrder::Hud, 0)
      
      @options.size.times do |i|
        color = option_selected?(i) ? 0xfff4cc00 : 0xffffffff
        @font.draw_rel(@options[i], TextX, TextY + i * TextGap, ZOrder::Hud, 0.5, 0.5, 1, 1, color)
      end
    end
    
    # Gets called automatically when the user presses down a button
    def button_down(id)
      case id
      when Gosu::KbEscape then Game.quit
      end
    end
    
    # Gets called automatically when the user releases a button
    def button_up(id)
      case id
      when Gosu::KbDown then next_option!
      when Gosu::KbUp then prev_option!
      when Gosu::KbReturn, Gosu::KbSpace then select_option
      end
    end
    
    # Checks whether the given menu option is tagged as selected or not
    def option_selected?(i)
      @selected == i
    end
    
    # Tags the next menu option as selected
    def next_option!
      @selected = (@selected + 1) % @options.size
    end
    
    # Tags the previous menu option as selected
    def prev_option!
      @selected = (@selected - 1) % @options.size
    end
    
    # Executes the current highlighted option
    def select_option
      case @options[@selected]
      when "New Game" then Game.game_state = PlayState
      when "Credits" then Game.game_state = CreditsState
      when "Quit" then Game.quit
      end
    end 
  end
  
end