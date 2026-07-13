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
  elsif path == "/api/now"
    s.print "HTTP/1.0 200 OK\r\n"
    s.print "Content-Type: application/json\r\n"
    s.print "\r\n"
    s.print "{"
    s.print '"time": "' + "#{Time.now}" + '"'
    s.print "}"
  else
    file = path.slice 1..-1
    if File.exist? file
      s.print "HTTP/1.0 200 ok\r\n"
      s.print "Content-Type: text/plain; charset=UTF-8\r\n"
      s.print "\r\n"
      File.open(file, "r") do |f|
        while line = f.gets
          s.puts line
        end
      end
    else
      s.print "HTTP/1.0 404 NotFound\r\n"
      s.print "Content-Type: text/html\r\n"
      s.print "\r\n"
      s.print "<h1>"+path+"<h1>"
      s.print "File not Found"
    end

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

