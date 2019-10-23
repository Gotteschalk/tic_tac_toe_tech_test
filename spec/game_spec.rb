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
      expect(game.current_player).to eq "X"
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

    it "Throws an error if the player tries to put a mark on an occupied square" do
      game = Game.new
      game.claim_field(3,3)
      expect{game.claim_field(3,3)}.to raise_error('Selection Error: This square has already be taken. Choose another square')
    end

    it "Throws an error if the player chooses a row or column that isn't 1,2 or 3" do
      game = Game.new
      expect{game.claim_field(4,4)}.to raise_error('Selection Error: This square not on the board. Choose a square in row 1-3 and column 1-3')
    end

    it "Changes the turn after each field has been claimed" do
      game = Game.new
      game.claim_field(1,1)
      expect(game.current_player).to eq("O")
    end

    it "allows alternating players to pick multiple fields and records these in the table" do
      game = Game.new
      game.claim_field(1,1)
      game.claim_field(2,2)
      game.claim_field(3,3)
      game.claim_field(1,3)
      expect(game.board).to eq([ ["X", nil, "O"], [nil, "O"], [nil, nil, "X"] ])
    end
  end

  describe "#change_turns" do
    it "Changes the turn from X to O" do
      game = Game.new
      expect(game.current_player).to eq("X")
      game.change_turns
      expect(game.current_player).to eq("O")
      game.change_turns
      expect(game.current_player).to eq("X")
    end
  end

  describe "#player_wins?" do
    it "Is false on initialization" do
      game = Game.new
      expect(game.player_wins?).to eq false
    end

    it "Is true if the top row is three Xs" do
      game = Game.new
      game.claim_field(1,1)
      game.claim_field(2,2)
      game.claim_field(1,2)
      game.claim_field(2,3)
      game.claim_field(1,3)
      expect(game.player_wins?).to eq true
    end

    it "Is true if the middle row is three Xs" do
      game = Game.new
      game.claim_field(2,1)
      game.claim_field(1,2)
      game.claim_field(2,2)
      game.claim_field(1,1)
      game.claim_field(2,3)
      expect(game.player_wins?).to eq true
    end

    it "Is true if the bottom row is three Xs" do
      game = Game.new
      game.claim_field(3,1)
      game.claim_field(2,1)
      game.claim_field(3,2)
      game.claim_field(2,2)
      game.claim_field(3,3)
      expect(game.player_wins?).to eq true
    end

    it "Is true if the middle row is three Os" do
      game = Game.new
      game.claim_field(3,3)
      game.claim_field(2,1)
      game.claim_field(1,2)
      game.claim_field(2,2)
      game.claim_field(1,1)
      game.claim_field(2,3)
      expect(game.player_wins?).to eq true
    end

    it "Is true if the first column is all Xs" do
      game = Game.new
      game.claim_field(1,1)
      game.claim_field(1,2)
      game.claim_field(2,1)
      game.claim_field(2,2)
      game.claim_field(3,1)
      game.claim_field(2,3)
      expect(game.player_wins?).to eq true
    end
  end
end
