require 'pry'

#  return sum array
def get_amount_due(prices)
  prices.inject(:+)
end

# ask what the sale price is for each item (while loop)
# create array 
# add price to array
# convert to f
def get_prices
  puts "What is the sale price? Type done when finished."
  @prices_array = []
  input = gets.chomp

  while input != "done"
    @prices_array << input.to_f
    puts "What is the sale price? Type done when finished."
    input = gets.chomp
  end
  @prices_array
end

# print out item prices, one per line
# print out total amount due
def print_out_item_prices(prices_array)
  output_string = "Here are your item prices:\n"

  prices_array.each do |item|
    output_string << "$#{sprintf "%.2f", item.to_s}\n"
  end

  puts output_string << "The total amount due is $#{format_float_to_money(get_amount_due(@prices_array))}\n"
end

# prompt user for amount given
def get_amount_given
  puts "What is the amount tendered?"
  gets.chomp.to_f
end

def difference(amount_due, amount_given)
  amount_given - amount_due
end

def calculation
  difference(get_amount_due(get_prices), get_amount_given)
end

def format_change(change)
  absolute_change = change.abs
  sprintf("%.2f", absolute_change)
end

def format_float_to_money(float)
  sprintf "%.2f", float
end

def print_receipt(change)
  puts %/
===Thank You!===
The total change due is $#{format_change(change)}

#{Time.now.strftime("%m/%d/%Y %I:%M%p")}
================
  /
end

def warning(change)
  puts "WARNING: Customer still owes $#{format_change(change)}! Exiting..."
end

#----------------------------------------------------------------#


change = calculation

print_out_item_prices(@prices_array)

# check if amount given is > amount due
if change >= 0
  # if amount given is !< amount due
  # output recipet
  print_receipt(change)
else
  # if amount given is < amount due
  # output warning
  warning(change)
end





  
  


