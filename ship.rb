class Ship < Engine::Sprite
  Speed = 6
  
  attr_reader :energy
  
  def initialize
    super
    
    @x = Engine::Game::ScreenWidth / 2
    @y = Engine::Game::ScreenHeight - 100
    @z = ZOrder::Ship
    @image = Engine::Game.images["captain"]
    
    @energy = 5
  end
  
  def update
    
  end
  
  def move(incx)
    @x += incx
    
    @x = [@x, @image.width / 2].max
    @x = [@x, Engine::Game::ScreenWidth - @image.width / 2].min
  end
  
  def shoot
    Bullet.new(@x, @y - @image.height / 2)
  end
  
end