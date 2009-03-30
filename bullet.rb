class Bullet < Engine::Sprite
  Speed = 8
  
  def initialize(x, y)
    super()
    
    @image = Engine::Game.images["laser"]
    @x = x
    @y = y
    @z = ZOrder::Bullet
    @radius = 8    
  end
  
  def update
    @y -= Speed
        
    collide = false
    
    # collisions against aliens
    Engine::Game.sprites[Alien].each do |alien|
      if collision?(alien)
        collide = true
        alien.kill
      end
    end
    
    kill if @y <= -@image.height / 2 or collide
    
  end
  
end