require 'pry'

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

def initialize_deck
  ([2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"] * 4).shuffle
end

def display_cards_player_turn(plyr_hnd, dlr_hnd)
  system 'clear'
  prompt "Dealer has: #{dlr_hnd[0]} and unknown card"
  prompt "You have: #{joinor(plyr_hnd, ', ', 'and')}. Total: #{total(plyr_hnd)}"
end

def display_cards_dealer_turn(plyr_hnd, dlr_hnd)
  system 'clear'
  prompt "You have: #{joinor(plyr_hnd, ', ', 'and')}. Total: #{total(plyr_hnd)}"
  prompt "Dealer has: #{joinor(dlr_hnd, ', ', 'and')}. Total: #{total(dlr_hnd)}"
end

def starting_hands!(dck, plyr_hnd, dlr_hnd)
  2.times do
    plyr_hnd << dck.pop
    dlr_hnd << dck.pop
  end
end

def player_turn!(deck, player_hand, dealer_hand)
  loop do
    answer = hit_or_stay

    if answer == 'h'
      player_hand << deck.pop
      display_cards_player_turn(player_hand, dealer_hand)
      prompt "You chose hit!"
      if bust?(total(player_hand))
        break
      end
    else
      display_cards_player_turn(player_hand, dealer_hand)
      prompt "You chose to stay!"
      break
    end
  end
end

def dealer_turn!(deck, player_hand, dealer_hand)
  loop do
    sleep(2)
    if total(dealer_hand) < 17
      dealer_hand << deck.pop
      display_cards_dealer_turn(player_hand, dealer_hand)
      prompt "The dealer hits!"
    else
      break
    end
  end
end

def hit_or_stay
  loop do
    prompt "Would you like to (h)it or (s)tay?"
    answer = gets.chomp

    if %w(h s).include?(answer.downcase[0])
      return answer.downcase[0]
    else
      prompt "Sorry, that is not a valid input."
    end
  end
end

def values(hand)
  hand.map do |card|
    case card
    when "Jack", "Queen", "King" then 10
    when "Ace" then 11
    else card
    end
  end
end

def total(hand)
  values = values(hand)
  total = values.sum
  while values.include?(11)
    break if total <= 21
    values[values.index(11)] = 1
    total = values.sum
  end
  total
end

def bust?(total)
  total > 21
end

def play_again?
  loop do
    prompt "Would you like to play again? (y/n)"
    answer = gets.chomp
    if answer.downcase.start_with?('y')
      return true
    elsif answer.downcase.start_with?('n')
      return false
    else
      prompt "Sorry, that is not a valid input."
    end
  end
end

loop do
  deck = initialize_deck
  player_hand = []
  dealer_hand = []

  starting_hands!(deck, player_hand, dealer_hand)
  display_cards_player_turn(player_hand, dealer_hand)

  player_turn!(deck, player_hand, dealer_hand)
  player_total = total(player_hand)

  if bust?(player_total)
    prompt "You have bust. You lose!"
    play_again? ? next : break
  end

  sleep(2)
  display_cards_dealer_turn(player_hand, dealer_hand)
  prompt "It's the dealer's turn!"

  dealer_turn!(deck, player_hand, dealer_hand)
  dealer_total = total(dealer_hand)

  if bust?(dealer_total)
    prompt "The dealer has bust. You win!"
    play_again? ? next : break
  else
    display_cards_dealer_turn(player_hand, dealer_hand)
    prompt "The dealer stays!"
  end

  prompt "You got: #{player_total}. The dealer got: #{dealer_total}"

  if player_total > dealer_total
    prompt "You won!"
  else
    prompt "You lost!"
  end

  break unless play_again?
end

prompt "Thanks for playing twenty-one! Good-bye!"
