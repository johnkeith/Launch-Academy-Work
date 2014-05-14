class Student
  attr_reader :first_name, :last_name, :grades
  def initialize(first_name, last_name, grades)
    @first_name = first_name
    @last_name = last_name
    @grades = grades
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def grade_average
    if grades == []
      return 0
    else
      grades.inject(0) { |sum, value| sum.to_f + value.to_f } / grades.count
    end
  end

  def letter_grade
    grades_averaged = self.grade_average
    result = case grades_averaged
      when 90.0..100.0 then "A"
      when 80.0..90.0 then "B"
      when 70.0..80.0 then "C"
      when 60.0..70.0 then "D"
      when 0.0..60.0 then "F"
      else "Not here yet"
    end
    result  
  end

  def passed?
    grade_average >= 60.0 ? true : false
  end

  def to_s
    "#{full_name}, #{letter_grade} (#{grade_average})"
  end

end


student = Student.new('Bob', 'Loblaw', [80, 90, 100])
puts student.grade_average
puts student.letter_grade
