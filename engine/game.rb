require 'singleton'

module Engine
  class Game < Gosu::Window
    include Singleton
    
    ScreenWidth = 550
    ScreenHeight = 600

    # Constructor. Setups the video mode and creates a window (60 fps)
    def initialize      
      super(ScreenWidth, ScreenHeight, false)
      self.caption = "Space Shooter"
      @@sprite_collection = SpriteCollection.new
      @@images = Hash.new      
      load_images
       
      @@game_state = PlayState.new
    end

    def Game.images
      @@images
    end
    
    def Game.sprites
      @@sprite_collection.sprites
    end
    
    def Game.sprite_collection
      @@sprite_collection
    end

    # Updates the game logic. Gets called automatically by Gosu each frame
    def update
      @@game_state.update
    end

    # Draws the game entities on the screen. Gets called automatically by Gosu each frame
    def draw
      @@game_state.draw
    end

    # Gets called automatically by Gosu when a button is released
    def button_up(id)
      @@game_state.button_up(id)
    end

    # Gets called automatically by Gosu when a button is pressed
    def button_down(id)
      @@game_state.button_down(id)
    end

    # Loads all the images needed and stores it into the images hash map
    def load_images
      @@images["background"] = Gosu::Image.new(self, "gfx/background.png", false)
      @@images["captain"] = Gosu::Image.new(self, "gfx/captain.png", false)
      @@images["laser"] = Gosu::Image.new(self, "gfx/laser.png", false)
      @@images["alien"] = Gosu::Image.load_tiles(self, "gfx/alien.png", 48, 42, false)
      @@images["energy full"] = Gosu::Image.new(self, "gfx/energy_full.png", false)
      @@images["energy low"] = Gosu::Image.new(self, "gfx/energy_low.png", false)
      @@images["hud"] = Gosu::Image.new(self, "gfx/hud.png", false)
    end
  end

end