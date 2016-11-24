#!/usr/bin/env ruby
#
# Bocher Diedrich Sandmeier

require './readfile.rb'
require './fastaiterator.rb'

class CharDist
  
  def initialize
    @dist = Hash.new(0)    
    @total_chars = 0
  end
  
  def read_sequence(iterator)
    iterator.each{ |header, sequence|
      seq_formatted = sequence.join
      self.count_sequence(seq_formatted)
    }
  end

  def count_sequence(seq_formatted)
    seq_formatted.each_char{ |c|
      @dist[c] += 1
      @total_chars += 1
    }
  end

  def format
    @dist = @dist.sort_by { |k,v| v
        }
  end

  def output
    @dist.each{ |cc, count|
      printf("%s\t%d\t%.4f\n", cc, count, count.to_f / @total_chars)
    }
  end

end

############

file = readfile

iterator = FastaIterator.new(file)
chardist = CharDist.new

chardist.read_sequence(iterator)
chardist.format
chardist.output