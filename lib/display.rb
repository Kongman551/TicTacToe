require './lib/board'

module Display
    def display_grid(grid)
        puts " #{grid.grid[0]} | #{grid.grid[1]} | #{grid.grid[2]} "
        puts '-----------'
        puts " #{grid.grid[3]} | #{grid.grid[4]} | #{grid.grid[5]} "
        puts '-----------'
        puts " #{grid.grid[6]} | #{grid.grid[7]} | #{grid.grid[8]} "
    end

    def cls
        system 'clear'
    end

    def display_round
        puts "Round #{@round}\n\n"
    end

    def display_winner(player, win)
        puts win ? "#{player} is the winner!\n\n" : "Sorry no winner!\n\n"
    end 
end