def get_guess
  print "Guess a number between 1 - 1000: "
  gets.chomp.to_i
end

def guess_my_number
  hidden_random = rand(1000) + 1
  user_guess = get_guess
  
  while hidden_random != user_guess
    if user_guess > hidden_random
      puts "Guess too high, try again!"
      user_guess = get_guess
    else
      puts "Guess too low, give it another go!"
      user_guess = get_guess
    end
  end

  puts "You got it!"
end

guess_my_number
