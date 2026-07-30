#! /usr/local/bin/ruby
# client.rb

require "socket"

host = "localhost"
port = "8080"
path = ARGV[0]
if path ==  nil
  path = '/'
end

s = TCPSocket.new host, port

cmd = "GET #{path} Protocol\r\n"
cmd += "Host: #{host}\r\n"
cmd += "Connection: close\r\n"
cmd += "\r\n"
# pp cmd
s.print cmd

is_body = false
while line = s.gets
  puts line if is_body
  is_body = true if line == "\r\n"
end
s.close