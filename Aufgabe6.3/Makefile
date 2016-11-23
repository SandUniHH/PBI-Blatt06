# Adjust this path to be the path of the parent directory of 
# Basic, Genbank, Restriction. The easiest way would be to copy the
# diretories into this directory and to set PBIDIR=.
PBIDIR=../../../../lectures/programmierung_in_der_bioinformatik

test:test-parser test-process

test-parser:gb-progs-calls.rb optparseGB.rb
	@./gb-progs-calls.rb 'env -i RUBYLIB=${PBIDIR} ./optparseGB.rb' "echo" Library.gb | sh -s | diff - optparseGB-echo.txt
	@./gb-progs-calls.rb 'env -i RUBYLIB=${PBIDIR} ./optparseGB.rb' "search" Library.gb | sh -s | diff - optparseGB-search.txt

test-process:gb-progs-calls.rb optparseGB.rb processGB.rb
	@./gb-progs-calls.rb 'env -i RUBYLIB=${PBIDIR} ./processGB.rb' search Library.gb | sh -s | diff - processGB-search.txt
