# lesson_6
# reader.rb

f = File.open("reader.rb", "r")

line = f.gets
puts line

line = f.gets
puts line

line = f.gets
puts line

# gets()一次读取文件中的一行数据
while line = f.gets() 
  puts line
end

f.close