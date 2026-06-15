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

cmd = "\r\n"
pp cmd
sock.print cmd

while line = sock.gets
  puts line
end
