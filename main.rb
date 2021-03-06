# create a method to print the board
# we assume that the board is a 2-dimmensional array
def print_board(board)
  board.each do |row|
    row.each do |cell|
      print " #{cell} "
    end
    puts ""
  end
end

# create the board
board = [
  ['□','□','□'],
  ['□','□','□'],
  ['□','□','□'],
]

def inside_board?(board, row, col)
  row < 3 and row >= 0 and col < 3 and col >= 0
end

def row_win?(board, row, mark)
  board[row][0] == mark and board[row][1] == mark and board[row][2] == mark
end

def col_win?(board, col, mark)
  board[0][col] == mark and board[1][col] == mark and board[2][col] == mark
end

def left_diag_win?(board, mark)
  board[0][0] == mark and board[1][1] == mark and board[2][2] == mark
end

def right_diag_win?(board, mark)
  board[0][2] == mark and board[1][1] == mark and board[2][0] == mark
end

def win?(board, mark)
  row_win?(board, 0, mark) or
  row_win?(board, 1, mark) or
  row_win?(board, 2, mark) or
  col_win?(board, 0, mark) or
  col_win?(board, 1, mark) or
  col_win?(board, 2, mark) or
  right_diag_win?(board, mark) or
  left_diag_win?(board, mark)
end

def empty?(board, row, col)
  board[row][col] != 'X' or board[row][col] != 'O'
end

def update_board(board, mark)
    puts "Give a row."
    row = gets.to_i                                                             #Grab the row
    puts "Give a column."
    col = gets.to_i                                                             #Grab the col
    while inside_board?(board, row, col) == false or empty?(board, row, col) == false  #While row/col are not inside or not empty...
        puts "Invalid row or column."
        puts "Give a row."
        row = gets.to_i                                                         #Grab the row
        puts "Give a column."
        col = gets.to_i                                                         #Grab the col
    end
    board[row][col] = mark
end

def computer_update(board, mark)
  row = rand(3)
  col = rand(3)
  while inside_board?(board, row, col) == false or empty?(board, row, col) == false
    row = rand(3)
    col = rand(3)
  end
  board[row][col] = mark
end

def play(board)
    puts 'Player X, go first.'
    while true
      update_board(board, 'X')
      print_board(board)
      if win?(board, 'X') == true
        puts "X won!"
        exit
      end
      # update_board(board, 'O')
      computer_update(board, 'O')
      print_board(board)
      if win?(board, 'O') == true
        puts "O won!"
        exit
      end
    end
end

play(board)