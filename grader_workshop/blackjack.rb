# -*- coding: utf-8 -*-

def assert_equals(a, b)
  if a != b
    raise "assertion failed: #{a} does not equal #{b}"
  end
end
#-------------------------------------------#
def strip_symbol(hand)
  hand.map{ |element| element.chop} #make permanent?
end


#-----------------------------------------#
def check_if_ace?(hand)
  hand.include?("A")
end

#---------------------------------------------#
def convert(hand)
  #take each item in array and convert it to its integer value
  hand.map do |element|
    if element == "J"  || element == "Q" || element == "K"
       element = 10
    elsif element == "A"
      element = 0
    else
      element.to_i
    end
  end
end

#--------------------------------------------#

def sum_without_ace(hand)
  hand.inject(0) { |sum, value| sum + value }
end

#-----------------------------------------------#
def sum_with_ace(hand)


  current_sum = sum_without_ace(hand)

  hand.map!{|element| element = "A" if element == 0}

  ace_count = hand.count("A")

  while ace_count != 0
    if current_sum += 11 > 21
      current_sum += 1
      ace_count -= 1
    else
      current_sum += 11
      ace_count -= 1
    end
  end
  current_sum
end


def score(hand)
  # Calculate the best score for the given hand in Blackjack. Each card
  # is worth a certain amount of points:
  #
  # * A face card (K, Q, or J) is worth 10 points.
  # * Aces are worth either 1 or 11 points, whichever yields the score
  #   closest to 21 without exceeding it.
  # * All of the cards are worth their numeric value (2-10).
  #
  # `hand` contains an array of cards. Each card is represented
  # as a string combining the value and the suit.
  #
  # e.g. ["A♠", "2♥", "J♣", "10♦"]

#if empty just return 0
  if hand == []
    0
 #if theres no ace in the hand,
  elsif !check_if_ace?(hand)
    convert(strip_symbol(hand)).inject(0){|sum, value| sum + value}
  else
    stripped_hand = strip_symbol(hand)
    converted_stripped_hand = convert(stripped_hand)
    sum_with_ace(converted_stripped_hand)


  end

end


assert_equals(score([]), 0)
assert_equals(score(["2♠"]), 2)
assert_equals(score(["10♣"]), 10)
assert_equals(score(["K♣"]), 10)
assert_equals(score(["A♦"]), 11)
assert_equals(score(["2♠", "8♣"]), 10)
assert_equals(score(["A♦", "A♠"]), 12)
assert_equals(score(["10♦", "3♠", "10♣"]), 23)
assert_equals(score(["A♦", "A♠", "10♣"]), 12)

puts "If you get here, all tests passing..."
