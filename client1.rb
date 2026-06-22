#! /usr/local/bin/ruby
# client1.rb

require 'socket'

host = 'www.is.kyusan-u.ac.jp'
port = 'http'
path = '/~toshi/'

# host1 = 'Host: ' + host + "\r\n\r\n" # v1
sock = TCPSocket.new host, port
# cmd = 'GET ' + path + " HTTP/1.1\r\n" + host1 # v1
# cmd = 'GET ' + path + " HTTP/1.1\r\n" # v2
# cmd = "GET #{path} HTTP/1.1\r\nHost: #{host}\r\n\r\n" # v3
# cmd = "GET #{path} HTTP/1.1\r\nHost: #{host}\r\nConnection: close\r\n\r\n" # v3_1解决进程等待request的现象
# cmd2 = 'Host: ' + host + "\r\n" # v2
# cmd_end = "\r\n" # v2
cmd = "GET #{path} HTTP/1.1\r\n" # v4_1
cmd += "Host: #{host}\r\n"  # v4_1
cmd += "Connection: close\r\n" # v4_1
cmd += "\r\n" # v4_1

pp cmd
sock.print cmd
# sock.print cmd2 # v2
# sock.print cmd_end # v2

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