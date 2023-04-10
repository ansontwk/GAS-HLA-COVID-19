library(tidyverse)
library(data.table)
library(ggrepel)

thres_unadjP <- 0.001
thres_FDRP <- 0.1 #as suggested by yaning
thres_stringent_FDRP <- 0.05
thres_literature_FDRP <- 0.15

#Input and Output
INPUT_PATH <- "/Users/ansontsui/Desktop/20230404/plotting/3.updatersid/"
OUTPUT_PATH <- "/Users/ansontsui/Desktop/20230404/plotting/4.plots/"

#load data
csvfiles <- list.files(INPUT_PATH, pattern = ".csv", full.names = TRUE)
for (file in csvfiles){
    data <- fread(file)
    
    #add neglog
    #data$unadjusted_neglog10p <- -log10(data$P)
    data[, unadjusted_neglog10p := -log10(P)]
    #data$FDR_corrected_neglog10p <- -log10(data$FDR_corrected_P)
    data[, FDR_corrected_neglog10p := -log10(FDR_corrected_P)]

    #most sig SNP
    SigSNP_unadjP <- data[which.min(data$P),]
    SigSNP_FDRP <- data[which.min(data$FDR_corrected_P),]

    #unadjusted plot
    plot_unadjP <- ggplot(data, aes(x=as.numeric(POS/1000000), y = unadjusted_neglog10p)) + 
        geom_point(color = "grey") + 
        geom_hline(yintercept = -log10(thres_unadjP), linetype = 'dashed', colour="red") +
        #geom_text_repel(data = SigSNP_unadjP, aes(x=as.numeric(POS), y=unadjusted_neglog10p, label = SNP_map),
        #                hjust = 1.1, colour = "black", direction = "y", nudge_y = 0.5 ) + 
        labs(x="Chr 6 Pos (Mb)", y = "-log10(pvalue)", 
             title = paste0(strsplit(strsplit(basename(file), ".csv")[[1]], 
                                     ".assoc.fastGWA_FDR_corrected")[1], 
                            " Chr6 manhattan Plot")) + theme_classic()

    Unadjplot <- plot_unadjP + theme(legend.position = "none")

    #FDR corrected plot
    plot_FDR <- ggplot(data, aes(x=as.numeric(POS/1000000), y = FDR_corrected_neglog10p)) + 
        geom_point(color = "grey") + 
        geom_hline(yintercept = -log10(thres_FDRP), linetype = 'dashed', colour="red") +
        geom_hline(yintercept = -log10(thres_stringent_FDRP), linetype = 'dashed', colour="green") +
        geom_hline(yintercept = -log10(thres_literature_FDRP), linetype = 'dashed', colour="blue") +
        geom_text_repel(data = SigSNP_FDRP, aes(x=as.numeric(POS/1000000), y=FDR_corrected_neglog10p, label = SNP_map), 
                        hjust = 1.1, colour = "black", direction = "y", nudge_y = 0.5 ) +
        labs(x="Chr 6 Pos (Mb)", y = "-log10(FDR_pvalue)", 
             title = paste0(strsplit(strsplit(basename(file), ".csv")[[1]], 
                                     ".assoc.fastGWA_FDR_corrected")[1], 
                            " Chr6 manhattan Plot - FDR corrected")) + theme_classic()

    FDRplot <- plot_FDR + theme(legend.position = "none")
    
    #Get outputname
    outputname <- gsub(".csv", "", basename(file))
    
    #saving plots
    ggsave(file.path(OUTPUT_PATH, paste0(outputname, "_FDRadjusted_plot.png")), 
           FDRplot, 
           width = 10, height = 7, dpi = 300)
    ggsave(file.path(OUTPUT_PATH, paste0(outputname, "_unadjusted_plot.png")), 
           Unadjplot, 
           width = 10, height = 7, dpi = 300)

}

