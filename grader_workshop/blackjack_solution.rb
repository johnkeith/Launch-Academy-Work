# -*- coding: utf-8 -*-

def assert_equals(a, b)
  if a != b
    raise "assertion failed: #{a} does not equal #{b}"
  end
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

  ##################
  # YOUR CODE HERE #
  ##################
  return 0 if hand == []
  current_sum = 0
  stripped_hand = hand.map { |element| element.chop }
  ace_count = stripped_hand.count("A")

  stripped_hand.each do |element|
    if element == "J"  || element == "Q" || element == "K"
      current_sum += 10
    elsif element == "A"
      next
    else
      current_sum += element.to_i 
    end
  end

  while ace_count != 0   
    if ace_count >= 2 && current_sum != 0
      current_sum += 1 * ace_count 
      ace_count = 0
    elsif (current_sum + 11) > 21
      current_sum += 1
      ace_count = ace_count - 1
    else
      current_sum += 11
      ace_count = ace_count - 1
    end
  end

  current_sum
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

=begin # This does work, but need to find way to compare to find the closest to 21...
    possible_scores_with_aces = []
    (0..ace_count).each do |count|
      total = 0
      total += ((current_sum + 11 * count) + ((ace_count - count) * 1))
      possible_scores_with_aces << total
    end
    ace_count = 0
    puts possible_scores_with_aces 
=end
