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

    it "Is the turn of X first" do
      expect(game.turn).to eq "X"
    end
  end

  describe "#claim_field" do

    it "Places a mark on the board in the top left square" do
      game = Game.new
      game.claim_field(1,1)
      expect(game.board).to eq([ ["X"], [], [] ])
    end

    it "Places a mark on the board in the middle square" do
      game = Game.new
      game.claim_field(2,2)
      expect(game.board).to eq([ [], [nil, "X"], [] ])
    end

    it "Places a mark on the board in the bottom right square" do
      game = Game.new
      game.claim_field(3,3)
      expect(game.board).to eq([ [], [], [nil, nil, "X"] ])
    end
  end

  describe "#change_turns" do
    it "Changes the turn from X to O" do
      game = Game.new
      expect(game.turn).to eq("X")
      game.change_turns
      expect(game.turn).to eq("O")
      game.change_turns
      expect(game.turn).to eq("X")
    end
  end
end
