# KA-BOOM! Explosion objects represent one "fireball". In order to make a cool
# big explosion, several units of these ones should be created at once.
class Explosion < Engine::Sprite
  
  AlphaStep = 1.0 / 30
  SizeStep = 1.0 / 30
  
  # Constructor
  def initialize(x, y)
    super()
    @image = Engine::Game.images["boom"]
    
    @x = x
    @y = y
    @z = ZOrder::Explosion
    @blending = :additive
    @alpha = 1
    @size = rand(2) + 1
  end
  
  # Updates the explosion
  def update
    @size += SizeStep # grow bigger
    @alpha -= AlphaStep # become more transparent
    
    # destroy when it becomes 100% transparent
    kill! if @alpha <= 0
  end
  
end