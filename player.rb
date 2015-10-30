class Player
  LIVES = 3
   attr_accessor :name, :lives, :points

  def initialize(name)
    self.name   = name
    self.lives  = LIVES
    self.points = 0
  end

  def reset_lives
    self.lives = LIVES
  end

  def right
    self.points += 1
  end

  def wrong
    self.lives -= 1
  end

  def is_alive?
    self.lives > 0
  end

end


