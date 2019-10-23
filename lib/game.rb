class Game
attr_reader :board, :turn

  def initialize
    @board = [ [], [], [] ]
    @turn = "X"
  end

  def claim_field(row, column)
    @board[row - 1].insert(column - 1, "X")
  end

end
