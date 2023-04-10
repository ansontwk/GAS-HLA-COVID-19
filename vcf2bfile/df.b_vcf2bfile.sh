#!/bin/bash


for i in {0000..0150}
do
    num="$i"
    plink2 \
    --vcf ~/HLA/data/output/vcf/df.b_atleast1dose/chr6_afterQC_df.b_atleast1dose.$num.fyn.bgl.phased.vcf.gz \
    --fam ~/HLA/data/output/b_atleast1dose/chr6_afterQC_df.b_atleast1dose.$num.fam \
    --make-bed \
    --out ~/HLA/data/output/vcf2bfile/b_atleast1dose/df.b_atleast1dose_vcf2bfile.$num

done

for i in {0000..0150}
do
    num="$i"
    plink2 \
    --vcf ~/HLA/data/output/vcf/df.b_1dose/chr6_afterQC_df.b_1dose.$num.fyn.bgl.phased.vcf.gz \
    --fam ~/HLA/data/output/bedbimfam/b_1dose/chr6_afterQC_df.b_1dose.$num.fam \
    --make-bed \
    --out ~/HLA/data/output/vcf2bfile/unmerged/b_1dose/df.b_1dose_vcf2bfile.$num

done

for i in {0000..0099}
do
    num="$i"
    plink2 \
    --vcf ~/HLA/data/output/vcf/df.b_fulldose/chr6_afterQC_df.b_fulldose.$num.fyn.bgl.phased.vcf.gz \
    --fam ~/HLA/data/output/bedbimfam/b_fulldose/chr6_afterQC_df.b_fulldose.$num.fam \
    --make-bed \
    --out ~/HLA/data/output/vcf2bfile/unmerged/b_fulldose/df.b_fulldose_vcf2bfile.$num

done
