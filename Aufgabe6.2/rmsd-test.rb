#!/usr/bin/env ruby

require "./rmsd-class.rb"

def random_vector_new(rg,dim,len)
  vector = Array.new()
  len.times do
    coords = Array.new()
    dim.times do
      coords.push(10 + (rg.rand * 90).floor)
    end
    vector.push(coords)
  end
  return vector
end

len = 4
dim = 3
seed = 4487986067719198245668889575043556649
rg = Random.new(seed)
5.times do
  vvector = random_vector_new(rg,dim,len)
  6.times do
    wvector = random_vector_new(rg,dim,len)
    begin
      printf("rmsd(#{vvector},\n     #{wvector})=%.3f\n",vvector.rmsd(wvector))
    rescue => err
      STDERR.puts "#{$0}: #{err}"
      exit 1
    end
  end
end
