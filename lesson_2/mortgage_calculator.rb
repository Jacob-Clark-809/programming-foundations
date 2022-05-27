# Welcome message
# Get loan amount
# Get APR
# Get loan duration
# Calculate montly interest rate
# Calculate loan duration in months
# Calculate monthyly payment

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_f % 1 == 0 ? num.to_i.to_s == num : num.to_f.to_s == num
end

def get_number
  value = nil
  loop do
    value = Kernel.gets.chomp
    break if valid_number?(value)
    prompt("Hmmm... that doesn't look like a valid number. Please try again:")
  end
  value
end

prompt("Welcome to the mortgage calculator!")

loop do
  prompt("Please enter your loan amount, £:")
  loan_amount = get_number.to_f

  prompt("Please enter the Anual Percentage Rate (APR):")
  apr = get_number.to_f / 100
  monthly_interest = apr / 12

  prompt("Please enter the loan duration in years:")
  loan_duration = get_number.to_f * 12

  monthly_payment = loan_amount * (monthly_interest / \
  (1 - (1 + monthly_interest)**(-loan_duration)))

  prompt("Your monthly repayment is £#{monthly_payment.round(2)}")

  prompt("Would you like to calculate again? (Y to calculate again)")
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using the mortgage calculator!")
