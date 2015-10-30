class Player
  LIVES = 3

  def initialize(name)
    @name   = name
    @lives  = LIVES
    @points = 0
  end

  def reset_lives
    @lives = LIVES
  end

  def name
    @name
  end

  def right
    @points += 1
  end

  def wrong
    @lives -= 1
  end

  def score
    @points
  end

  def remaining_lives
    @lives
  end

  def is_alive?
    @lives > 0
  end

end


