function (directory, pollutant, id = 1:332) 
{
    files <- dir(directory, pattern = "\\.csv", full.names = TRUE)
    tables <- lapply(files, read.csv)
    dat <- do.call(rbind, tables)
    filt <- data.frame()
    for (i in id) {
        filt <- rbind(filt, dat[which(dat$ID == i), ])
    }
    mean(filt[, pollutant], na.rm = TRUE)
}
