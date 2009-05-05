# These ones are the cute bad guys
class Alien < Engine::Sprite
  MaxSpeedX = 4
  MaxSpeedY = 8
  MinSpeedY = 3
  AnimTime = 500
  BoomOffset = 10
  
  # Constructor
  def initialize
    super
    
    @image = Engine::Game.images["alien"]
    @x = rand(Engine::Game::ScreenWidth)
    @y = -@image[0].height / 2
    @z = ZOrder::Alien
    @radius = 20
    
    # assign random speeds to the alien
    @speedx = rand(MaxSpeedX * 2) - MaxSpeedX
    @speedy = rand(MaxSpeedY - MinSpeedY) + MinSpeedY
  end
  
  # Updates the alien
  def update
    # move
    @x += @speedx
    @y += @speedy
    
    # destroy when the alien reaches the bottom of the screen
    kill! if @y > Engine::Game::ScreenHeight + @image[0].height / 2
    
    # animation
    @index = Gosu::milliseconds / AnimTime % @image.size
  end
  
  # Kills the alien with an explosion
  def destroy!
    (rand(3) + 5).times { Explosion.new(@x + rand(BoomOffset * 2) - BoomOffset, @y + rand(BoomOffset * 2) - BoomOffset) } 
    kill!
  end
  
end