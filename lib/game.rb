require './lib/display'

class Game

attr_reader :board, :player1, :player2

include Display

  def initialize
    start_game
  end

  def start_game
    @player1 = Player.new('player 1')
    @player2 = Player.new('player 2')
    @board = Board.new
		cls
    start_round
  end

  def start_round
    @@turn = 1
    @round = 1
    @@win = false
    @@winner = ''
    play_game
  end

  def play_game
    until @@win || @round == 10
      display_round
      @@turn == 1 ? play_round(@player1) : play_round(@player2)
      @@turn = switch_turn
      round_up
      cls
    end
    round_ten
  end

  def switch_turn
    @@turn == 1 ? @@turn = 2 : @@turn = 1
  end

  def round_up
    @round += 1
  end

  def play_round(player)
    display_grid(@board)
    check_selection(player)
    @@win = true if check_winner?(player)
    @@winner = player.name if @@win
  end
  
  def round_ten
    display_winner(@@winner, @@win)
    play_again
  end

  def play_again
    @again = ''
    display_grid(@board)
    until %w[y n Y N].include?(@again)
      puts "\nWould you like to play again? Y/N"
      @again = gets.chomp
      if @again =~ /^(Y|y)$/
        reset
        start_round
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
    @selection = ''
    cls
    @board.grid = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end
end