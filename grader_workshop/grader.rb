def grader
  puts "Input your grades. When you are finished, type done."
  grades = []
  done = false
  while done == false
    input = gets.chomp
    
    if input == "done"
      done = true
      average(grades) >= 70 ? "#{print "Passed"}" : "#{print "Failed"}"
    else
      grades << input.to_i
      puts "Next grade"
    end

  end 
  
end

def average(grades)
  total = 0
  grades.each do |grade|
    total += grade
  end
  total / grades.length
end

grader
