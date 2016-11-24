#!/usr/bin/env ruby
#
# Bocher Diedrich Sandmeier

class FastaIterator
  def initialize(file)
    @filepath = file_exists?(file)
    @file = open_file()
  end

  def file_exists?(file)
    if !File.exists?(file)
      STDERR.puts "File #{file} does not exist !"
      exit 0
    end
    return file
  end

  def open_file()
    begin
      file = File.new(@filepath,"r")
    rescue => err
      STDERR.puts "Cannot open file #{@filepath}: #{err}"
      exit 1
    end
    return file
  end

  def each(&block)
    header = nil
    seq_list = []
    @file.each_line {|line|
      if line.match(/^>/)
        if !header.nil?()
          block.call(header,seq_list)
          seq_list.clear()
        end
        header = line.chomp()
      else
        seq_list << line.chomp()
      end
    }
    block.call(header,seq_list)
    @file.close()
  end

  private :file_exists?, :open_file

end