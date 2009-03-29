class SpriteFactory
  
  # Constructor
  def initialize
    @sprites = Hash.new
  end
  
  # Returns the asked sprite list
  def sprites(class_name)
    @sprites[class_name]
  end
  
  # Produces a new sprite and adds it to its own sprite list
  def create(class_name, *args)
    @sprites[class_name] = Array.new unless @sprites[class_name]
    @sprites[class_name].push(class_name.new(*args))
  end
  
end