class Hud < Engine::Sprite
  
  def initialize
    super
    
    @image = Engine::Game.images["hud"]
    
    @x = Engine::Game::ScreenWidth / 2
    @y = Engine::Game::ScreenHeight - @image.height / 2 - 5
    @z = ZOrder::Hud
  end
  
  def update
  end
end