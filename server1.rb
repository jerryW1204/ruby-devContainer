#! /usr/local/bin/ruby
# server1.rb

require 'socket'

def server s
  cmd, path, ver = s.gets.split " "
  pp [cmd, path, ver]
  # HTTP/1.0 として正しく返答
  # 1行目 HTTP/1.0 200 ok
  # 2行目 Content-Type: text/html
  # 3行目 空行
  # 4行目 コンテンツ
  # 最後　socketをclose
  if path == "/"
    s.print "HTTP/1.0 200 ok\r\n"
    s.print "Content-Type: text/html\r\n"
    s.print "\r\n"
    pp "INDEX"
    s.puts "<h1>index</hi>"
  else
    pp "OTHER"
    s.puts "other"
  end
  # while line = s.gets
  #   pp line
  #   s.puts line
  #   break if line == "\r\n"
  # end
  s.close
end

gs = TCPServer.open 'http'
loop do
  pp "start accept"
  s = gs.accept
  Thread.new do
    server s
  end
end

