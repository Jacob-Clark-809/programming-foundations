require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(to_join, delimiter=', ', final='or')
  case to_join.length
  when 0 then ''
  when 1 then to_join[0]
  when 2 then to_join.join(" #{final} ")
  else
    to_join[0..-2].join(delimiter) + delimiter + final + ' ' + to_join[-1].to_s
  end
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def display_score(plyr_scr, cpt_scr)
  prompt "Player score: #{plyr_scr}; Computer score: #{cpt_scr}"
end

def intialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def alternate_player(curr_player)
  curr_player == 'Player' ? 'Computer' : 'Player'
end

def place_piece!(brd, curr_player)
  if curr_player == 'Player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def player_places_piece!(brd)
  square = nil
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  if optimal_square(brd, COMPUTER_MARKER)
    brd[optimal_square(brd, COMPUTER_MARKER)] = COMPUTER_MARKER
  elsif optimal_square(brd, PLAYER_MARKER)
    brd[optimal_square(brd, PLAYER_MARKER)] = COMPUTER_MARKER
  elsif empty_squares(brd).include?(5)
    brd[5] = COMPUTER_MARKER
  else
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end

def optimal_square(brd, marker)
  WINNING_LINES.each do |line|
    line_values = brd.values_at(*line)
    if line_values.count(marker) == 2 &&
       line_values.count(INITIAL_MARKER) == 1
      return line[line_values.index(INITIAL_MARKER)]
    end
  end
  nil
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def someone_won_first_to_five?(plyr_scr, cpt_scr)
  !!first_to_five_winner(plyr_scr, cpt_scr)
end

def first_to_five_winner(plyr_scr, cpt_scr)
  if plyr_scr == 5
    'Player'
  elsif cpt_scr == 5
    'Computer'
  end
end

def starting_player
  player = nil
  loop do
    prompt "Who would you like to go first? (Player, p; computer, c; random r)"
    player = gets.chomp

    if player.downcase.start_with?('c')
      player = 'Computer'
    elsif player.downcase.start_with?('p')
      player = 'Player'
    elsif player.downcase.start_with?('r')
      player = %w(Player Computer).sample
    end

    break if %w(Player Computer).include?(player)

    prompt "Sorry, that is not a valid input. Try again."
  end
  player
end

def greeting
  prompt "Welcome to Tic Tac Toe!"
  prompt "Take turns placing symbols in a 3x3 grid."
  prompt "Get three in a row to win the match!"
  prompt "First to win five matches wins the game!"
end

greeting

player_score = 0
computer_score = 0
loop do
  board = intialize_board
  current_player = starting_player

  loop do
    display_board(board)

    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
    if detect_winner(board) == 'Player'
      player_score += 1
    else
      computer_score += 1
    end
  else
    prompt "It's a tie!"
  end

  display_score(player_score, computer_score)
  if someone_won_first_to_five?(player_score, computer_score)
    winner = first_to_five_winner(player_score, computer_score)
    prompt "#{winner} won the first to five!"
    player_score = 0
    computer_score = 0
  end
  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
