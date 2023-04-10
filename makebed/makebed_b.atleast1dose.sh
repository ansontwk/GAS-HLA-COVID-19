#!/bin/bash

filepath="/home/tsuiwaikai/HLA/all_scenarios/df.b_atleast1dose/*.txt"

for FILE in $filepath
do   
    basename="$(basename -- ${FILE})"
    #echo "${basename}"
    #echo "${FILE}"
    #echo "${FILE%.txt}"
    plink --bfile /home/tsuiwaikai/HLA/data/chr6/chr6_afterQC --keep ${FILE} --make-bed --out /home/tsuiwaikai/HLA/data/output/b_atleast1dose/chr6_afterQC_${basename%.txt}
done    

