#! /usr/bin/env ruby
test = "Hello, World!"
puts test
a = 5
s = "Ruby"
c = 3.14
puts "a:"+a.to_s
puts "s:"+s
puts c

if a>5
  puts "Large"
else 
  if a<0
    puts "Negative"
  else
    puts "Little"
  end
end
if a>5
  puts "Large"
elsif a<0
  puts "Negative"
else
  puts "Little"
end

x = 5
while x>0
  print "@"
  x-=1
end
puts
x = 5
5.times do
  print "#"
end
puts
x.times do
  print "#"
end
puts
5.times do |i|
  print "#"+i.to_s
end
puts