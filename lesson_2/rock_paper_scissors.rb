VALID_CHOICES = [['rock', 'paper', 'scissors', 'lizard', 'spock'], \
                 ['r', 'p', 'sc', 'l', 'sp']]
WINNING_COMBINATIONS = { rock: ['scissors', 'lizard'], \
                         paper: ['rock', 'spock'], \
                         scissors: ['paper', 'lizard'], \
                         lizard: ['spock', 'paper'], \
                         spock: ['rock', 'scissors'] }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  WINNING_COMBINATIONS[first.to_sym].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("You lost!")
  else
    prompt("Draw!")
  end
end

loop do
  prompt("Best of three!")
  player_count = 0
  computer_count = 0
  loop do
    choice = nil
    loop do
      prompt("Choose one: #{VALID_CHOICES[0].join(', ')}")
      choice = Kernel.gets().chomp()

      if VALID_CHOICES[0].include?(choice)
        break
      elsif VALID_CHOICES[1].include?(choice)
        choice = VALID_CHOICES[0][VALID_CHOICES[1].index(choice)]
        break
      else
        prompt("That's not a valid chocie.")
      end
    end

    computer_choice = VALID_CHOICES[0].sample

    prompt("You chose #{choice}; computer chose #{computer_choice}")

    display_results(choice, computer_choice)

    player_count += 1 if win?(choice, computer_choice)
    computer_count += 1 if win?(computer_choice, choice)
    prompt("Player score: #{player_count}, computer score: #{computer_count}")
    if player_count == 3
      prompt("You won the best of three!")
      break
    elsif computer_count == 3
      prompt("You lost the best of three!")
      break
    end
  end

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thanks for playing!")
