
# Atlas ---------------------------------------------------------------------------------------

power <- fread('inData/atlas_power_r.csv', header = T)
power <- power[,-9] %>% 
    mutate(name = factor(name), lobe = factor(lobe), hemi = factor(hemi), 
           network = factor(network)) %>% data.table()

pCON <- power[network == "Cingulo-opercular Task Control"]
pDAN <- power[network == "Dorsal attention"]
pDMN <- power[network == "Default mode"]
pFPN <- power[network == "Fronto-parietal Task Control"]
pSAL <- power[network == "Salience"]
pSUB <- power[network == "Subcortical"]
pVAN <- power[network == "Ventral attention"]


# Thresholding --------------------------------------------------------------------------------

thresholds <- 0.2
sub.thresh <- 0.65


# Matrices directories ------------------------------------------------------------------------

dataTMS <- paste0(home, 'matrices/pwr_final') 
dataCTRL <- '/run/media/sofdez/Alpha/addimex_conn/derivatives/graphs/matrices/pwr_final'


# Whole brain network -------------------------------------------------------------------------

mFilesWB <- ext_mat_files('wb', dataCTRL, dataTMS)
matsWBt1 <- cr_mats_soph(mFilesWB$r_t1, inds, "consensus")
matsWBtx1 <- cr_mats_soph(mFilesWB$r_tx_post, inds2, "consensus")
matsWBl2 <- cr_mats_soph(mFilesWB$r_t2, inds3, "consensus")

# Longitudinal matrices (Posterior model)
matsWBt0 <- apply_thresholds(matsWBt1$A.norm.sub, matsWBt1$A.norm.mean,
                              mFilesWB$r_t0, inds)

matsWBtx0 <- apply_thresholds(matsWBtx1$A.norm.sub, matsWBtx1$A.norm.mean,
                               mFilesWB$r_tx_pre, inds2)

matsWBl0 <- apply_thresholds(matsWBl2$A.norm.sub, matsWBl2$A.norm.mean,
                              str_subset(mFilesWB$r_tx_pre, 
                                         paste(covars3$Study.ID, collapse = '|')), inds3)
matsWBl1 <- apply_thresholds(matsWBl2$A.norm.sub, matsWBl2$A.norm.mean,
                              str_subset(mFilesWB$r_tx_post, 
                                         paste(covars3$Study.ID, collapse = '|')), inds3)


# Cingulo-opercular network -------------------------------------------------------------------

mFilesCON <- ext_mat_files("co_tc", dataCTRL, dataTMS)
matsCONt1 <- cr_mats_soph(mFilesCON$r_t1, inds, "consensus")
matsCONtx1 <- cr_mats_soph(mFilesCON$r_tx_post, inds2, "consensus")
matsCONl2 <- cr_mats_soph(mFilesCON$r_t2, inds3, "consensus")

# Longitudinal matrices (Posterior model)
matsCONt0 <- apply_thresholds(matsCONt1$A.norm.sub, matsCONt1$A.norm.mean,
                              mFilesCON$r_t0, inds)

matsCONtx0 <- apply_thresholds(matsCONtx1$A.norm.sub, matsCONtx1$A.norm.mean,
                               mFilesCON$r_tx_pre, inds2)

matsCONl0 <- apply_thresholds(matsCONl2$A.norm.sub, matsCONl2$A.norm.mean,
                              str_subset(mFilesCON$r_tx_pre, 
                                         paste(covars3$Study.ID, collapse = '|')), inds3)
matsCONl1 <- apply_thresholds(matsCONl2$A.norm.sub, matsCONl2$A.norm.mean,
                              str_subset(mFilesCON$r_tx_post, 
                                         paste(covars3$Study.ID, collapse = '|')), inds3)


# Dorsal attention network --------------------------------------------------------------------

mFilesDAN <- ext_mat_files("d_att", dataCTRL, dataTMS)
matsDANt1 <- cr_mats_soph(mFilesDAN$r_t1, inds, "consensus")
matsDANtx1 <- cr_mats_soph(mFilesDAN$r_tx_post, inds2, "consensus")
matsDANl2 <- cr_mats_soph(mFilesDAN$r_t2, inds3, "consensus")

# Longitudinal matrices (Posterior model)
matsDANt0 <- apply_thresholds(matsDANt1$A.norm.sub, matsDANt1$A.norm.mean,
                              mFilesDAN$r_t0, inds)

matsDANtx0 <- apply_thresholds(matsDANtx1$A.norm.sub, matsDANtx1$A.norm.mean,
                               mFilesDAN$r_tx_pre, inds2)

matsDANl0 <- apply_thresholds(matsDANl2$A.norm.sub, matsDANl2$A.norm.mean,
                              str_subset(mFilesDAN$r_tx_pre, 
                                         paste(covars3$Study.ID, collapse = '|')), inds3)
matsDANl1 <- apply_thresholds(matsDANl2$A.norm.sub, matsDANl2$A.norm.mean,
                              str_subset(mFilesDAN$r_tx_post, 
                                         paste(covars3$Study.ID, collapse = '|')), inds3)


# Default mode network ------------------------------------------------------------------------

mFilesDMN <- ext_mat_files("dmn", dataCTRL, dataTMS)
matsDMNt1 <- cr_mats_soph(mFilesDMN$r_t1, inds, "consensus")
matsDMNtx1 <- cr_mats_soph(mFilesDMN$r_tx_post, inds2, "consensus")
matsDMNl2 <- cr_mats_soph(mFilesDMN$r_t2, inds3, "consensus")

# Longitudinal matrices (Posterior model)
matsDMNt0 <- apply_thresholds(matsDMNt1$A.norm.sub, matsDMNt1$A.norm.mean,
                              mFilesDMN$r_t0, inds)

matsDMNtx0 <- apply_thresholds(matsDMNtx1$A.norm.sub, matsDMNtx1$A.norm.mean,
                               mFilesDMN$r_tx_pre, inds2)

matsDMNl0 <- apply_thresholds(matsDMNl2$A.norm.sub, matsDMNl2$A.norm.mean,
                              str_subset(mFilesDMN$r_tx_pre, 
                                         paste(covars3$Study.ID, collapse = '|')), inds3)
matsDMNl1 <- apply_thresholds(matsDMNl2$A.norm.sub, matsDMNl2$A.norm.mean,
                              str_subset(mFilesDMN$r_tx_post, 
                                         paste(covars3$Study.ID, collapse = '|')), inds3)


# Fronto-parietal network ---------------------------------------------------------------------

mFilesFPN <- ext_mat_files("fp_tc", dataCTRL, dataTMS)
matsFPNt1 <- cr_mats_soph(mFilesFPN$r_t1, inds, "consensus")
matsFPNtx1 <- cr_mats_soph(mFilesFPN$r_tx_post, inds2, "consensus")
matsFPNl2 <- cr_mats_soph(mFilesFPN$r_t2, inds3, "consensus")

# Longitudinal matrices (Posterior model)
matsFPNt0 <- apply_thresholds(matsFPNt1$A.norm.sub, matsFPNt1$A.norm.mean,
                              mFilesFPN$r_t0, inds)

matsFPNtx0 <- apply_thresholds(matsFPNtx1$A.norm.sub, matsFPNtx1$A.norm.mean,
                               mFilesFPN$r_tx_pre, inds2)

matsFPNl0 <- apply_thresholds(matsFPNl2$A.norm.sub, matsFPNl2$A.norm.mean,
                              str_subset(mFilesFPN$r_tx_pre, 
                                         paste(covars3$Study.ID, collapse = '|')), inds3)
matsFPNl1 <- apply_thresholds(matsFPNl2$A.norm.sub, matsFPNl2$A.norm.mean,
                              str_subset(mFilesFPN$r_tx_post, 
                                         paste(covars3$Study.ID, collapse = '|')), inds3)


# Salience network ----------------------------------------------------------------------------

mFilesSAL <- ext_mat_files("sal", dataCTRL, dataTMS)
matsSALt1 <- cr_mats_soph(mFilesSAL$r_t1, inds, "consensus")
matsSALtx1 <- cr_mats_soph(mFilesSAL$r_tx_post, inds2, "consensus")
matsSALl2 <- cr_mats_soph(mFilesSAL$r_t2, inds3, "consensus")

# Longitudinal matrices (Posterior model)
matsSALt0 <- apply_thresholds(matsSALt1$A.norm.sub, matsSALt1$A.norm.mean,
                              mFilesSAL$r_t0, inds)

matsSALtx0 <- apply_thresholds(matsSALtx1$A.norm.sub, matsSALtx1$A.norm.mean,
                               mFilesSAL$r_tx_pre, inds2)

matsSALl0 <- apply_thresholds(matsSALl2$A.norm.sub, matsSALl2$A.norm.mean,
                              str_subset(mFilesSAL$r_tx_pre, 
                                         paste(covars3$Study.ID, collapse = '|')), inds3)
matsSALl1 <- apply_thresholds(matsSALl2$A.norm.sub, matsSALl2$A.norm.mean,
                              str_subset(mFilesSAL$r_tx_post, 
                                         paste(covars3$Study.ID, collapse = '|')), inds3)


# Subcortical network -------------------------------------------------------------------------

mFilesSUB <- ext_mat_files("subc", dataCTRL, dataTMS)
matsSUBt1 <- cr_mats_soph(mFilesSUB$r_t1, inds, "consensus")
matsSUBtx1 <- cr_mats_soph(mFilesSUB$r_tx_post, inds2, "consensus")
matsSUBl2 <- cr_mats_soph(mFilesSUB$r_t2, inds3, "consensus")

# Longitudinal matrices (Posterior model)
matsSUBt0 <- apply_thresholds(matsSUBt1$A.norm.sub, matsSUBt1$A.norm.mean,
                              mFilesSUB$r_t0, inds)

matsSUBtx0 <- apply_thresholds(matsSUBtx1$A.norm.sub, matsSUBtx1$A.norm.mean,
                               mFilesSUB$r_tx_pre, inds2)

matsSUBl0 <- apply_thresholds(matsSUBl2$A.norm.sub, matsSUBl2$A.norm.mean,
                              str_subset(mFilesSUB$r_tx_pre, 
                                         paste(covars3$Study.ID, collapse = '|')), inds3)
matsSUBl1 <- apply_thresholds(matsSUBl2$A.norm.sub, matsSUBl2$A.norm.mean,
                              str_subset(mFilesSUB$r_tx_post, 
                                         paste(covars3$Study.ID, collapse = '|')), inds3)


# Ventral attention network -------------------------------------------------------------------

mFilesVAN <- ext_mat_files("v_att", dataCTRL, dataTMS)
matsVANt1 <- cr_mats_soph(mFilesVAN$r_t1, inds, "consensus")
matsVANtx1 <- cr_mats_soph(mFilesVAN$r_tx_post, inds2, "consensus")
matsVANl2 <- cr_mats_soph(mFilesVAN$r_t2, inds3, "consensus")

# Longitudinal matrices (Posterior model)
matsVANt0 <- apply_thresholds(matsVANt1$A.norm.sub, matsVANt1$A.norm.mean,
                              mFilesVAN$r_t0, inds)

matsVANtx0 <- apply_thresholds(matsVANtx1$A.norm.sub, matsVANtx1$A.norm.mean,
                               mFilesVAN$r_tx_pre, inds2)

matsVANl0 <- apply_thresholds(matsVANl2$A.norm.sub, matsVANl2$A.norm.mean,
                              str_subset(mFilesVAN$r_tx_pre, 
                                         paste(covars3$Study.ID, collapse = '|')), inds3)
matsVANl1 <- apply_thresholds(matsVANl2$A.norm.sub, matsVANl2$A.norm.mean,
                              str_subset(mFilesVAN$r_tx_post, 
                                         paste(covars3$Study.ID, collapse = '|')), inds3)

