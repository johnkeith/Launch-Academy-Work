#!/usr/bin/env ruby
require 'pry'

word_bank = ["hello", "world", "foo", "bar", "launch", "academy", "zoo", "k"]

def select_hidden_word(word_bank)
  hidden_word = word_bank.sample
  word_bank.delete_if {|item| item == hidden_word}
  hidden_word
end

def display_progress(hidden_word, correct_guesses)
  print "Word: "
  hidden_word.each do |item|
    if correct_guesses.include?(item)
      print "#{item} "
    else
      print "_ "
    end
  end
end

def display_chances_left(chances_left)
  puts "\nChances remaining: #{chances_left}"
end

def check_chances_left(chances_left)
  sorry if chances_left == 0
end

def congrats
  puts "You win!"; abort
end

def sorry
  puts "You lose!"; abort
end

def check_if_guess_correct(input, hidden_word, correct_guesses, chances)
  if hidden_word.include?(input)
    hidden_word.count(input).times { correct_guesses << input }
    true
  else
    puts "Sorry, no #{input}'s found."
    false
  end
end

# game loop

hidden_word = select_hidden_word(word_bank).split(//)
chances = 8
correct_guesses = []

puts "Hello, welcome to Hangman!"

while hidden_word.length != correct_guesses.length
  display_progress(hidden_word, correct_guesses)
  
  display_chances_left(chances)
  
  print "Guess a single letter (a-z) or the entire word: "
  
  input = gets.chomp
  
  if input.length > 1
    # check to see if the input word is the same as the hidden - either way you exit program
    hidden_word.join == input ? congrats : sorry
  else
    #its a character
    check = check_if_guess_correct(input, hidden_word, correct_guesses, chances)
    chances -= 1 if check == false
  end

  check_chances_left(chances)
end

congrats
    # it is a character, check if character is in hidden word, then add to correct_guess array if true 
    #   if it exists in hidden word, add to correct guesses
    #     else chances left -1
    #       call check chances left
    # end

