module Engine
  class GameState
    
    # Constructor
    def initialize
      raise "This is an abstract class"
    end
    
    # Updates all game entities belonging to this state
    def update
      raise "This method should be overridden"
    end
    
    # Draws all game entities belonging to this state
    def draw
      raise "This method should be overridden"
    end
    
  end
end