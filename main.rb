class Game
  attr_reader :player1, :player2, :grid

  def initialize
    @grid = Array.new(3) { Array.new(3) }
    puts "Enter name of Player 1"
    @player1 = Player.new(gets.chomp)
    puts "Enter name of Player 2"
    @player2 = Player.new(gets.chomp)

  end

  def start_game
    turn_count = 0
    while !isWin?
      if turn_count.even?
        player1.make_move
      else
        player2.make_move
    end
  end

  def isWin?
    false
  end

  def restart
    false
  end
end

class Player
  def initialize(name)
    @name = name
  end

  def make_move
    false
  end
end
