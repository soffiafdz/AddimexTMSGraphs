

# Time Series -> Correlations ---------------------------------------------

# timeSeries <- readTimeSeries(
#     dirTMS = 'inData/TimeSeries/TMS/power264',
#     dirCTRL = 'inData/TimeSeries/Conn/power264'
# )
# writeCorMats(timeSeries2Corrs(timeSeries), 'outData/CorMatsRaw')
# corMats <- readCorMats('outData/CorMatsRaw', CTRL = T)
# writeCorMats(corMats, 'outData/CorMats')
# subMats(corMats, T, 'outData/subNets')

## Negative matrices
# corMatsNeg <- readCorMats('inData/CorMatsRaw', Neg = T)
# writeCorMats(corMatsNeg, 'outData/CorMatsNeg')
# subMats(corMatsNeg, T, 'inData/subNetsNeg')

# Adjacency Matrices ------------------------------------------------------
## Positive

mFiles <- readCorMats('outData/CorMats', Files = T, CTRL = T)

matsP <- create_mats(
    mFiles$hc_cu, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholds, sub.thresh = subThresh, inds = indsP
)

matsT0 <- create_mats(
    mFiles$t0, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholds, sub.thresh = subThresh, inds = inds1
)

matsT1 <- create_mats(
    mFiles$t1, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholds, sub.thresh = subThresh, inds = inds1
)

matsL10 <- create_mats(
    mFiles$pre, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholds, sub.thresh = subThresh, inds = inds2
)

matsL11 <- create_mats(
    mFiles$post, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholds, sub.thresh = subThresh, inds = inds2
)

matsL12 <- create_mats(
    mFiles$t2, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholds, sub.thresh = subThresh, inds = inds2
)

matsL20 <- create_mats(
    str_subset(mFiles$pre, paste(covars3$Study.ID, collapse = '|')),
    modality = modality, threshold.by = "consensus", mat.thresh = thresholds,
    sub.thresh = subThresh, inds = inds3
)

matsL20 <- create_mats(
    str_subset(mFiles$pre, paste(covars3$Study.ID, collapse = '|')),
    modality = modality, threshold.by = "consensus", mat.thresh = thresholds,
    sub.thresh = subThresh, inds = inds3
)

matsL21 <- create_mats(
    str_subset(mFiles$post, paste(covars3$Study.ID, collapse = '|')),
    modality = modality, threshold.by = "consensus", mat.thresh = thresholds,
    sub.thresh = subThresh, inds = inds3
)

matsL22 <- create_mats(
    str_subset(mFiles$t2, paste(covars3$Study.ID, collapse = '|')),
    modality = modality, threshold.by = "consensus", mat.thresh = thresholds,
    sub.thresh = subThresh, inds = inds3
)

matsL23 <- create_mats(
    str_subset(mFiles$t3, paste(covars3$Study.ID, collapse = '|')),
    modality = modality, threshold.by = "consensus", mat.thresh = thresholds,
    sub.thresh = subThresh, inds = inds3
)

## Negative

# mFilesWBneg <- readCorMats('inData/CorMatsNeg', Files = T)
# matsNgWBvs <- createMats(mFilesWBneg$hc_cu, inds_p, "consensus")
# matsNgWBt0 <- createMats(mFilesWBneg$t0, inds, "consensus")
# matsNgWBt1 <- createMats(mFilesWBneg$t1, inds, "consensus")
# matsNgWBtx0 <- createMats(mFilesWBneg$pre, inds2, "consensus")
# matsNgWBtx1 <- createMats(mFilesWBneg$post, inds2, "consensus")
# matsNgWBl0 <- createMats(
#     str_subset(
#         mFilesWBneg$pre,
#         paste(covars3$Study.ID, collapse = '|')
#     ),
#     inds3, "consensus"
# )
# matsNgWBl1 <- createMats(
#     str_subset(
#         mFilesWBneg$post,
#         paste(covars3$Study.ID, collapse = '|')
#     ),
#     inds3, "consensus"
# )
# matsNgWBl2 <- createMats(mFilesWBneg$t2, inds3, "consensus")


# Write RDS ---------------------------------------------------------------

write_rds(matsP, 'outData/RDS/matsP.RDS')
write_rds(matsT0, 'outData/RDS/matsT0.RDS')
write_rds(matsT1, 'outData/RDS/matsT1.RDS')
write_rds(matsL10, 'outData/RDS/matsL10.RDS')
write_rds(matsL11, 'outData/RDS/matsL11.RDS')
write_rds(matsL12, 'outData/RDS/matsL12.RDS')
write_rds(matsL20, 'outData/RDS/matsL20.RDS')
write_rds(matsL21, 'outData/RDS/matsL21.RDS')
write_rds(matsL22, 'outData/RDS/matsL22.RDS')
write_rds(matsL23, 'outData/RDS/matsL23.RDS')

# Read RDS ----------------------------------------------------------------

matsP <- read_rds('outData/RDS/matsP.RDS')
matsT0 <- read_rds('outData/RDS/matsT0.RDS')
matsT1 <- read_rds('outData/RDS/matsT1.RDS')
matsL10 <- read_rds('outData/RDS/matsL10.RDS')
matsL11 <- read_rds('outData/RDS/matsL11.RDS')
matsL12 <- read_rds('outData/RDS/matsL12.RDS')
matsL20 <- read_rds('outData/RDS/matsL20.RDS')
matsL21 <- read_rds('outData/RDS/matsL21.RDS')
matsL22 <- read_rds('outData/RDS/matsL22.RDS')
matsL23 <- read_rds('outData/RDS/matsL23.RDS')
