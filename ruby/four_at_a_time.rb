def four_each(arr) 
  arr.each.with_index { |elem, num| 
    if num % 4 == 3
      print "#{elem}\n"
    else
      print "#{elem} "
    end
  }
end
def four_each_slice(arr)
  arr.each_slice(4) {|elems| print "#{elems}\n"}
end
a = (1..16).to_a
four_each(a)
four_each_slice(a)
