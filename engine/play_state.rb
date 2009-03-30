module Engine
  class PlayState < GameState
    
    # Constructor
    def initialize
      [Alien, Bullet, EnergyBar, Hud, Ship].each {|x| Game.sprite_collection.init_list(x)}
      
      @captain = Ship.new
      @img_background = Game.images["background"]
      
      Hud.new
      EnergyBar.new     
    end
    
    # Draws game entities on the screen
    def draw
      @img_background.draw(0, 0, 0)     

      Game.sprites.each_value do |list|
        list.each do |s|
          s.draw
        end
      end
    end
    
    # Updates game entities
    def update
      process_input
      
      # spawn enemies
      Alien.new if rand(100) < 10
            
      Game.sprites.each_value do |list|
        list.each do |s|
          s.update
        end
      end
    end
    
    # Gets called when the player presses down a button
    def button_down(id)
      case id
      when Gosu::KbEscape then Game.instance.close
      end
    end
    
    # Gets called when the player releases a button
    def button_up(id)
      case id
      when Gosu::KbSpace then @captain.shoot
      end
    end
    
    # Check the status of some buttons and performs the appropiate actions
    def process_input
      @captain.move(-Ship::Speed) if Game.instance.button_down?(Gosu::KbLeft)
      @captain.move(Ship::Speed) if Game.instance.button_down?(Gosu::KbRight)
    end
  end
end