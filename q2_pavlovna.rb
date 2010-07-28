require 'rubygems'
require 'ruby-debug'

book = File.read("question2.txt")
lines = book.split("\r\n")
lines_with_the_prince = []
lines.reverse.each do |line|
  if line =~ /Vasili/
    lines_with_the_prince << line
  end
end

lines_with_the_prince.each do |line|
  if line =~ /Pavlovna/
    puts line
    break
  end
end
