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

    akk = 0
    for i in (0..self.length()-1)
      for j in (0..self[0].length()-1)
        akk += (self[i][j] - wvector[i][j])**2
      end
    end

    return Math.sqrt((1.0/self.length()) * akk)

  end
end
