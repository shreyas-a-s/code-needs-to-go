#!/usr/bin/env bash

samtools faidx nelumbo-nucifera.fna
jbrowse add-assembly nelumbo-nucifera.fna --load copy --out nelumbo-nucifera
jbrowse sort-gff nelumbo-nucifera.gff | bgzip > nelumbo-nucifera.sorted.gff.gz
jbrowse add-track nelumbo-nucifera.sorted.gff.gz --load copy --out nelumbo-nucifera
cd nelumbo-nucifera
jbrowse text-index
