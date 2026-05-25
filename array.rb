
# ia = [1, 3, 5]
# sa = Array.new
# sa[0] = "Java"
# sa[1] = "Ruby"
# sa[2] = "C++"
# i=0
# while i<ia.length
#   print ia[i].to_s+","
#   i+=1
# end
# puts

# ia.each do |i|
#   print i.to_s + ","
# end
# puts

# xa = [1, 3.5, "Ruby", 5, [3,5]]
# xa.each_with_index do |i, idx|
#   p [i, idx]
# end

# z = [3, 5, 10, 7, 2, -2]
# zs = z.sort
# p z
# p zs
# p z.sort
# p z.min
# p z.max
# p z.sum

# def max x, y
#   if x>y
#     x
#   else
#     y
#   end
# end
def max x, y
  if x>y
    x
  else
    y
  end
  x # return x という
end

puts max 5, 10
puts max -3, -2
x = if 5>3
  "five"
else
  "three"
end
puts x