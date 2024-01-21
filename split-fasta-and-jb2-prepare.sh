#!/usr/bin/env bash

### Source ###
# https://www.biostars.org/p/13270/#13281

file="$1"
filename_without_ext=$(basename "$file" | sed 's/\.[^.]*$//')

awk 'BEGIN {n_seq=0; num=0; max_size=2*1024*1024*1024;} /^>/ {if(n_seq%4000000000000==0 || size > max_size){file=sprintf("%s-%d.fa",substr(FILENAME,1,length(FILENAME)-4),num++); size=0;} print >> file; n_seq++; next;} { size+=length($0) + 1; print >> file; }' "$file"

find . -iname '*.fa' -exec samtools faidx \{\} \;

find . -iname '*.fa' -print0 | sort -z | xargs -0 -I {} sh -c "jbrowse add-assembly '{}' --load copy --out $filename_without_ext"

find . -maxdepth 1 -iname '*.fa' -exec rm {} \;
find . -maxdepth 1 -iname '*.fai' -exec rm {} \;

