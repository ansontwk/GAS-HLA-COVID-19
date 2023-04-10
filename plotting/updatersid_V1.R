library(biomaRt)
library(data.table)

'%!in%' <- function(x,y)!('%in%'(x,y))

INPUT_PATH = "/Users/ansontsui/Desktop/20230404/plotting/2.adjustedcsv/"
OUTPUT_PATH = "/Users/ansontsui/Desktop/20230404/plotting/3.updatersid/"
all_files = list.files(INPUT_PATH, pattern = ".csv")

snp_mart = useMart(biomart="ENSEMBL_MART_SNP", 
                   host="grch37.ensembl.org", 
                   path="/biomart/martservice", 
                   dataset="hsapiens_snp")

thres = 1e-3

for(eachfile in all_files)
{
    dt = fread(paste0(INPUT_PATH,eachfile))
    dt$SNP_map = dt$SNP
    #dt = dt[dt$P<thres,]
    dt1 = dt[dt$SNP %like% 'chr' & dt$P < thres,]
    dt2 = dt[dt$SNP %!in% dt1$SNP,]
    
    
    for(j in 1:nrow(dt1))
    {
        print(j)
        pos_str = dt1[j,"POS"]$POS
        test <- getBM(attributes = c('refsnp_id','allele','chrom_start','chrom_strand'), 
                      filters = c('chr_name','start','end'), 
                      # values = list(6,28152410,33960860), # range(dt1$POS)
                      values = list(6,pos_str,pos_str),
                      mart = snp_mart)
        rsid = test$refsnp_id[1]
        
        if(length(rsid)!=0)    {
            
            dt1[j,"SNP_map"]=rsid
        }
        next
        
    }
    dt_update = rbind(dt1,dt2)
    fwrite(dt_update,file = paste0(OUTPUT_PATH, eachfile, "_update_rsid.csv"))
    
}
