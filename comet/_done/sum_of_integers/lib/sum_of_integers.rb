# YOUR CODE HERE
def sum(file_of_ints)
  opened_file = File.open(file_of_ints).readlines
  opened_file.map! { |item| item.gsub("\n", "").to_i }
  opened_file.inject(:+)
end
