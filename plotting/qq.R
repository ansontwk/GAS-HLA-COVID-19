library(qqman)
library(data.table)
library(ggplot2)

#Input and Output
INPUT_PATH <- "/Users/ansontsui/Desktop/20230404/plotting/3.updatersid/"
OUTPUT_PATH <- "/Users/ansontsui/Desktop/20230404/plotting/6.QQ/"

#load data
csvfiles <- list.files(INPUT_PATH, pattern = ".csv", full.names = TRUE)

for (file in csvfiles){
    #setname
    name <- gsub(".assoc.fastGWA_FDR_corrected.csv_update_rsid.csv", "", basename(file))
    outputname <- paste0(OUTPUT_PATH, name, ".png")
    
    data <- fread(file)
    Pval <- data$P
    png(file=outputname)
    qq(data$P, xlim=c(0,7), ylim=c(0,7), main = name)
    dev.off()
 
}


