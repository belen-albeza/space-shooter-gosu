# This class is the player's ship energy bar
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
  
  # Draws the energy bar on the screen. We're overriding the default
  # method here because we'll be drawing 2 images instead of one
  def draw
    # draw the "background" translucid energy bar
    super
    
    @energy = Engine::Game.game_state.energy
    # clip the opaque image to draw only the remaining energy
    Engine::Game.instance.clip_to(@x - @image.width / 2, @y - @image.height / 2, @energy * BarWidth, @image.height) do
      @image, @image_full = @image_full, @image # swap transparent and opaque images
      super # draw the "foreground" opaque var
    end
    
    @image, @image_full = @image_full, @image # back to normal
  end
end