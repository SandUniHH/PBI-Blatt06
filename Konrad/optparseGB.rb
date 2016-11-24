#!/usr/bin/env ruby
#
# Bocher Diedrich Sandmeier

require "optparse"

GbOptions = Struct.new("GbOptions",:inputfilename,:selecttop,:echo,:search)

def gb_option_parser(argv)

  if (argv.inject(Hash.new(0)) {|akk,ele| akk[ele] += 1; akk }).any?() {|k,v| v != 1}
    exit 1
  end

  if argv.include?("--search") && argv.include?("--echo")
    exit 1
  end

  options = GbOptions.new(nil,nil,false,false)
  opts = OptionParser.new()
  opts.banner = "Usage : #{ $0} [options] inputfilename"
  opts.on("--selecttop x,y,z", Array) do |ary|
    if ary.empty?() || !ary.all?() {|ele| ele.match(/LOCUS|DEFINITION|ORIGIN|FEATURES|ACCESSION|BASE COUNT/)}
      exit 1
    end
    options.selecttop = ary
  end

  opts.on("--echo") do
    options.echo = true
  end

  opts.on("--search str", String) do |arg|
    options.search = Regexp.new(arg)
  end

  opts.on("--help") do
    puts opts.banner
  end
  rest = opts.parse(argv)
  if rest.length() != 1 || !File.exists?(rest[0]) 
    exit 1
  end
  options.inputfilename = rest[0]
  return options
end

if __FILE__ == $0
  options = gb_option_parser(ARGV)
  if not options.nil?
    puts options
  end
end