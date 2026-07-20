#! /usr/local/bin/ruby
# server.rb

require "socket"

def server s

  pp "Accept successfully" if s
  cmd, path, ver = s.gets.split " "
  pp [cmd, path, ver]
  if path == "/"
    s.print "HTTP/1.0 200 ok\r\n"
    s.print "Content-Type: text/html\r\n"
    s.print "\r\n"
    s.puts "<h1>index</h1>"
  else
    s.print "HTTP/1.0 200 ok\r\n"
    s.print "Content-Type: text/html\r\n"
    s.print "\r\n"
    s.puts "Error: #{path} is not found"
  end
  s.close
end

host = 'localhost'
port = '8080'
gs = TCPServer.new host, port
loop do
  pp "Waiting accept..."
  s = gs.accept
  Thread.new do
    server s
  end
end
