require 'pry'

def get_prices
  prices_array = []
  input = ""

  while true
    puts "What is the sale price? Type done when finished."
    input = gets.chomp
    break if input == "done"
    prices_array << input.to_f
    show_subtotal(prices_array)
  end

  prices_array
end

# print out item prices, one per line
# print out total amount due
def print_out_item_prices(prices_array)
  output_string = "\nHere are your item prices:\n"
  prices_array.each do |item|
    output_string << "$#{sprintf "%.2f", item.to_s}\n"
  end
  puts output_string << "The total amount due is $#{format_money(get_amount_due(prices_array))}\n"
end

#  return sum array
def get_amount_due(prices)
  prices.inject(:+)
end

def show_subtotal(prices)
  puts "Subtotal: $#{format_money(get_amount_due(prices))}"
end

# ask what the sale price is for each item (while loop)
# create array 
# add price to array
# convert to f

# prompt user for amount given
def get_amount_given
  puts "What is the amount tendered?"
  gets.chomp.to_f
end

def difference(amount_due, amount_given)
  amount_given - amount_due
end

def calculation(prices_array)
  difference(get_amount_due(prices_array), get_amount_given)
end

def format_change(change)
  absolute_change = change.abs
  sprintf("%.2f", absolute_change)
end

def format_money(float)
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

prices_array = get_prices

change = calculation(prices_array)

print_out_item_prices(prices_array)

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
