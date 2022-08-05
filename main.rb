class Game
  attr_reader :player1, :player2, :grid

  def initialize
    @grid = Array.new(3) { Array.new(3, ' ') }
    puts 'Enter name of Player 1'
    @player1 = Player.new(gets.chomp, 'x', self)
    puts 'Enter name of Player 2'
    @player2 = Player.new(gets.chomp, 'o', self)
    start_game
  end

  def draw
    puts " #{grid[0][0]} | #{grid[0][1]} | #{grid[0][2]}"
    puts '---+---+---'
    puts " #{grid[1][0]} | #{grid[1][1]} | #{grid[1][2]}"
    puts '---+---+---'
    puts " #{grid[2][0]} | #{grid[2][1]} | #{grid[2][2]}"
  end

  private

  def start_game
    @turn_count = 0
    puts 'To make a move, type for example "12" where first number is row and second is column'
    until win?
      draw
      if @turn_count.even?
        player1.make_move
        @turn_count += 1
      else
        player2.make_move
        @turn_count += 1
      end
    end
    restart
  end

  def win?
    for row in grid do 
      if row.all? { |el| el == player1.sign }
        finish_game(player2)
        return true
      elsif row.all? { |el| el == player2.sign }
        finish_game(player2)
        return true
      end
    end

    if grid[0][0] == player1.sign && grid[1][1] == player1.sign && grid[2][2] == player1.sign
      finish_game(player1)
      return true
    end

    if grid[0][0] == player2.sign && grid[1][1] == player2.sign && grid[2][2] == player2.sign
      finish_game(player2)
      return true
    end

    if grid[0][2] == player1.sign && grid[1][1] == player1.sign && grid[2][0] == player1.sign
      finish_game(player1)
      return true
    end

    if grid[0][2] == player2.sign && grid[1][1] == player2.sign && grid[2][0] == player2.sign
      finish_game(player2)
      return true
    end

    if draw?
      puts "Draw!"
      return true
    end

    false
  end

  def finish_game(player)
    draw
    puts "Player #{player.name} won!"
  end

  def draw?
    grid.all? do |row|
      row.all? { |el| el != " "}
    end
  end

  def restart
    puts 'Wanna restart? (y/n)'
    answer = gets.chomp
    case answer
    when 'y'
      initialize
    when 'n'
      false
    else
      puts 'Unknown answer'
      restart
    end
  end
end

class Player < Game
  attr_reader :name, :sign, :game

  def initialize(name, sign, game)
    @name = name
    @sign = sign
    @game = game
  end

  def make_move
    answer = gets.chomp.split("")
    row = answer[0].to_i - 1
    col = answer[1].to_i - 1

    if game.grid[row][col] == ' '
      game.grid[row][col] = sign
    else
      puts "Wrong number or spot is already marked"
      make_move
    end
  end
end

Game.new
