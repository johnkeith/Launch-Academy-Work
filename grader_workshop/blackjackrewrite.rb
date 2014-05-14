def score(hand)
  current_sum = 0
  stripped_hand = hand.map { |element| element.chop }
  ace_count = stripped_hand.count("A")

  stripped_hand.each do |element|
    if element == "J"  || element == "Q" || element == "K"
      current_sum += 10
    elsif element == "A"
      current_sum += 0
    else
      current_sum += element.to_i 
    end
  end

  while ace_count != 0
    if (current_sum + 11) > 21
      current_sum += 1
      ace_count = ace_count - 1
    else
      current_sum += 11
      ace_count = ace_count - 1
    end
  end

  puts current_sum
end

score ["A♦", "A♠"]

