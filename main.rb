WINNING = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze

class Game
  def initialize
    @player1 = Player.new('player 1')
    @player2 = Player.new('player 2')
    @board = Board.new
    system 'clear'
  end

  def play_game
    @@turn = 1
    @@round = 1
    @@win = false
    @@winner = ''
    while @@round <= 9
      until @@win
        if @@turn == 1
          @board.display
          check_selection(@player1)
          if check_winner?(@player1)
            @@win = true
            @@winner = @player1.name
          end
          @@turn = 2
          @@round += 1
          system 'clear'
        else
          @board.display
          check_selection(@player2)
          if check_winner?(@player2)
            @@win = true
            @@winner = @player2.name
          end
          @@turn = 1
          @@round += 1
          system 'clear'
        end
      end
      @@round = 10
      puts "#{@@winner} is the winner!\n\n"
    end
    play_again
  end

  def play_again
    @again = ''
    @board.display
    until %w[y n Y N].include?(@again)
      puts "\nWould you like to play again? Y/N"
      @again = gets.chomp
      if @again =~ /^(Y|y)$/
        reset
        play_game
      elsif @again =~ /^(N|n)$/
        abort('Thanks for playing!')
      else
        puts 'Invalid selection'
      end
    end
  end

  def check_selection(player)
    until @board.grid.include?(@selection)
      puts "\n#{player.name} it's your turn! Select a number."
      @selection = gets.chomp.to_i
    end
    @board.grid[@selection - 1] = player.symbol
  end

  def check_winner?(player)
    WINNING.any? do |line|
      line.all? { |num| @board.grid[num] == player.symbol }
    end
  end

  def reset
    @@round = 1
    @@turn = 1
    @selection = ''
    system 'clear'
    @board.grid = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  class Player
    attr_accessor :name
    attr_accessor :symbol

    def initialize(player)
      puts "Enter you name, #{player}: "
      @name = gets.chomp
      @symbol = ''
      until @symbol.length == 1
        puts 'Enter your symbol: '
        @symbol = gets.chomp.to_s
      end
    end
  end

  class Board
    attr_accessor :grid

    def initialize
      @grid = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end

    def display
      puts " #{@grid[0]} | #{@grid[1]} | #{@grid[2]} "
      puts '-----------'
      puts " #{@grid[3]} | #{@grid[4]} | #{@grid[5]} "
      puts '-----------'
      puts " #{@grid[6]} | #{@grid[7]} | #{@grid[8]} "
    end
  end
end

game = Game.new
game.play_game
