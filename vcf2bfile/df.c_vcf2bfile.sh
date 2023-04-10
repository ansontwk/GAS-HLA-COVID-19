#!/bin/bash

for i in {0000..0150}
do
    num="$i"
    plink2 \
    --vcf ~/HLA/data/output/vcf/df.c_1dose/chr6_afterQC_df.c_1dose.$num.fyn.bgl.phased.vcf.gz \
    --fam ~/HLA/data/output/bedbimfam/c_1dose/chr6_afterQC_df.c_1dose.$num.fam \
    --make-bed \
    --out ~/HLA/data/output/vcf2bfile/unmerged/c_1dose/df.c_1dose_vcf2bfile.$num

done

for i in {0000..0150}
do
    num="$i"
    plink2 \
    --vcf ~/HLA/data/output/vcf/df.c_atleast1dose/chr6_afterQC_df.c_atleast1dose.$num.fyn.bgl.phased.vcf.gz \
    --fam ~/HLA/data/output/bedbimfam/c_atleast1dose/chr6_afterQC_df.c_atleast1dose.$num.fam \
    --make-bed \
    --out ~/HLA/data/output/vcf2bfile/unmerged/c_atleast1dose/df.c_atleast1dose_vcf2bfile.$num

done

for i in {0000..0099}
do
    num="$i"
    plink2 \
    --vcf ~/HLA/data/output/vcf/df.c_fulldose/chr6_afterQC_df.c_fulldose.$num.fyn.bgl.phased.vcf.gz \
    --fam ~/HLA/data/output/bedbimfam/c_fulldose/chr6_afterQC_df.c_fulldose.$num.fam \
    --make-bed \
    --out ~/HLA/data/output/vcf2bfile/unmerged/c_fulldose/df.c_fulldose_vcf2bfile.$num

