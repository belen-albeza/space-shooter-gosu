module Engine
  
  class MenuState < GameState
    
    def initialize
      @img_background = Game::images["background"]
      @img_logo = Game::images["logo"]
    end
    
    def update
      
    end
    
    def draw
      @img_background.draw(0, 0, 0)
      @img_logo.draw_rot(Game::ScreenWidth / 2, Game::ScreenHeight / 3, ZOrder::Hud, 0)
    end
    
    def button_down(id)
      case id
      when Gosu::KbEscape then Game.instance.close
      end
    end
    
  end
  
end