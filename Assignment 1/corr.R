function (directory, threshold = 0) 
{
    correlation <- NULL
    files <- dir(directory, pattern = "\\.csv", full.names = TRUE)
    tables <- lapply(files, read.csv)
    dat <- do.call(rbind, tables)
    dat <- na.omit(dat)
    filt <- data.frame()
    for (i in 1:332) {
        dat2 <- dat[which(dat$ID == i), ]
        if (nrow(dat2) > threshold) {
            filt <- rbind(filt, dat2)
            correlation <- c(correlation, cor(dat2[, 2], dat2[, 
                3]))
        }
    }
    correlation
}
