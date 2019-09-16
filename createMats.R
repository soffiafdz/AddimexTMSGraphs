
# Time Series -> Correlations ---------------------------------------------

# timeSeries <- readTimeSeries(
#     dirTMS = 'inData/TimeSeries/TMS/power264',
#     dirCTRL = 'inData/TimeSeries/Conn/power264'
# )
# writeCorMats(timeSeries2Corrs(timeSeries), 'outData/CorMatsRaw')
corMats <- readCorMats('outData/CorMatsRaw', CTRL = T)
# writeCorMats(corMats, 'outData/CorMats')


# Adjacency Matrices ------------------------------------------------------
## Positive

# mFiles <- readCorMats('outData/CorMats', Files = T, CTRL = T)
#
# matsP <- create_mats(
#     mFiles$hc_cu, modality = modality, threshold.by = "consensus",
#     mat.thresh = thresholds, sub.thresh = subThresh, inds = indsP
# )
#
# matsT0 <- create_mats(
#     mFiles$t0, modality = modality, threshold.by = "consensus",
#     mat.thresh = thresholds, sub.thresh = subThresh, inds = inds1
# )
#
# matsT1 <- create_mats(
#     mFiles$t1, modality = modality, threshold.by = "consensus",
#     mat.thresh = thresholds, sub.thresh = subThresh, inds = inds1
# )
#
# matsL10 <- create_mats(
#     mFiles$pre, modality = modality, threshold.by = "consensus",
#     mat.thresh = thresholds, sub.thresh = subThresh, inds = inds2
# )
#
# matsL11 <- create_mats(
#     mFiles$post, modality = modality, threshold.by = "consensus",
#     mat.thresh = thresholds, sub.thresh = subThresh, inds = inds2
# )
#
# matsL12 <- create_mats(
#     mFiles$t2, modality = modality, threshold.by = "consensus",
#     mat.thresh = thresholds, sub.thresh = subThresh, inds = inds2
# )
#
# matsL20 <- create_mats(
#     str_subset(mFiles$pre, paste(covars3$Study.ID, collapse = '|')),
#     modality = modality, threshold.by = "consensus", mat.thresh = thresholds,
#     sub.thresh = subThresh, inds = inds3
# )
#
# matsL20 <- create_mats(
#     str_subset(mFiles$pre, paste(covars3$Study.ID, collapse = '|')),
#     modality = modality, threshold.by = "consensus", mat.thresh = thresholds,
#     sub.thresh = subThresh, inds = inds3
# )
#
# matsL21 <- create_mats(
#     str_subset(mFiles$post, paste(covars3$Study.ID, collapse = '|')),
#     modality = modality, threshold.by = "consensus", mat.thresh = thresholds,
#     sub.thresh = subThresh, inds = inds3
# )
#
# matsL22 <- create_mats(
#     str_subset(mFiles$t2, paste(covars3$Study.ID, collapse = '|')),
#     modality = modality, threshold.by = "consensus", mat.thresh = thresholds,
#     sub.thresh = subThresh, inds = inds3
# )
#
# matsL23 <- create_mats(
#     str_subset(mFiles$t3, paste(covars3$Study.ID, collapse = '|')),
#     modality = modality, threshold.by = "consensus", mat.thresh = thresholds,
#     sub.thresh = subThresh, inds = inds3
# )


# Subnetworks -------------------------------------------------------------

subMats(corMats, T, 'outData/subNets')
thresholdsSubNets <- thresholds[1:12]


#### CON ####
mFilesCON <- readCorMats('outData/subNets/CON', Files = T, CTRL = T)
matsCONp <- create_mats(
    mFilesCON$hc_cu, modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = indsP
)
matsCONt0 <- create_mats(
    mFilesCON$t0, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds1
)
matsCONt1 <- create_mats(
    mFilesCON$t1, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds1
)
matsCONl10 <- create_mats(
    mFilesCON$pre, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds2
)

matsCONl11 <- create_mats(
    mFilesCON$post, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds2
)

matsCONl12 <- create_mats(
    mFilesCON$t2, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds2
)

matsCONl20 <- create_mats(
    str_subset(mFilesCON$pre, paste(covars3$Study.ID, collapse = '|')),
    modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets,
    sub.thresh = subThresh, inds = inds3
)

matsCONl21 <- create_mats(
    str_subset(mFilesCON$post, paste(covars3$Study.ID, collapse = '|')),
    modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets,
    sub.thresh = subThresh, inds = inds3
)

matsCONl22 <- create_mats(
    str_subset(mFilesCON$t2, paste(covars3$Study.ID, collapse = '|')),
    modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets,
    sub.thresh = subThresh, inds = inds3
)

matsCONl23 <- create_mats(
    str_subset(mFilesCON$t3, paste(covars3$Study.ID, collapse = '|')),
    modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets,
    sub.thresh = subThresh, inds = inds3
)


#### DAN ####
mFilesDAN <- readCorMats('outData/subNets/DAN', Files = T, CTRL = T)
matsDANp <- create_mats(
    mFilesDAN$hc_cu, modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = indsP
)
matsDANt0 <- create_mats(
    mFilesDAN$t0, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds1
)
matsDANt1 <- create_mats(
    mFilesDAN$t1, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds1
)
matsDANl10 <- create_mats(
    mFilesDAN$pre, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds2
)

matsDANl11 <- create_mats(
    mFilesDAN$post, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds2
)

matsDANl12 <- create_mats(
    mFilesDAN$t2, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds2
)

matsDANl20 <- create_mats(
    str_subset(mFilesDAN$pre, paste(covars3$Study.ID, collapse = '|')),
    modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets,
    sub.thresh = subThresh, inds = inds3
)

matsDANl21 <- create_mats(
    str_subset(mFilesDAN$post, paste(covars3$Study.ID, collapse = '|')),
    modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets,
    sub.thresh = subThresh, inds = inds3
)

matsDANl22 <- create_mats(
    str_subset(mFilesDAN$t2, paste(covars3$Study.ID, collapse = '|')),
    modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets,
    sub.thresh = subThresh, inds = inds3
)

matsDANl23 <- create_mats(
    str_subset(mFilesDAN$t3, paste(covars3$Study.ID, collapse = '|')),
    modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets,
    sub.thresh = subThresh, inds = inds3
)


#### DMN ####
mFilesDMN <- readCorMats('outData/subNets/DMN', Files = T, CTRL = T)
matsDMNp <- create_mats(
    mFilesDMN$hc_cu, modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = indsP
)
matsDMNt0 <- create_mats(
    mFilesDMN$t0, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds1
)
matsDMNt1 <- create_mats(
    mFilesDMN$t1, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds1
)
matsDMNl10 <- create_mats(
    mFilesDMN$pre, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds2
)

matsDMNl11 <- create_mats(
    mFilesDMN$post, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds2
)

matsDMNl12 <- create_mats(
    mFilesDMN$t2, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds2
)

matsDMNl20 <- create_mats(
    str_subset(mFilesDMN$pre, paste(covars3$Study.ID, collapse = '|')),
    modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets,
    sub.thresh = subThresh, inds = inds3
)

matsDMNl21 <- create_mats(
    str_subset(mFilesDMN$post, paste(covars3$Study.ID, collapse = '|')),
    modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets,
    sub.thresh = subThresh, inds = inds3
)

matsDMNl22 <- create_mats(
    str_subset(mFilesDMN$t2, paste(covars3$Study.ID, collapse = '|')),
    modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets,
    sub.thresh = subThresh, inds = inds3
)

matsDMNl23 <- create_mats(
    str_subset(mFilesDMN$t3, paste(covars3$Study.ID, collapse = '|')),
    modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets,
    sub.thresh = subThresh, inds = inds3
)


#### FPN ####
mFilesFPN <- readCorMats('outData/subNets/FPN', Files = T, CTRL = T)
matsFPNp <- create_mats(
    mFilesFPN$hc_cu, modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = indsP
)
matsFPNt0 <- create_mats(
    mFilesFPN$t0, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds1
)
matsFPNt1 <- create_mats(
    mFilesFPN$t1, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds1
)
matsFPNl10 <- create_mats(
    mFilesFPN$pre, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds2
)

matsFPNl11 <- create_mats(
    mFilesFPN$post, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds2
)

matsFPNl12 <- create_mats(
    mFilesFPN$t2, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds2
)

matsFPNl20 <- create_mats(
    str_subset(mFilesFPN$pre, paste(covars3$Study.ID, collapse = '|')),
    modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets,
    sub.thresh = subThresh, inds = inds3
)

matsFPNl21 <- create_mats(
    str_subset(mFilesFPN$post, paste(covars3$Study.ID, collapse = '|')),
    modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets,
    sub.thresh = subThresh, inds = inds3
)

matsFPNl22 <- create_mats(
    str_subset(mFilesFPN$t2, paste(covars3$Study.ID, collapse = '|')),
    modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets,
    sub.thresh = subThresh, inds = inds3
)

matsFPNl23 <- create_mats(
    str_subset(mFilesFPN$t3, paste(covars3$Study.ID, collapse = '|')),
    modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets,
    sub.thresh = subThresh, inds = inds3
)


#### SAL ####
mFilesSAL <- readCorMats('outData/subNets/SAL', Files = T, CTRL = T)
matsSALp <- create_mats(
    mFilesSAL$hc_cu, modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = indsP
)
matsSALt0 <- create_mats(
    mFilesSAL$t0, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds1
)
matsSALt1 <- create_mats(
    mFilesSAL$t1, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds1
)
matsSALl10 <- create_mats(
    mFilesSAL$pre, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds2
)

matsSALl11 <- create_mats(
    mFilesSAL$post, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds2
)

matsSALl12 <- create_mats(
    mFilesSAL$t2, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds2
)

matsSALl20 <- create_mats(
    str_subset(mFilesSAL$pre, paste(covars3$Study.ID, collapse = '|')),
    modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets,
    sub.thresh = subThresh, inds = inds3
)

matsSALl21 <- create_mats(
    str_subset(mFilesSAL$post, paste(covars3$Study.ID, collapse = '|')),
    modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets,
    sub.thresh = subThresh, inds = inds3
)

matsSALl22 <- create_mats(
    str_subset(mFilesSAL$t2, paste(covars3$Study.ID, collapse = '|')),
    modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets,
    sub.thresh = subThresh, inds = inds3
)

matsSALl23 <- create_mats(
    str_subset(mFilesSAL$t3, paste(covars3$Study.ID, collapse = '|')),
    modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets,
    sub.thresh = subThresh, inds = inds3
)


#### SUB ####
mFilesSUB <- readCorMats('outData/subNets/SUB', Files = T, CTRL = T)
matsSUBp <- create_mats(
    mFilesSUB$hc_cu, modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = indsP
)
matsSUBt0 <- create_mats(
    mFilesSUB$t0, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds1
)
matsSUBt1 <- create_mats(
    mFilesSUB$t1, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds1
)
matsSUBl10 <- create_mats(
    mFilesSUB$pre, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds2
)

matsSUBl11 <- create_mats(
    mFilesSUB$post, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds2
)

matsSUBl12 <- create_mats(
    mFilesSUB$t2, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds2
)

matsSUBl20 <- create_mats(
    str_subset(mFilesSUB$pre, paste(covars3$Study.ID, collapse = '|')),
    modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets,
    sub.thresh = subThresh, inds = inds3
)

matsSUBl21 <- create_mats(
    str_subset(mFilesSUB$post, paste(covars3$Study.ID, collapse = '|')),
    modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets,
    sub.thresh = subThresh, inds = inds3
)

matsSUBl22 <- create_mats(
    str_subset(mFilesSUB$t2, paste(covars3$Study.ID, collapse = '|')),
    modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets,
    sub.thresh = subThresh, inds = inds3
)

matsSUBl23 <- create_mats(
    str_subset(mFilesSUB$t3, paste(covars3$Study.ID, collapse = '|')),
    modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets,
    sub.thresh = subThresh, inds = inds3
)


#### VAN ####
mFilesVAN <- readCorMats('outData/subNets/VAN', Files = T, CTRL = T)
matsVANp <- create_mats(
    mFilesVAN$hc_cu, modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = indsP
)
matsVANt0 <- create_mats(
    mFilesVAN$t0, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds1
)
matsVANt1 <- create_mats(
    mFilesVAN$t1, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds1
)
matsVANl10 <- create_mats(
    mFilesVAN$pre, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds2
)

matsVANl11 <- create_mats(
    mFilesVAN$post, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds2
)

matsVANl12 <- create_mats(
    mFilesVAN$t2, modality = modality, threshold.by = "consensus",
    mat.thresh = thresholdsSubNets, sub.thresh = subThresh, inds = inds2
)

matsVANl20 <- create_mats(
    str_subset(mFilesVAN$pre, paste(covars3$Study.ID, collapse = '|')),
    modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets,
    sub.thresh = subThresh, inds = inds3
)

matsVANl21 <- create_mats(
    str_subset(mFilesVAN$post, paste(covars3$Study.ID, collapse = '|')),
    modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets,
    sub.thresh = subThresh, inds = inds3
)

matsVANl22 <- create_mats(
    str_subset(mFilesVAN$t2, paste(covars3$Study.ID, collapse = '|')),
    modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets,
    sub.thresh = subThresh, inds = inds3
)

matsVANl23 <- create_mats(
    str_subset(mFilesVAN$t3, paste(covars3$Study.ID, collapse = '|')),
    modality = modality, threshold.by = "consensus", 
    mat.thresh = thresholdsSubNets,
    sub.thresh = subThresh, inds = inds3
)


# Write RDS ---------------------------------------------------------------
# 
# write_rds(matsP, 'outData/RDS/matsP.RDS')
# write_rds(matsT0, 'outData/RDS/matsT0.RDS')
# write_rds(matsT1, 'outData/RDS/matsT1.RDS')
# write_rds(matsL10, 'outData/RDS/matsL10.RDS')
# write_rds(matsL11, 'outData/RDS/matsL11.RDS')
# write_rds(matsL12, 'outData/RDS/matsL12.RDS')
# write_rds(matsL20, 'outData/RDS/matsL20.RDS')
# write_rds(matsL21, 'outData/RDS/matsL21.RDS')
# write_rds(matsL22, 'outData/RDS/matsL22.RDS')
# write_rds(matsL23, 'outData/RDS/matsL23.RDS')

# CON
write_rds(matsCONp, 'outData/RDS/matsCONp.RDS')
write_rds(matsCONt0, 'outData/RDS/matsCONt0.RDS')
write_rds(matsCONt1, 'outData/RDS/matsCONt1.RDS')
write_rds(matsCONl10, 'outData/RDS/matsCONl10.RDS')
write_rds(matsCONl11, 'outData/RDS/matsCONl11.RDS')
write_rds(matsCONl12, 'outData/RDS/matsCONl12.RDS')
write_rds(matsCONl20, 'outData/RDS/matsCONl20.RDS')
write_rds(matsCONl21, 'outData/RDS/matsCONl21.RDS')
write_rds(matsCONl22, 'outData/RDS/matsCONl22.RDS')
write_rds(matsCONl23, 'outData/RDS/matsCONl23.RDS')

# DAN
write_rds(matsDANp, 'outData/RDS/matsDANp.RDS')
write_rds(matsDANt0, 'outData/RDS/matsDANt0.RDS')
write_rds(matsDANt1, 'outData/RDS/matsDANt1.RDS')
write_rds(matsDANl10, 'outData/RDS/matsDANl10.RDS')
write_rds(matsDANl11, 'outData/RDS/matsDANl11.RDS')
write_rds(matsDANl12, 'outData/RDS/matsDANl12.RDS')
write_rds(matsDANl20, 'outData/RDS/matsDANl20.RDS')
write_rds(matsDANl21, 'outData/RDS/matsDANl21.RDS')
write_rds(matsDANl22, 'outData/RDS/matsDANl22.RDS')
write_rds(matsDANl23, 'outData/RDS/matsDANl23.RDS')

# DMN
write_rds(matsDMNp, 'outData/RDS/matsDMNp.RDS')
write_rds(matsDMNt0, 'outData/RDS/matsDMNt0.RDS')
write_rds(matsDMNt1, 'outData/RDS/matsDMNt1.RDS')
write_rds(matsDMNl10, 'outData/RDS/matsDMNl10.RDS')
write_rds(matsDMNl11, 'outData/RDS/matsDMNl11.RDS')
write_rds(matsDMNl12, 'outData/RDS/matsDMNl12.RDS')
write_rds(matsDMNl20, 'outData/RDS/matsDMNl20.RDS')
write_rds(matsDMNl21, 'outData/RDS/matsDMNl21.RDS')
write_rds(matsDMNl22, 'outData/RDS/matsDMNl22.RDS')
write_rds(matsDMNl23, 'outData/RDS/matsDMNl23.RDS')

# FPN
write_rds(matsFPNp, 'outData/RDS/matsFPNp.RDS')
write_rds(matsFPNt0, 'outData/RDS/matsFPNt0.RDS')
write_rds(matsFPNt1, 'outData/RDS/matsFPNt1.RDS')
write_rds(matsFPNl10, 'outData/RDS/matsFPNl10.RDS')
write_rds(matsFPNl11, 'outData/RDS/matsFPNl11.RDS')
write_rds(matsFPNl12, 'outData/RDS/matsFPNl12.RDS')
write_rds(matsFPNl20, 'outData/RDS/matsFPNl20.RDS')
write_rds(matsFPNl21, 'outData/RDS/matsFPNl21.RDS')
write_rds(matsFPNl22, 'outData/RDS/matsFPNl22.RDS')
write_rds(matsFPNl23, 'outData/RDS/matsFPNl23.RDS')

# SAL
write_rds(matsSALp, 'outData/RDS/matsSALp.RDS')
write_rds(matsSALt0, 'outData/RDS/matsSALt0.RDS')
write_rds(matsSALt1, 'outData/RDS/matsSALt1.RDS')
write_rds(matsSALl10, 'outData/RDS/matsSALl10.RDS')
write_rds(matsSALl11, 'outData/RDS/matsSALl11.RDS')
write_rds(matsSALl12, 'outData/RDS/matsSALl12.RDS')
write_rds(matsSALl20, 'outData/RDS/matsSALl20.RDS')
write_rds(matsSALl21, 'outData/RDS/matsSALl21.RDS')
write_rds(matsSALl22, 'outData/RDS/matsSALl22.RDS')
write_rds(matsSALl23, 'outData/RDS/matsSALl23.RDS')

# SUB
write_rds(matsSUBp, 'outData/RDS/matsSUBp.RDS')
write_rds(matsSUBt0, 'outData/RDS/matsSUBt0.RDS')
write_rds(matsSUBt1, 'outData/RDS/matsSUBt1.RDS')
write_rds(matsSUBl10, 'outData/RDS/matsSUBl10.RDS')
write_rds(matsSUBl11, 'outData/RDS/matsSUBl11.RDS')
write_rds(matsSUBl12, 'outData/RDS/matsSUBl12.RDS')
write_rds(matsSUBl20, 'outData/RDS/matsSUBl20.RDS')
write_rds(matsSUBl21, 'outData/RDS/matsSUBl21.RDS')
write_rds(matsSUBl22, 'outData/RDS/matsSUBl22.RDS')
write_rds(matsSUBl23, 'outData/RDS/matsSUBl23.RDS')

# VAN
write_rds(matsVANp, 'outData/RDS/matsVANp.RDS')
write_rds(matsVANt0, 'outData/RDS/matsVANt0.RDS')
write_rds(matsVANt1, 'outData/RDS/matsVANt1.RDS')
write_rds(matsVANl10, 'outData/RDS/matsVANl10.RDS')
write_rds(matsVANl11, 'outData/RDS/matsVANl11.RDS')
write_rds(matsVANl12, 'outData/RDS/matsVANl12.RDS')
write_rds(matsVANl20, 'outData/RDS/matsVANl20.RDS')
write_rds(matsVANl21, 'outData/RDS/matsVANl21.RDS')
write_rds(matsVANl22, 'outData/RDS/matsVANl22.RDS')
write_rds(matsVANl23, 'outData/RDS/matsVANl23.RDS')


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

## Subnetworks

matsCONp <- read_rds('outData/RDS/matsCONp.RDS')
matsCONt0 <- read_rds('outData/RDS/matsCONt0.RDS')
matsCONt1 <- read_rds('outData/RDS/matsCONt1.RDS')
matsCONl10 <- read_rds('outData/RDS/matsCONl10.RDS')
matsCONl11 <- read_rds('outData/RDS/matsCONl11.RDS')
matsCONl12 <- read_rds('outData/RDS/matsCONl12.RDS')
matsCONl20 <- read_rds('outData/RDS/matsCONl20.RDS')
matsCONl21 <- read_rds('outData/RDS/matsCONl21.RDS')
matsCONl22 <- read_rds('outData/RDS/matsCONl22.RDS')
matsCONl23 <- read_rds('outData/RDS/matsCONl23.RDS')

matsDANp <- read_rds('outData/RDS/matsDANp.RDS')
matsDANt0 <- read_rds('outData/RDS/matsDANt0.RDS')
matsDANt1 <- read_rds('outData/RDS/matsDANt1.RDS')
matsDANl10 <- read_rds('outData/RDS/matsDANl10.RDS')
matsDANl11 <- read_rds('outData/RDS/matsDANl11.RDS')
matsDANl12 <- read_rds('outData/RDS/matsDANl12.RDS')
matsDANl20 <- read_rds('outData/RDS/matsDANl20.RDS')
matsDANl21 <- read_rds('outData/RDS/matsDANl21.RDS')
matsDANl22 <- read_rds('outData/RDS/matsDANl22.RDS')
matsDANl23 <- read_rds('outData/RDS/matsDANl23.RDS')

matsDMNp <- read_rds('outData/RDS/matsDMNp.RDS')
matsDMNt0 <- read_rds('outData/RDS/matsDMNt0.RDS')
matsDMNt1 <- read_rds('outData/RDS/matsDMNt1.RDS')
matsDMNl10 <- read_rds('outData/RDS/matsDMNl10.RDS')
matsDMNl11 <- read_rds('outData/RDS/matsDMNl11.RDS')
matsDMNl12 <- read_rds('outData/RDS/matsDMNl12.RDS')
matsDMNl20 <- read_rds('outData/RDS/matsDMNl20.RDS')
matsDMNl21 <- read_rds('outData/RDS/matsDMNl21.RDS')
matsDMNl22 <- read_rds('outData/RDS/matsDMNl22.RDS')
matsDMNl23 <- read_rds('outData/RDS/matsDMNl23.RDS')

matsFPNp <- read_rds('outData/RDS/matsFPNp.RDS')
matsFPNt0 <- read_rds('outData/RDS/matsFPNt0.RDS')
matsFPNt1 <- read_rds('outData/RDS/matsFPNt1.RDS')
matsFPNl10 <- read_rds('outData/RDS/matsFPNl10.RDS')
matsFPNl11 <- read_rds('outData/RDS/matsFPNl11.RDS')
matsFPNl12 <- read_rds('outData/RDS/matsFPNl12.RDS')
matsFPNl20 <- read_rds('outData/RDS/matsFPNl20.RDS')
matsFPNl21 <- read_rds('outData/RDS/matsFPNl21.RDS')
matsFPNl22 <- read_rds('outData/RDS/matsFPNl22.RDS')
matsFPNl23 <- read_rds('outData/RDS/matsFPNl23.RDS')

matsSALp <- read_rds('outData/RDS/matsSALp.RDS')
matsSALt0 <- read_rds('outData/RDS/matsSALt0.RDS')
matsSALt1 <- read_rds('outData/RDS/matsSALt1.RDS')
matsSALl10 <- read_rds('outData/RDS/matsSALl10.RDS')
matsSALl11 <- read_rds('outData/RDS/matsSALl11.RDS')
matsSALl12 <- read_rds('outData/RDS/matsSALl12.RDS')
matsSALl20 <- read_rds('outData/RDS/matsSALl20.RDS')
matsSALl21 <- read_rds('outData/RDS/matsSALl21.RDS')
matsSALl22 <- read_rds('outData/RDS/matsSALl22.RDS')
matsSALl23 <- read_rds('outData/RDS/matsSALl23.RDS')

matsSUBp <- read_rds('outData/RDS/matsSUBp.RDS')
matsSUBt0 <- read_rds('outData/RDS/matsSUBt0.RDS')
matsSUBt1 <- read_rds('outData/RDS/matsSUBt1.RDS')
matsSUBl10 <- read_rds('outData/RDS/matsSUBl10.RDS')
matsSUBl11 <- read_rds('outData/RDS/matsSUBl11.RDS')
matsSUBl12 <- read_rds('outData/RDS/matsSUBl12.RDS')
matsSUBl20 <- read_rds('outData/RDS/matsSUBl20.RDS')
matsSUBl21 <- read_rds('outData/RDS/matsSUBl21.RDS')
matsSUBl22 <- read_rds('outData/RDS/matsSUBl22.RDS')
matsSUBl23 <- read_rds('outData/RDS/matsSUBl23.RDS')

matsVANp <- read_rds('outData/RDS/matsVANp.RDS')
matsVANt0 <- read_rds('outData/RDS/matsVANt0.RDS')
matsVANt1 <- read_rds('outData/RDS/matsVANt1.RDS')
matsVANl10 <- read_rds('outData/RDS/matsVANl10.RDS')
matsVANl11 <- read_rds('outData/RDS/matsVANl11.RDS')
matsVANl12 <- read_rds('outData/RDS/matsVANl12.RDS')
matsVANl20 <- read_rds('outData/RDS/matsVANl20.RDS')
matsVANl21 <- read_rds('outData/RDS/matsVANl21.RDS')
matsVANl22 <- read_rds('outData/RDS/matsVANl22.RDS')
matsVANl23 <- read_rds('outData/RDS/matsVANl23.RDS')