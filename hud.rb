# This is some HUD for aestetic purposes. It's just a 
# translucid white rectangle.
class Hud < Engine::Sprite
  # Constructor
  def initialize
    super
    
    @image = Engine::Game.images["hud"]
    
    @x = Engine::Game::ScreenWidth / 2
    @y = Engine::Game::ScreenHeight - @image.height / 2 - 5
    @z = ZOrder::Hud
  end
end