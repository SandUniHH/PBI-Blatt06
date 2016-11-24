#!/usr/bin/env ruby
#
# Bocher Diedrich Sandmeier
require "./FastaIterator.rb"

if ARGV.length != 1
  STDERR.puts "Usage : #{$0} <fasta file>"
  exit 0
end

fi = FastaIterator.new(ARGV[0])
list = Hash.new(0)
fi.each() {|header,sequence|
  sequence.each() {|line| 
    line.each_char() {|chr| 
      list[chr] += 1 } } }
list = list.sort_by() {|cc,count| count}
nchars = list.inject(0) {|akk,(cc,count)| akk += count}
list.each() {|cc,count| printf("%c\t%d\t%.4f\n",cc,count,(count.to_f()/nchars)) }
