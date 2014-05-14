def uniques(list)
  unique_list = []
  list_array = list.split(",")
  list_array.each {|item| unique_list << item unless unique_list.include?(item)}
  unique_list.join(",")
end
