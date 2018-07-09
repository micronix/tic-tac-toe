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

# the mark variable stores the mark that will placed on the board next
# when we start the game, the next mark that will be placed is x
mark = 'X'

# each turn is one iteration of the loop
# for now the game never ends
# later we will check the board to see if someone has won the game
while true
  # first ask the player for a row and then a column
  print "row: "
  row = gets.chomp.to_i

  print "col: "
  col = gets.chomp.to_i

  # update the board
  board[row][col] = mark

  # show the board to the users after we place a mark on the board
  print_board(board)

  # after we place the mark on the board switch it to who is next
  if mark == 'X'
    mark = 'O'
  else
    mark = 'X'
  end
end
