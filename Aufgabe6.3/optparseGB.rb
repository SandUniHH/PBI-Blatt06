#!/usr/bin/env ruby
#
# Bocher Diedrich Sandmeier

require 'optparse'

def gb_option_parser(argv)

  options = GbOptions.new(nil,nil,false,false)
  opts = OptionParser.new

  opts.banner = "Usage: #$0 [options] inputfile"

  opts.on("--selecttop x,y,z", Array, 'specify at least one Genbank top level descriptor') do |ary|
    if ary.empty?() || !ary.all?() {|ele| ele.match(/LOCUS|DEFINITION|ORIGIN|FEATURES|ACCESSION|BASE COUNT/)}
      stderror(opts)
    end
    options.selecttop = ary
  end

  opts.on('-e', '--echo', 'use echo mode, cannot be used together with search mode') do
    options.echo = true
  end

  opts.on('-s', '--search [regexp]', 'use search mode using the given regular expression:
          --search <regexp>. Cannot be used together with echo mode') do |arg|
    options.search = Regexp.new(arg)
  end

  not_parsed = opts.parse(argv)

  if not_parsed.length != 1
    stderror(opts)
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