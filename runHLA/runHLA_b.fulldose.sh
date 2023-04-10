#!/bin/bash

for i in {0000..0099}
do
        num="$i"
        python3 -m SNP2HLA --target /home/tsuiwaikai/HLA/data/output/bedbimfam/b_fulldose/chr6_afterQC_df.b_fulldose.$num\
        --reference /home/tsuiwaikai/HLA/masterfile/resources/1000G.bglv4\
        --out /home/tsuiwaikai/HLA/data/output/vcf/df.b_fulldose/chr6_afterQC_df.b_fulldose.$num.fyn --nthreads 6 --mem 20g
done 
