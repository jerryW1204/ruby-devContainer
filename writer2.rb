# lesson_6
# writer2.rb

File.open"test2.txt", "w" do |f|
    puts "Hello, File I/O 2 !"
end

File.open"test2.txt", "w" do |f|
    f.puts "Hello, File I/O 2 !"
end

