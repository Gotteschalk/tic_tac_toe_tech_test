class Game
attr_reader :board, :turn

  def initialize
    @board = [ [], [], [] ]
    @turn = "X"
  end

  def claim_field(row, column)
    if !@board[row - 1][column - 1].nil?
      raise 'Selection Error: This square has already be taken. Choose another square'
    else
    @board[row - 1].insert(column - 1, "X")
  end
  end

  def change_turns
    @turn == "X" ? @turn = "O" : @turn = "X"
  end

end
