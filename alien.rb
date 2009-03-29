class Alien < Engine::Sprite
  MaxSpeedX = 4
  MaxSpeedY = 8
  MinSpeedY = 3
  AnimTime = 500
  
  def initialize
    super
    
    @image = Engine::Game.images["alien"]
    @x = rand(Engine::Game::ScreenWidth)
    @y = -@image[0].height / 2
    
    @speedx = rand(MaxSpeedX * 2) - MaxSpeedX
    @speedy = rand(MaxSpeedY - MinSpeedY) + MinSpeedY
  end
  
  def update
    # move
    @x += @speedx
    @y += @speedy
    
    # destroy when the alien reaches the bottom of the screen
    kill if @y > Engine::Game::ScreenHeight + @image[0].height / 2
    
    # animation
    @index = Gosu::milliseconds / AnimTime % @image.size
  end
  
end