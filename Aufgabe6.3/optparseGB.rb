#!/usr/bin/env ruby
#
# Bocher Diedrich Sandmeier

require 'optparse'

def gb_option_parser(argv)

  top_level_id_ary = ["LOCUS","DEFINITION","ORIGIN","FEATURES","ACCESSION","BASE COUNT"]

  options = GbOptions.new(nil,nil,false,false)
  opts = OptionParser.new

  opts.banner = "Usage: #$0 [options] inputfile"

  opts.on('-t', '--selecttop x,y,z', Array, 'specify at least one Genbank top level descriptor') do |ary|
    if !options.selecttop.nil?()
      stderror("--selecttop option duplicate found")
    end
    options.selecttop = []
    ary.each() {|ele|
      if !top_level_id_ary.include?(ele)
        stderror("--selecttop argument not found")
      end
      options.selecttop << ele
      ary.delete(ele)
    }
  end

  opts.on('-e', '--echo', 'use echo mode, cannot be used together with search mode') do
    if options.echo
      stderror("--echo option duplicate found")
    end
    if options.search.is_a?(Regexp)
      stderror("--search and --echo can not be parsed together")
    end
    options.echo = true
  end

  opts.on('-s', '--search [regexp]', 'use search mode using the given regular expression:
          --search <regexp>. Cannot be used together with echo mode') do |arg|
    if options.search
      stderror("--search option duplicate found")
    end
    if options.echo
      stderror("--search and --echo can not be parsed together")
    end
    options.search = Regexp.new(arg)
  end

  not_parsed = opts.parse(argv)

  if not_parsed.length() > 1
    stderror("Invalid options found!")
  end
  if not_parsed.length() == 0
    stderror("Filename argument not found!")
  end
  if !File.exists?(not_parsed[0])
    stderror("File does not exist!")
  end
  options.inputfilename = not_parsed[0]

  return options
end

def stderror(opts)
  STDERR.puts "#{$0}: \n#{opts.to_s}"
  exit 1
end

###########

GbOptions = Struct.new("GbOptions",:inputfilename,:selecttop,:echo,:search)

if __FILE__ == $0
  options = gb_option_parser(ARGV)
  if not options.nil?
    puts options
  end
end