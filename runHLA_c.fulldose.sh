#!/bin/bash

for i in {0000..0099}
do
        num="$i"
        python3 -m SNP2HLA --target /home/tsuiwaikai/HLA/data/output/bedbimfam/c_fulldose/chr6_afterQC_df.c_fulldose.$num\
        --reference /home/tsuiwaikai/HLA/masterfile/resources/1000G.bglv4\
        --out /home/tsuiwaikai/HLA/data/output/vcf/df.c_fulldose/chr6_afterQC_df.c_fulldose.$num.fyn --nthreads 6 --mem 20g
done 