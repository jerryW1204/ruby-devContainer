#! /usr/local/bin/ruby
# server1.rb

require 'socket'

def server s
  # pp s.gets
  cmd, path, ver = s.gets.split " " # 基于空格分割字符
  if path == "/"
    pp "INDEX" 
    s.puts "index"
  else
    pp "OTHER"
    s.puts "other"
  end
  s.close
end

gs = TCPServer.open 'http'
loop do
  pp "start accept"
  s = gs.accept
  Thread.new do
    server s
    # sleep 10 # 10s
  end
end

