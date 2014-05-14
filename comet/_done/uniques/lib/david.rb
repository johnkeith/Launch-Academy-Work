require 'pry'

list = "1,1,1,2,2,2,3,3,3"


def uniques(list)

  #create an array from list splitting after every comma
  array = list.split(",")

  #initialized empty array
  output_array = []

    #copy first element of original array to output_array
    output_array << array.first

    #delete all duplicates of that first element
    array.delete_if do |element| 
      element == array.first
    end

    next_element = array.first

  output_array

end

uniques(list)
