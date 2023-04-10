#!/bin/bash

for i in {0000..0150}
do
        num="$i"
        python3 -m SNP2HLA --target /home/tsuiwaikai/HLA/data/output/bedbimfam/b_1dose/chr6_afterQC_df.b_1dose.$num\
        --reference /home/tsuiwaikai/HLA/masterfile/resources/1000G.bglv4\
        --out /home/tsuiwaikai/HLA/data/output/vcf/df.b_1dose/chr6_afterQC_df.b_1dose.$num.fyn --nthreads 6 --mem 20g
done 

