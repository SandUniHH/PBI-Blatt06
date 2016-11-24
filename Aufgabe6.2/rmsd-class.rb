#!/usr/bin/env ruby
#
# Bocher Diedrich Sandmeier

class Array
  def rmsd(wvector)

    if !wvector.is_a?(Array)
      raise ArgumentError, "Argument must be an array\n"
    end
    if self.length() != wvector.length()
      raise ArgumentError, "Vectors must have the same length\n"
    end
    if self.any?() {|ele| ele.length() != self[0].length()}
      raise ArgumentError, "Vectors must have the same dimension\n"
    end
    if wvector.any?() {|ele| ele.length() != self[0].length()}
      raise ArgumentError, "Vectors must have the same dimension\n"
    end

    rmsd_squares = 0
    0.upto(self.length - 1) {|vector|
      0.upto(self[0].length - 1) { |dimension|
        rmsd_squares += ((self[vector][dimension] - wvector[vector][dimension]) ** 2)
        }
    }

    return Math.sqrt(rmsd_squares.to_f / self.size)
  end
end