#!/usr/bin/env ruby

# Bocher Diedrich Sandmeier

# example usage:
#
# iterator = FastaIterator.new(file)
#
# iterator.each do |header, sequence|
#   seq_formatted = sequence.join.gsub(/(\w{70})/, "\\1\n")
#   puts header
#   puts seq_formatted
# end

class FastaIterator

  def initialize(file)
    @lines = file.readlines
  end

def each
    header = ''
    seq_list = []
    @lines.each_with_index {|line, i|
      if line.start_with?("\>")
          if !(header.empty?)
            yield header, seq_list
          end
          header = line.chomp!
          seq_list.clear
      else
          seq_list[i] = line.chomp!
      end
      }
    yield header, seq_list
  end

end