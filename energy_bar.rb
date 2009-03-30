class EnergyBar < Engine::Sprite
  BarWidth = 14
  
  # Constructor
  def initialize
    super 
    
    @image = Engine::Game.images["energy low"]
    @image_full = Engine::Game.images["energy full"]
    
    @x = 50
    @y = Engine::Game::ScreenHeight - @image.height / 2 - 12
    @z = ZOrder::HudFG
    
    @energy = 0
  end
  
  def draw
    super
    
    @energy = Engine::Game.sprites[Ship].first.energy if Engine::Game.sprites[Ship] and not Engine::Game.sprites[Ship].empty?
    Engine::Game.instance.clip_to(@x - @image.width / 2, @y - @image.height / 2, @energy * BarWidth, @image.height) do
      @image, @image_full = @image_full, @image
      super
    end
    
    @image, @image_full = @image_full, @image   
  end
end