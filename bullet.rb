# These are bullets shot by the player's ship
class Bullet < Engine::Sprite
  Speed = 8
  BoomOffset = 10
  
  # Constructor
  def initialize(x, y)
    super()
    
    @image = Engine::Game.images["laser"]
    @x = x
    @y = y
    @z = ZOrder::Bullet
    @radius = 8    
  end
  
  # Updates the bullet
  def update
    @y -= Speed # move up
        
    collide = false    
    # collisions against aliens
    Engine::Game.sprites[Alien].each do |alien|
      if collision?(alien)
        collide = true
        alien.destroy! # kills the alien
        Engine::Game.game_state.increase_score!(50) # award the player with some points
      end
    end
    
    # destroy the bullet when it reaches the top of the screen or collides with an enemy
    kill! if @y <= -@image.height / 2 or collide
  end
end