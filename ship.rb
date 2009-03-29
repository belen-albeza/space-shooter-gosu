class Ship < Sprite
  
  def initialize
    super
    
    @x = Game::ScreenWidth / 2
    @y = Game::ScreenHeight - 50
    @image = Game.images["captain"]
  end
  
  def update
    
  end
  
end