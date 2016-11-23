#!/bin/sh

set -e -x

./optparseGB.rb --selecttop ACCESSION --echo Library.gb
./optparseGB.rb --selecttop "BASE COUNT" --echo Library.gb
./optparseGB.rb --selecttop DEFINITION --echo Library.gb
./optparseGB.rb --selecttop FEATURES --echo Library.gb
./optparseGB.rb --selecttop LOCUS --echo Library.gb
./optparseGB.rb --selecttop LOCUS,DEFINITION --echo Library.gb
./optparseGB.rb --selecttop ORIGIN --echo Library.gb
./optparseGB.rb --selecttop ACCESSION --search NM_021964 Library.gb
./optparseGB.rb --selecttop "BASE COUNT" --search 986 Library.gb
./optparseGB.rb --selecttop DEFINITION --search MMP10 Library.gb
./optparseGB.rb --selecttop FEATURES --search Zinc-dependent Library.gb
./optparseGB.rb --selecttop LOCUS --search XM_006269 Library.gb
./optparseGB.rb --selecttop ORIGIN --search ctgatgttggtcacttc Library.gb
./optparseGB.rb --selecttop ORIGIN --search ctgatgttggtcacttc Library.gb
