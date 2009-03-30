module Engine

  class SpriteCollection
    
    attr_reader :sprites

    # Constructor
    def initialize
      @sprites = Hash.new
    end

    # Adds a new sprite  to its own sprite list
    def add(obj)
      init_list(obj.class) unless @sprites[obj.class]
      @sprites[obj.class].push(obj)
    end
    
    # Removes a existing sprite from its own list
    def remove(obj)
      @sprites[obj.class].delete(obj) if @sprites[obj.class]
    end
    
    def init_list(class_name)
      @sprites[class_name] = Array.new
    end

  end

end