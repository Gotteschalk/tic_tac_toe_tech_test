class Game
attr_reader :board, :current_player

  def initialize
    @board = [ [], [], [] ]
    @current_player = "X"
    @player_wins = false
  end

  def claim_field(row, column)
    if row > 3 || column > 3
      raise 'Selection Error: This square not on the board. Choose a square in row 1-3 and column 1-3'
    elsif !@board[row - 1][column - 1].nil?
      raise 'Selection Error: This square has already be taken. Choose another square'
    else
    @board[row - 1].insert(column - 1, @current_player)
    change_turns
    end
  end

  def change_turns
    @current_player == "X" ? @current_player = "O" : @current_player = "X"
  end

  def player_wins?
    if complete_row?
      true
    elsif complete_column?
      true
    elsif complete_diagonal?
      true
    else false
    end
  end

private

  def complete_row?
    @board.each do |row|
      if row.count("X") == 3 || row.count("O") == 3
        return true
      end
    end
    return false
  end

  def complete_column?
    i = 0
    while i < 3 do
      column_arr = []
        @board.each do | row|
          column_arr.push(row[i])
        end
      if column_arr.count("X") == 3 || column_arr.count("O") == 3
        return true
      i += 1
      end
    return false
    end
  end

  def complete_diagonal?
    #Got this far...
  end
end
