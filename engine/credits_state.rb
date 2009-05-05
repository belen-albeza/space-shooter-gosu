module Engine
  # This game state is the Credits screen
  class CreditsState < GameState
    # Constructor
    def initialize
      @img_background = Game.images["background"]
      @img_credits = Game.images["credits"]
      @img_gosu = Game.images["gosu"]
      
      @font_small = Game.fonts["small"]
      @font_credits = Game.fonts["menu"]
    end
    
    # Updates the credits screen
    def update      
    end
    
    # Draws the credits screen
    def draw
      @img_background.draw(0, 0, 0)
      @img_credits.draw_rot(Game::ScreenWidth / 2, 120, ZOrder::Hud, 0)
      
      @font_small.draw_rel("Made by", Game::ScreenWidth / 2, 200, ZOrder::Hud, 0.5, 0.5)
      @font_credits.draw_rel("Belén Albeza", Game::ScreenWidth / 2, 250, ZOrder::Hud, 0.5, 0.5)
      @font_small.draw_rel("www.belenalbeza.com", Game::ScreenWidth / 2, 280, ZOrder::Hud, 0.5, 0.5, 1, 1, 0xfff4cc00)
      
      @font_small.draw_rel("Sample game for Gosu", Game::ScreenWidth / 2, 500, ZOrder::Hud, 0.5, 0.5)
      @font_small.draw_rel("www.libgosu.org", Game::ScreenWidth / 2, 530, ZOrder::Hud, 0.5, 0.5, 1, 1, 0xfff4cc00)
    end
    
    # Gets called when the player releases a button
    def button_up(id)
      # go back to the main menu
      Game.game_state = MenuState if id == Gosu::KbEscape or id == Gosu::KbReturn
    end
  end
end