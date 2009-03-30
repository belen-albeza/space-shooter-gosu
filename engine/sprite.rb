module Engine
  class Sprite

    attr_reader :x, :y, :z, :image, :blend_mode, :alpha, :angle, :radius

    def initialize
      
      @x = 0
      @y = 0
      @z = 0
      @image = nil
      @blend_mode = :default
      @alpha = 1.0
      @angle = 0
      @index = 0
      @radius = 0
            
      Game.sprite_collection.add(self)   
    end

    def update
    end

    def draw
      if @image.class == Array
        img = @image[@index]
      else
        img = @image
      end
      img.draw_rot(@x, @y, @z, @angle)
    end
    
    def kill
      Game.sprite_collection.remove(self)
    end
    
    def collision?(other)
      Gosu::distance(@x, @y, other.x, other.y) < @radius + other.radius
    end

  end
end