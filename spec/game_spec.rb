require 'game'

describe Game do
  context "On initialization" do
    game = Game.new

    it "Has a board of three rows" do
      expect(game.board.length).to eq 3

    end

    it "Is empty on initialization" do
      expect(game.board[0]).to be_empty
      expect(game.board[1]).to be_empty
      expect(game.board[2]).to be_empty
    end

    it "Is the turn of X" do
      expect(game.turn).to eq "X"
    end
  end

  describe "#claim_field" do


    game = Game.new

    it "Places a mark on the board in the top left square" do
      game.claim_field(1,1)
      expect(game.board).to eq([ ["X"], [], [] ])
    end
  end
end