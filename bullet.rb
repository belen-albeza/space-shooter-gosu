class Bullet < Engine::Sprite
  Speed = 8
  
  def initialize(x, y)
    super
    
    @image = Game.images["laser"]
    @x = x
    @y = y    
  end
  
  def update
    @y -= Speed
    
    kill if @y <= -@image.height
  end
  
end