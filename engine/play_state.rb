module Engine
  class PlayState < GameState
    attr_reader :energy, :score
    
    MaxEnergy = 5
    
    # Constructor
    def initialize
      @game_over = false # flag
      
      # init sprite lists
      [Alien, Bullet, EnergyBar, Explosion, Hud, Ship].each {|x| Game.sprite_collection.init_list(x)}
      
      @captain = Ship.new
      @img_background = Game.images["background"]
      @font_score = Game.fonts["score"]
      
      Hud.new
      EnergyBar.new
      
      @score = 0
      @energy = MaxEnergy       
    end
    
    # Draws game entities on the screen
    def draw
      # draw the background
      @img_background.draw(0, 0, 0)
      @img_game_over.draw_rot(Game::ScreenWidth/2, Game::ScreenHeight/3, ZOrder::Hud, 0) if game_over?
      
      # draw the score
      @font_score.draw_rel(@score.to_s, Game::ScreenWidth - 20, Game::ScreenHeight - 5, ZOrder::Hud + 1, 1.0, 1.0)
      
      # draw all sprites
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
            
      # update all sprites
      Game.sprites.each_value do |list|
        list.each do |s|
          s.update
        end
      end
    end
    
    # Gets called when the player releases a button
    def button_up(id)
      case id
      when Gosu::KbSpace then @captain.shoot # shoot a bullet
      when Gosu::KbEscape then Game.game_state = MenuState
      when Gosu::KbReturn then Game.game_state = MenuState if game_over?
      end
    end
    
    # Check the status of some buttons and performs the appropiate actions
    def process_input
      @captain.move(-Ship::Speed) if Game.instance.button_down?(Gosu::KbLeft)
      @captain.move(Ship::Speed) if Game.instance.button_down?(Gosu::KbRight)
    end
    
    # Shows the game over message
    def start_game_over
      @img_game_over = Game.images["gameover"]
      @game_over = true
    end
    
    # Returns whether the game is over or not
    def game_over?
      @game_over
    end
    
    # Adds the given value to the player's score
    def increase_score!(x)
      @score += x
    end
    
    # Ouch! Decreases the ship's energy and starts the game over if there is no more energy left
    def decrease_energy
      @energy -= 1
      if @energy <= 0
        Game.sprites[Ship].first.destroy! unless Engine::Game.sprites[Ship].empty?
        Game.game_state.start_game_over
      end
    end
  end
end