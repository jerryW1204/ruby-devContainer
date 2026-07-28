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
    s.print "HTTP/1.0 200 ok\r\n"
    s.print "Content-Type: text/html\r\n"
    s.print "\r\n"
    s.puts "<h1>index</h1>"
  elsif path == "/favicon.ico"
    s.print "HTTP/1.0 200 ok\r\n"
    s.print "Content-Type: image/x-icon\r\n"
    s.print "\r\n"
    # if file.exist?("favicon.ico")
    #   file.open("favicon.ico", "rb") do |f|
    #     ico = f.read()
    #     s.print ico
    #   end
    # end
  else
    s.print "HTTP/1.0 404 Not Found\r\n"
    s.print "Content-Type: text/html\r\n"
    s.print "\r\n"
    s.puts "Error: #{path} is not found"
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
