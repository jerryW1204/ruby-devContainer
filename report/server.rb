#! /usr/local/bin/ruby
# server.rb

require "socket"

def server s

  pp "Accept successfully" if s
  line = s.gets
  cmd, path, ver = line.split " "
  pp [cmd, path, ver]

  while line = s.gets
    pp line
    break if line == "\r\n"
  end

  if path == "/"
    s.print "Protocol 200 ok\r\n"
    s.print "Content-Type: text/html\r\n"
    s.print "\r\n"
    s.puts "<h1>Welcom!!</h1>"
  elsif path == "/api/now"
    s.print "Protocol 200 OK\r\n"
    s.print "Content-Type: application/json\r\n"
    s.print "\r\n"
    s.print "{"
    s.print '"time": "' + "#{Time.now}" + '"'
    s.print "}"
  elsif path == "/favicon.ico"
    icon = File.join(__dir__, "House.png")
    s.print "Protocol 200 ok\r\n"
    s.print "Content-Type: image/png\r\n"
    s.print "\r\n"
    if File.exist? icon
      File.open(icon, "rb") do |f|
        ico = f.read()
        s.print ico
      end
    end
  else
    file = path.slice 1..-1
    file = File.join(__dir__, file)
    if File.exist? file
      s.print "Protocol 200 ok\r\n"
      s.print "Content-Type: text/plain; charset=UTF-8\r\n"
      s.print "\r\n"
      File.open(file, "rb") do |f|
        while line = f.gets
          s.puts line
        end
      end
    else
      s.print "Protocol 404 NotFound\r\n"
      s.print "Content-Type: text/html\r\n"
      s.print "\r\n"
      s.print "<h1>"+path+"<h1>"
      s.print "Error: #{path} is not Found"
    end
  end
  s.close
end

port = '8080'
gs = TCPServer.open port
loop do
  pp "Waiting accept..."
  s = gs.accept
  Thread.new do
    server s
    sleep 10
  end
end
