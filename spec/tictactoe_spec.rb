require './lib/game'
require './lib/player'
require './lib/board'

describe Game do
    subject(:game) {described_class.new}
=begin 
    before do 
        game.instance_variable_set(:@player1, instance_double(Player))

        allow(player1).to receive(:puts)
        game.instance_variable_set(:@board, instance_double(Board))
    end
=end

    describe "#start_game" do
        xit "creates players, board, and plays game" do
            player1_name = "Zach"
            player1_symbol = "X"
            player2_name = "Britt"
            player2_symbol = "O"
        end
    end

    describe "#reset" do
        context "when player wants to play again" do
            it "resets board" do
                
                game.reset
                expect(@board.grid).to eql([1, 2, 3, 4, 5, 6, 7, 8, 9])
            end
        end
    end

    describe "#check_winner?"
        context "if player has winning combo" do
            xit "returns true" do
                game.instance_variable_set(@player1, instance_double(Player))
                game.instance_variable_set(@board, instance_double(Board))
                game.check_winner?()
            end
        end
end