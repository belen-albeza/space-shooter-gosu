class Sprite
  
  attr_reader :x, :y, :z, :image, :blend_mode, :alpha, :angle
  
  def initialize(img)
    @x = 0
    @y = 0
    @z = 0
    @image = img
    @blend_mode = :default
    @alpha = 1.0
    @angle = 0
  end
  
  def update
    raise "This method must be overridden"
  end
  
  def draw
    @image.draw_rot(@x, @y, @z, @angle)
  end
  
end