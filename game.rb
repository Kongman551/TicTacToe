class Game
  def initialize
    @player1 = Player.new('player 1')
    @player2 = Player.new('player 2')
    @board = Board.new
		system 'clear'
		play_game
  end

  def play_game
    @@turn = 1
    @@round = 1
    @@win = false
    @@winner = ''
    while @@round <= 9
      until @@win
        puts "Round #{@@round}\n\n"
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

        if @@round == 10 && !@win
          puts "Sorry no winner!\n\n"
          play_again
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
end