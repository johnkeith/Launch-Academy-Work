require 'pry'

hidden = rand(1..100)
puts "Give it a guess"
guess = gets.chomp
binding.pry

if hidden == guess.to_i
  puts "Correct!"
else
  if guess < hidden
    puts "too low!"
  else
    puts "too high!"
  end
end
