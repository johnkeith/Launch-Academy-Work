require 'pry'
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
  
  stripped_hand = strip_hand_of_suites(hand)
  
  ace_count = stripped_hand.count("A")

  score_without_aces = score_hand_without_aces(stripped_hand, current_sum)

  #score_hand_with_aces(ace_count, score_without_aces)

  possible_scores = possible_scores_with_aces(ace_count, score_without_aces)

  closest_score_to_twenty_one(possible_scores)

end

def strip_hand_of_suites(hand)
  hand.map { |element| element.chop }
end

def score_hand_without_aces(hand, current_sum)
  hand.each do |card|
    if card == "J"  || card == "Q" || card == "K"
      current_sum += 10
    elsif card == "A"
      next
    else
      current_sum += card.to_i 
    end
  end
  current_sum
end

def score_hand_with_aces(ace_count, current_sum)
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

def possible_scores_with_aces(ace_count, current_sum)
  binding.pry
  possible_scores = []
  (0..ace_count).each do |counter|
    possible_scores << ((current_sum + 11 * counter) + ((ace_count - counter) * 1))
  end
  ace_count = 0
  possible_scores
end

def closest_score_to_twenty_one(possible_scores)
  scores_twenty_one_or_lower = possible_scores.reject! { |i| i > 21 }
  binding.pry
  ideal_value = 21
  scores_twenty_one_or_lower.min {|score1, score2| (ideal_value - score1).abs <=> (ideal_value - score2).abs}
end

=begin
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
=end

puts score(["2♠"])
