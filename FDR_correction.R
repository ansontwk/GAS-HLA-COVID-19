INPUT_PATH <- "/Users/ansontsui/Desktop/20230404/plotting/1.csv/"
OUTPUT_PATH <- "/Users/ansontsui/Desktop/20230404/plotting/2.adjustedcsv/"


csvfiles <- list.files(path=INPUT_PATH, pattern = "\\.csv$", recursive = TRUE)


for (file in csvfiles) {
    dat <- read.csv(file)
    unadjP <- dat[,13]
    adjP <- p.adjust(unadjP, method = "BH", n =length(unadjP))
    
    dat$FDR_corrected_P <- adjP
    write.csv(dat, file = file.path(OUTPUT_PATH, 
                               paste0(tools::file_path_sans_ext(basename(file)), "_FDR_corrected.csv")), 
              row.names = FALSE)
} 
