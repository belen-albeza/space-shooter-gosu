class Game < Gosu::Window
  
  # Constructor. Setups the video mode and creates a window
  def initialize
    super(550, 600, false)
    self.caption = "Space Shooter"
  end
  
  def button_up(id)
    self.close if id == Gosu::KbEscape
  end
  
end