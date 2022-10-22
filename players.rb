class Player 
  def initialize(name)
    @name = name
    @lives = 3
    @losing_games = 0
  end

  def remaining_lives
    remaining_lives = @lives - @losing_games
    @lives = remaining_lives
  end

  def name
    @name
  end

  def losing_games
    @losing_games
  end
  
end

player1 = Player.new('Player1')

puts player1.remaining_lives
puts player1.name
