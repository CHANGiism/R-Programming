function (directory, id = 1:332) 
{
    files <- dir(directory, pattern = "\\.csv", full.names = TRUE)
    tables <- lapply(files, read.csv)
    dat <- do.call(rbind, tables)
    dat <- na.omit(dat)
    filt <- data.frame()
    for (i in id) {
        filt <- rbind(filt, c(i, nrow(dat[which(dat$ID == i), 
            ])))
    }
    colnames(filt) <- c("id", "nobs")
    filt
}
