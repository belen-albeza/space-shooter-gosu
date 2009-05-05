# This is the player's ship. It can shoot bullets and should avoid
# enemy aliens to survive.
class Ship < Engine::Sprite
  Speed = 6
  BoomOffset = 10
  
  attr_reader :energy
  
  # Constructor
  def initialize
    super
    
    @x = Engine::Game::ScreenWidth / 2
    @y = Engine::Game::ScreenHeight - 100
    @z = ZOrder::Ship
    @image = Engine::Game.images["captain"]
    
    @radius = 30
  end
  
  # Updates the ship
  def update
    # collision against aliens
    Engine::Game.sprites[Alien].each do |alien|
      if collision?(alien)
        alien.destroy!
        Engine::Game.game_state.decrease_energy
      end
    end
  end
  
  # Moves the ship horizontally
  def move(incx)
    @x += incx
    # make sure it stays inside the screen
    @x = [@x, @image.width / 2].max
    @x = [@x, Engine::Game::ScreenWidth - @image.width / 2].min
  end
  
  # Shoots a bullet
  def shoot
    Bullet.new(@x, @y - @image.height / 2)
  end
  
  # Kills the ship with an explosion
  def destroy!
    (rand(3) + 5).times { Explosion.new(@x + rand(BoomOffset * 2) - BoomOffset, @y + rand(BoomOffset * 2) - BoomOffset) }
    kill!
  end
end