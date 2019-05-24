
# Atlas -------------------------------------------------------------------

power <- fread('inData/atlas_power_r.csv', header = T)
power[, `:=`(
    name = factor(name),
    lobe = factor(lobe),
    hemi = factor(hemi),
    network = factor(network),
    V9 = NULL)]

power[network == "Cingulo-opercular Task Control", networkLabel := "CON"]
power[network == "Dorsal attention", networkLabel := "DAN"]
power[network == "Default mode", networkLabel := "DMN"]
power[network == "Fronto-parietal Task Control", networkLabel := "FPN"]
power[network == "Salience", networkLabel := "SAL"]
power[network == "Subcortical", networkLabel := "SUB"]
power[network == "Ventral attention", networkLabel := "VAN"]

pCON <- power[networkLabel == "CON"]
pDAN <- power[networkLabel == "DAN"]
pDMN <- power[networkLabel == "DMN"]
pFPN <- power[networkLabel == "FPN"]
pSAL <- power[networkLabel == "SAL"]
pSUB <- power[networkLabel == "SUB"]
pVAN <- power[networkLabel == "VAN"]


# Time Series -> Correlations ---------------------------------------------

# timeSeries <- readTimeSeries('inData/TimeSeries')
# writeCorMats(timeSeries2Corrs(timeSeries), 'inData/CorMatsRaw')
corMats <- readCorMats('inData/CorMatsRaw')
corMatsNeg <- readCorMats('inData/CorMatsRaw', Neg = T)
# writeCorMats(corMats, 'inData/CorMatsPos')
# writeCorMats(corMatsNeg, 'inData/CorMatsNeg')
subMats(corMats, T, 'inData/subNets')
subMats(corMatsNeg, T, 'inData/subNetsNeg')

# Adjacency Matrices ------------------------------------------------------
# Whole brain network -----------------------------------------------------

## Positive

mFilesWB <- readCorMats('inData/CorMatsPos', Files = T)
# matsWBvs <- createMats(mFilesWB$hc_cu, inds_p, "consensus")
matsWBt0 <- createMats(mFilesWB$t0, inds, "consensus")
matsWBt1 <- createMats(mFilesWB$t1, inds, "consensus")
# matsWBtx0 <- createMats(mFilesWB$pre, inds2, "consensus")
# matsWBtx1 <- createMats(mFilesWB$post, inds2, "consensus")
# matsWBl0 <- createMats(
#     str_subset(
#         mFilesWB$pre, 
#         paste(covars3$Study.ID, collapse = '|')
#     ), 
#     inds3, "consensus"
# )
# matsWBl1 <- createMats(
#     str_subset(
#         mFilesWB$post, 
#         paste(covars3$Study.ID, collapse = '|')
#     ), 
#     inds3, "consensus"
# )
# matsWBl2 <- createMats(mFilesWB$t2, inds3, "consensus")

## Negative

mFilesWBneg <- readCorMats('inData/CorMatsNeg', Files = T)
# matsNgWBvs <- createMats(mFilesWBneg$hc_cu, inds_p, "consensus")
matsNgWBt0 <- createMats(mFilesWBneg$t0, inds, "consensus")
matsNgWBt1 <- createMats(mFilesWBneg$t1, inds, "consensus")
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

# Cingulo-opercular network -------------------------------------------------------------------

## Positive

mFilesCON <- readCorMats('inData/subNets/CON', Files = T)
# matsCONvs <- createMats(mFilesCON$hc_cu, inds_p, "consensus")
matsCONt0 <- createMats(mFilesCON$t0, inds, "consensus")
matsCONt1 <- createMats(mFilesCON$t1, inds, "consensus")
# matsCONtx0 <- createMats(mFilesCON$pre, inds2, "consensus")
# matsCONtx1 <- createMats(mFilesCON$post, inds2, "consensus")
# matsCONl0 <- createMats(
#     str_subset(
#         mFilesCON$pre, 
#         paste(covars3$Study.ID, collapse = '|')
#     ), 
#     inds3, "consensus"
# )
# matsCONl1 <- createMats(
#     str_subset(
#         mFilesCON$post, 
#         paste(covars3$Study.ID, collapse = '|')
#     ), 
#     inds3, "consensus"
# )
# matsCONl2 <- createMats(mFilesCON$t2, inds3, "consensus")

## Negative

mFilesCONneg <- readCorMats('inData/subNetsNeg/CON', Files = T)
# matsNgCONvs <- createMats(mFilesCONneg$hc_cu, inds_p, "consensus")
matsNgCONt0 <- createMats(mFilesCONneg$t0, inds, "consensus")
matsNgCONt1 <- createMats(mFilesCONneg$t1, inds, "consensus")
# matsNgCONtx0 <- createMats(mFilesCONneg$pre, inds2, "consensus")
# matsNgCONtx1 <- createMats(mFilesCONneg$post, inds2, "consensus")
# matsNgCONl0 <- createMats(
#     str_subset(
#         mFilesCONneg$pre, 
#         paste(covars3$Study.ID, collapse = '|')
#     ), 
#     inds3, "consensus"
# )
# matsNgCONl1 <- createMats(
#     str_subset(
#         mFilesCONneg$post, 
#         paste(covars3$Study.ID, collapse = '|')
#     ), 
#     inds3, "consensus"
# )
# matsNgCONl2 <- createMats(mFilesCONneg$t2, inds3, "consensus")

# Dorsal attention network --------------------------------------------------------------------

## Positive

mFilesDAN <- readCorMats('inData/subNets/DAN', Files = T)
# matsDANvs <- createMats(mFilesDAN$hc_cu, inds_p, "consensus")
matsDANt0 <- createMats(mFilesDAN$t0, inds, "consensus")
matsDANt1 <- createMats(mFilesDAN$t1, inds, "consensus")
# matsDANtx0 <- createMats(mFilesDAN$pre, inds2, "consensus")
# matsDANtx1 <- createMats(mFilesDAN$post, inds2, "consensus")
# matsDANl0 <- createMats(
#     str_subset(
#         mFilesDAN$pre, 
#         paste(covars3$Study.ID, collapse = '|')
#     ), 
#     inds3, "consensus"
# )
# matsDANl1 <- createMats(
#     str_subset(
#         mFilesDAN$post, 
#         paste(covars3$Study.ID, collapse = '|')
#     ), 
#     inds3, "consensus"
# )
# matsDANl2 <- createMats(mFilesDAN$t2, inds3, "consensus")

## Negative

mFilesDANneg <- readCorMats('inData/subNetsNeg/DAN', Files = T)
# matsNgDANvs <- createMats(mFilesDANneg$hc_cu, inds_p, "consensus")
matsNgDANt0 <- createMats(mFilesDANneg$t0, inds, "consensus")
matsNgDANt1 <- createMats(mFilesDANneg$t1, inds, "consensus")
# matsNgDANtx0 <- createMats(mFilesDANneg$pre, inds2, "consensus")
# matsNgDANtx1 <- createMats(mFilesDANneg$post, inds2, "consensus")
# matsNgDANl0 <- createMats(
#     str_subset(
#         mFilesDANneg$pre, 
#         paste(covars3$Study.ID, collapse = '|')
#     ), 
#     inds3, "consensus"
# )
# matsNgDANl1 <- createMats(
#     str_subset(
#         mFilesDANneg$post, 
#         paste(covars3$Study.ID, collapse = '|')
#     ), 
#     inds3, "consensus"
# )
# matsNgDANl2 <- createMats(mFilesDANneg$t2, inds3, "consensus")


# Default mode network ------------------------------------------------------------------------

## Positive

mFilesDMN <- readCorMats('inData/subNets/DMN', Files = T)
# matsDMNvs <- createMats(mFilesDMN$hc_cu, inds_p, "consensus")
matsDMNt0 <- createMats(mFilesDMN$t0, inds, "consensus")
matsDMNt1 <- createMats(mFilesDMN$t1, inds, "consensus")
# matsDMNtx0 <- createMats(mFilesDMN$pre, inds2, "consensus")
# matsDMNtx1 <- createMats(mFilesDMN$post, inds2, "consensus")
# matsDMNl0 <- createMats(
#     str_subset(
#         mFilesDMN$pre, 
#         paste(covars3$Study.ID, collapse = '|')
#     ), 
#     inds3, "consensus"
# )
# matsDMNl1 <- createMats(
#     str_subset(
#         mFilesDMN$post, 
#         paste(covars3$Study.ID, collapse = '|')
#     ), 
#     inds3, "consensus"
# )
# matsDMNl2 <- createMats(mFilesDMN$t2, inds3, "consensus")

## Negative

mFilesDMNneg <- readCorMats('inData/subNetsNeg/DMN', Files = T)
# matsNgDMNvs <- createMats(mFilesDMNneg$hc_cu, inds_p, "consensus")
matsNgDMNt0 <- createMats(mFilesDMNneg$t0, inds, "consensus")
matsNgDMNt1 <- createMats(mFilesDMNneg$t1, inds, "consensus")
# matsNgDMNtx0 <- createMats(mFilesDMNneg$pre, inds2, "consensus")
# matsNgDMNtx1 <- createMats(mFilesDMNneg$post, inds2, "consensus")
# matsNgDMNl0 <- createMats(
#     str_subset(
#         mFilesDMNneg$pre, 
#         paste(covars3$Study.ID, collapse = '|')
#     ), 
#     inds3, "consensus"
# )
# matsNgDMNl1 <- createMats(
#     str_subset(
#         mFilesDMNneg$post, 
#         paste(covars3$Study.ID, collapse = '|')
#     ), 
#     inds3, "consensus"
# )
# matsNgDMNl2 <- createMats(mFilesDMNneg$t2, inds3, "consensus")

# Fronto-parietal network ---------------------------------------------------------------------

## Positive

mFilesFPN <- readCorMats('inData/subNets/FPN', Files = T)
# matsFPNvs <- createMats(mFilesFPN$hc_cu, inds_p, "consensus")
matsFPNt0 <- createMats(mFilesFPN$t0, inds, "consensus")
matsFPNt1 <- createMats(mFilesFPN$t1, inds, "consensus")
# matsFPNtx0 <- createMats(mFilesFPN$pre, inds2, "consensus")
# matsFPNtx1 <- createMats(mFilesFPN$post, inds2, "consensus")
# matsFPNl0 <- createMats(
#     str_subset(
#         mFilesFPN$pre, 
#         paste(covars3$Study.ID, collapse = '|')
#     ), 
#     inds3, "consensus"
# )
# matsFPNl1 <- createMats(
#     str_subset(
#         mFilesFPN$post, 
#         paste(covars3$Study.ID, collapse = '|')
#     ), 
#     inds3, "consensus"
# )
# matsFPNl2 <- createMats(mFilesFPN$t2, inds3, "consensus")

## Negative

mFilesFPNneg <- readCorMats('inData/subNetsNeg/FPN', Files = T)
# matsNgFPNvs <- createMats(mFilesFPNneg$hc_cu, inds_p, "consensus")
matsNgFPNt0 <- createMats(mFilesFPNneg$t0, inds, "consensus")
matsNgFPNt1 <- createMats(mFilesFPNneg$t1, inds, "consensus")
# matsNgFPNtx0 <- createMats(mFilesFPNneg$pre, inds2, "consensus")
# matsNgFPNtx1 <- createMats(mFilesFPNneg$post, inds2, "consensus")
# matsNgFPNl0 <- createMats(
#     str_subset(
#         mFilesFPNneg$pre, 
#         paste(covars3$Study.ID, collapse = '|')
#     ), 
#     inds3, "consensus"
# )
# matsNgFPNl1 <- createMats(
#     str_subset(
#         mFilesFPNneg$post, 
#         paste(covars3$Study.ID, collapse = '|')
#     ), 
#     inds3, "consensus"
# )
# matsNgFPNl2 <- createMats(mFilesFPNneg$t2, inds3, "consensus")

# Salience network ----------------------------------------------------------------------------

## Positive

mFilesSAL <- readCorMats('inData/subNets/SAL', Files = T)
# matsSALvs <- createMats(mFilesSAL$hc_cu, inds_p, "consensus")
matsSALt0 <- createMats(mFilesSAL$t0, inds, "consensus")
matsSALt1 <- createMats(mFilesSAL$t1, inds, "consensus")
# matsSALtx0 <- createMats(mFilesSAL$pre, inds2, "consensus")
# matsSALtx1 <- createMats(mFilesSAL$post, inds2, "consensus")
# matsSALl0 <- createMats(
#     str_subset(
#         mFilesSAL$pre, 
#         paste(covars3$Study.ID, collapse = '|')
#     ), 
#     inds3, "consensus"
# )
# matsSALl1 <- createMats(
#     str_subset(
#         mFilesSAL$post, 
#         paste(covars3$Study.ID, collapse = '|')
#     ), 
#     inds3, "consensus"
# )
# matsSALl2 <- createMats(mFilesSAL$t2, inds3, "consensus")

## Negative

mFilesSALneg <- readCorMats('inData/subNetsNeg/SAL/', Files = T)
# matsNgSALvs <- createMats(mFilesSALneg$hc_cu, inds_p, "consensus")
matsNgSALt0 <- createMats(mFilesSALneg$t0, inds, "consensus")
matsNgSALt1 <- createMats(mFilesSALneg$t1, inds, "consensus")
# matsNgSALtx0 <- createMats(mFilesSALneg$pre, inds2, "consensus")
# matsNgSALtx1 <- createMats(mFilesSALneg$post, inds2, "consensus")
# matsNgSALl0 <- createMats(
#     str_subset(
#         mFilesSALneg$pre, 
#         paste(covars3$Study.ID, collapse = '|')
#     ), 
#     inds3, "consensus"
# )
# matsNgSALl1 <- createMats(
#     str_subset(
#         mFilesSALneg$post, 
#         paste(covars3$Study.ID, collapse = '|')
#     ), 
#     inds3, "consensus"
# )
# matsNgSALl2 <- createMats(mFilesSALneg$t2, inds3, "consensus")

# Subcortical network -------------------------------------------------------------------------

## Positive

mFilesSUB <- readCorMats('inData/subNets/SUB', Files = T)
# matsSUBvs <- createMats(mFilesSUB$hc_cu, inds_p, "consensus")
matsSUBt0 <- createMats(mFilesSUB$t0, inds, "consensus")
matsSUBt1 <- createMats(mFilesSUB$t1, inds, "consensus")
# matsSUBtx0 <- createMats(mFilesSUB$pre, inds2, "consensus")
# matsSUBtx1 <- createMats(mFilesSUB$post, inds2, "consensus")
# matsSUBl0 <- createMats(
#     str_subset(
#         mFilesSUB$pre, 
#         paste(covars3$Study.ID, collapse = '|')
#     ), 
#     inds3, "consensus"
# )
# matsSUBl1 <- createMats(
#     str_subset(
#         mFilesSUB$post, 
#         paste(covars3$Study.ID, collapse = '|')
#     ), 
#     inds3, "consensus"
# )
# matsSUBl2 <- createMats(mFilesSUB$t2, inds3, "consensus")

## Negative

mFilesSUBneg <- readCorMats('inData/subNetsNeg/SUB', Files = T)
# matsNgSUBvs <- createMats(mFilesSUBneg$hc_cu, inds_p, "consensus")
matsNgSUBt0 <- createMats(mFilesSUBneg$t0, inds, "consensus")
matsNgSUBt1 <- createMats(mFilesSUBneg$t1, inds, "consensus")
# matsNgSUBtx0 <- createMats(mFilesSUBneg$pre, inds2, "consensus")
# matsNgSUBtx1 <- createMats(mFilesSUBneg$post, inds2, "consensus")
# matsNgSUBl0 <- createMats(
#     str_subset(
#         mFilesSUBneg$pre, 
#         paste(covars3$Study.ID, collapse = '|')
#     ), 
#     inds3, "consensus"
# )
# matsNgSUBl1 <- createMats(
#     str_subset(
#         mFilesSUBneg$post, 
#         paste(covars3$Study.ID, collapse = '|')
#     ), 
#     inds3, "consensus"
# )
# matsNgSUBl2 <- createMats(mFilesSUBneg$t2, inds3, "consensus")

# Ventral attention network -------------------------------------------------------------------

## Positive

mFilesVAN <- readCorMats('inData/subNets/VAN', Files = T)
# matsVANvs <- createMats(mFilesVAN$hc_cu, inds_p, "consensus")
matsVANt0 <- createMats(mFilesVAN$t0, inds, "consensus")
matsVANt1 <- createMats(mFilesVAN$t1, inds, "consensus")
# matsVANtx0 <- createMats(mFilesVAN$pre, inds2, "consensus")
# matsVANtx1 <- createMats(mFilesVAN$post, inds2, "consensus")
# matsVANl0 <- createMats(
#     str_subset(
#         mFilesVAN$pre, 
#         paste(covars3$Study.ID, collapse = '|')
#     ), 
#     inds3, "consensus"
# )
# matsVANl1 <- createMats(
#     str_subset(
#         mFilesVAN$post, 
#         paste(covars3$Study.ID, collapse = '|')
#     ), 
#     inds3, "consensus"
# )
# matsVANl2 <- createMats(mFilesVAN$t2, inds3, "consensus")

## Negative

mFilesVANneg <- readCorMats('inData/subNetsNeg/VAN', Files = T)
# matsNgVANvs <- createMats(mFilesVANneg$hc_cu, inds_p, "consensus")
matsNgVANt0 <- createMats(mFilesVANneg$t0, inds, "consensus")
matsNgVANt1 <- createMats(mFilesVANneg$t1, inds, "consensus")
# matsNgVANtx0 <- createMats(mFilesVANneg$pre, inds2, "consensus")
# matsNgVANtx1 <- createMats(mFilesVANneg$post, inds2, "consensus")
# matsNgVANl0 <- createMats(
#     str_subset(
#         mFilesVANneg$pre, 
#         paste(covars3$Study.ID, collapse = '|')
#     ), 
#     inds3, "consensus"
# )
# matsNgVANl1 <- createMats(
#     str_subset(
#         mFilesVANneg$post, 
#         paste(covars3$Study.ID, collapse = '|')
#     ), 
#     inds3, "consensus"
# )
# matsNgVANl2 <- createMats(mFilesVANneg$t2, inds3, "consensus")
