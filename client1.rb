#! /usr/local/bin/ruby
# client1.rb

require 'socket'

host = 'www.is.kyusan-u.ac.jp'
port = 'http'
path = '/~toshi/'

sock = TCPSocket.new host, port
cmd = 'GET ' + path + " HTTP/1.0\r\n\r\n"
pp cmd
sock.print cmd

# is_body = false
# while line = sock.gets
#   if line == "<!DOCTYPE html>\n"
#     is_body = true
#   end
#   if is_body
#     puts line
#   end
# end

is_body = false
while line = sock.gets
  puts line if is_body
  is_body = true if line == "\r\n"
end