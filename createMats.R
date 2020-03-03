
# Time Series -> Correlations ---------------------------------------------

timeSeries <- readTimeSeries('inData/timeSeries')
writeCorMats(timeSeries2Corrs(timeSeries), 'outData/corMatsRaw')
corMats <- readCorMats('outData/corMatsRaw')
writeCorMats(corMats, 'outData/corMats')


# Adjacency Matrices ------------------------------------------------------

matFiles <- readCorMats('outData/corMats', Files = T)
matFiles <- unlist(matFiles, recursive = F, use.names = F)

mats <- create_mats(
    matFiles,
    modality = "fmri",
    threshold.by = "consensus",
    mat.thresh = thresholds,
    sub.thresh = subThresh,
    inds = indsFlat
)


# Write RDS ---------------------------------------------------------------

write_rds(mats, 'outData/RDS/mats.RDS')
