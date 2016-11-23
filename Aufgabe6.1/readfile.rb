#!/usr/bin/env ruby

# Bocher Diedrich Sandmeier

def readfile

  file = ''

  if ARGV.length != 1
    STDERR.puts "Usage: #{$0} Filename"
    exit 1
  end

  filename = ARGV[0]

  if File.exist?(filename)
    begin
      file = File.new(filename,'r')
    rescue => err
      STDERR.puts "Cannot open file #{filename}: #{err}"
      exit 1
    end
  else
    STDERR.puts "File #{filename} does not exist!"
    exit 1
  end

  return file

end