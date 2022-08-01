class Game
  attr_reader :player1, :player2, :grid

  def initialize
    @grid = Array.new(3) { Array.new(3) }
    puts 'Enter name of Player 1'
    @player1 = Player.new(gets.chomp)
    puts 'Enter name of Player 2'
    @player2 = Player.new(gets.chomp)
    start_game
  end

  private

  def start_game
    turn_count = 0
    until win?
      if turn_count.even?
        player1.make_move
      else
        player2.make_move
      end
    end
    restart
  end

  def win?
    false
  end

  def restart
    false
  end
end

class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  protected

  def make_move
    false
  end
end

Game.new
