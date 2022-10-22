# CLASS
# player: This class will hold each player name and lives
# question: This class will hold the questions, numbers , and results asked to the players
# message: THis class will hold the messages, it could be response to a player action or general game message

@player1
@player2
@question_number = 1
@current_player = @player1

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

  def loss_games
    @losing_games = @losing_games + 1
    remaining_lives()
    puts "#{@name} you just lost a game, remaining live #{@lives}/3"
  end
  
end

def question(player)
  value1 = rand(1..20)
  value2 = rand(1..20)
  total = value1 + value2

    # puts "Current player #{player.name} current question #{@question_number}"
    print "#{player.name} Question#{@question_number}: What does #{value1} plus #{value2} equal? "
    response = gets.chomp.to_i

    if response === total
      puts "YES! You are correct."
      puts "#{@player1.name}: #{@player1.remaining_lives}/3 vs #{@player2.name}: #{@player2.remaining_lives}/3"
      if player === @player1
        @current_player = @player2
      else
        @current_player = @player1
      end
      @question_number = @question_number + 1
      # question(@current_player)

    else
      puts "Seriously? No!"
      @current_player.loss_games()
      puts "#{@player1.name}: #{@player1.remaining_lives}/3 vs #{@player2.name}: #{@player2.remaining_lives}/3"
      if player === @player1
        @current_player = @player2
      else
        @current_player = @player1
      end
      @question_number = @question_number + 1
      # question(@current_player)

    end
end

def ask
  puts "Hello, welcome to the game"
  while @question_number < 4
    puts "----- NEW TURN -----"
     question(@current_player)
  end
end




print "First player, what is your name? "
@player1 = Player.new (gets.chomp)
puts "Welcome #{@player1.name} you have #{@player1.remaining_lives} lives"

print "Second player, what is your name? "
@player2 = Player.new (gets.chomp)
puts "Welcome #{@player2.name} you have #{@player2.remaining_lives} lives"

ask()