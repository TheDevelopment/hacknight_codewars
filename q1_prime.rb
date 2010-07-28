#!/usr/bin/ruby


require "rubygems"
require "inline"

#Stolen from http://on-ruby.blogspot.com/2006/07/rubyinline-making-making-things-faster.html

class Primes
  inline do |builder|
    builder.c '
    int prime(int num) {
      int x;
      for (x = 2; x < (num - 1) ; x++) {
        if (num == 2) {
          return 1;
        }
        if (num % x == 0) {
          return x;
        }
      }
      return 1;
    }'
  end
end

p = Primes.new

prime_counter = 0
prime = 0
while prime_counter <= 10001 do
  prime += 1
  is_prime = p.prime(prime)
  if is_prime == 1
    puts "The #{prime_counter}th prime number is: #{prime}"
    prime_counter += 1
  end

end
puts prime

