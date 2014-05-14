def multiplication_table(size = 12)
  array_of_lines = []
  
  (1..size).each do |n|
    array_of_lines << [n, 2 * n, 3 * n, 4 * n, 5 * n, 6 * n, 7 * n, 8 * n, 9 * n, 10 * n, 11 * n, 12 * n]
  end

  array_of_lines.each do |line|
    puts line.join("\t")
  end
end

multiplication_table

def create_line(size)
end
