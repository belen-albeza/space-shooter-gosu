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
  
  def update
    @size += SizeStep
    @alpha -= AlphaStep
    
    kill if @alpha <= 0
  end
  
end