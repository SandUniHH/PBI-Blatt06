#!/usr/bin/env ruby

if ARGV.length != 3
  STDERR.puts "Usage: #{$0} <progname> [echo|search] <inputfilename>"
  exit 1
end

progname=ARGV[0]
doecho = nil
if ARGV[1] == "echo"
  doecho = true
elsif ARGV[1] == "search"
  doecho = false
else
  STDERR.puts "#{$0}: second argument must be search or echo"
  exit 1
end
inputfilename=ARGV[2]

search_regexp = {"LOCUS" => "XM_006269",
                 "DEFINITION" => "MMP10",
                 "ORIGIN" => "ctgatgttggtcacttc",
                 "FEATURES" => "Zinc-dependent",
                 "ACCESSION" => "NM_021964",
                 "BASE COUNT" => "986"
                }

search_regexp.keys.sort.each do |tli|
  regexp = search_regexp[tli]
  if tli.match(/\s/)
    tli = "\"#{tli}\""
  end
  if doecho
    puts "#{progname} --selecttop #{tli} --echo #{inputfilename}"
  else
    puts "#{progname} --selecttop #{tli} --search #{regexp} #{inputfilename}"
  end
end
