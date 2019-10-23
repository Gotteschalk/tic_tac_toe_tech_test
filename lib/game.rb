class Game
attr_reader :board, :current_player

  def initialize
    @board = [ [], [], [] ]
    @current_player = "X"
  end

  def claim_field(row, column)
    if !@board[row - 1][column - 1].nil?
      raise 'Selection Error: This square has already be taken. Choose another square'
    else
    @board[row - 1].insert(column - 1, @current_player)
    change_turns
    end
  end

  def change_turns
    @current_player == "X" ? @current_player = "O" : @current_player = "X"
  end

end
