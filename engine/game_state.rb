module Engine
  # This is an abstract class for the different game states (game screens)
  class GameState
    
    # Constructor
    def initialize
      raise "This is an abstract class"
    end
    
    # Updates all game entities belonging to this state
    def update
    end
    
    # Draws all game entities belonging to this state
    def draw
      raise "This method should be overridden"
    end
    
    # Gets called when the player releases a button
    def button_up(id)
    end
    
    # Gets called when the player presses down a button
    def button_down(id)
    end
  end
end