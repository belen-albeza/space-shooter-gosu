module Engine
  class PlayState < GameState
    
    # Constructor
    def initialize
      @captain = Ship.new
      @img_background = Game.images["background"]
    end
    
    def draw
      @img_background.draw(0, 0, 0)
      @captain.draw
    end
    
    def update
      
    end
  end
end