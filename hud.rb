class Hud < Engine::Sprite
  
  def initialize
    super
    
    @image = Engine::Game.images["energy full"]
    @img_low = Engine::Game.images["energy low"]
    @img_hud = Engine::Game.images["hud"]
    
    @x = 100
    @y = Engine::Game::ScreenHeight - @image.height / 2 - 10
  end
  
  def update
  end
  
  def draw
    @img_hud.draw_rot(Engine::Game::ScreenWidth / 2, @y, 0, 0)
    
    super
  end
end