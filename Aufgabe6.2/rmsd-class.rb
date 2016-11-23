#!/usr/bin/env ruby

# Bocher Diedrich Sandmeier

class Array
  def rmsd(wvector)
    if wvector.size != self.size
      raise 'Vectors do not have the same length!'
    end

    rmsd_squares = 0
    0.upto(self.length - 1) {|vector|
        rmsd_squares += ((self[vector][0] - wvector[vector][0]) ** 2)
        rmsd_squares += ((self[vector][1] - wvector[vector][1]) ** 2)
        rmsd_squares += ((self[vector][2] - wvector[vector][2]) ** 2)
    }

    return Math.sqrt(rmsd_squares.to_f / self.size)
  end
end