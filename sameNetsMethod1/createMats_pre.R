
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
matsWBt0 <- cr_mats_soph(mFilesWB$r_t0, inds, "consensus")
matsWBtx0 <- cr_mats_soph(mFilesWB$r_tx_pre, inds2, "consensus")
matsWBl0 <- cr_mats_soph(str_subset(
    mFilesWB$r_tx_pre, paste(covars3$Study.ID, collapse = '|')), inds3, "consensus")

# Longitudinal matrices (T0 model)
matsWBt1 <- apply_thresholds(matsWBt0$A.norm.sub, matsWBt0$A.norm.mean,
                                mFilesWB$r_t1, inds)

matsWBtx1 <- apply_thresholds(matsWBtx0$A.norm.sub, matsWBtx0$A.norm.mean,
                                 mFilesWB$r_tx_post, inds2)

matsWBl1 <- apply_thresholds(matsWBl0$A.norm.sub, matsWBl0$A.norm.mean,
                                  str_subset(mFilesWB$r_tx_post, 
                                             paste(covars3$Study.ID, collapse = '|')), inds3)
matsWBl2 <- apply_thresholds(matsWBl0$A.norm.sub, matsWBl0$A.norm.mean,
                                  mFilesWB$r_t2, inds3)


# Cingulo-opercular network -------------------------------------------------------------------

mFilesCON <- ext_mat_files("co_tc", dataCTRL, dataTMS)
matsCONt0 <- cr_mats_soph(mFilesCON$r_t0, inds, "consensus")

matsCONtx0 <- cr_mats_soph(mFilesCON$r_tx_pre, inds2, "consensus")

matsCONl0 <- cr_mats_soph(str_subset(
    mFilesCON$r_tx_pre, paste(covars3$Study.ID, collapse = '|')), inds3, "consensus")

# Longitudinal matrices (T0 model)
matsCONt1 <- apply_thresholds(matsCONt0$A.norm.sub, matsCONt0$A.norm.mean,
                               mFilesCON$r_t1, inds)

matsCONtx1 <- apply_thresholds(matsCONtx0$A.norm.sub, matsCONtx0$A.norm.mean,
                                mFilesCON$r_tx_post, inds2)

matsCONl1 <- apply_thresholds(matsCONl0$A.norm.sub, matsCONl0$A.norm.mean,
                                   str_subset(mFilesCON$r_tx_post,
                                              paste(covars3$Study.ID, collapse = '|')), inds3)
matsCONl2 <- apply_thresholds(matsCONl0$A.norm.sub, matsCONl0$A.norm.mean,
                                  mFilesCON$r_t2, inds3)


# Dorsal attention network --------------------------------------------------------------------

mFilesDAN <- ext_mat_files("d_att", dataCTRL, dataTMS)
matsDANt0 <- cr_mats_soph(mFilesDAN$r_t0, inds, "consensus")

matsDANtx0 <- cr_mats_soph(mFilesDAN$r_tx_pre, inds2, "consensus")

matsDANl0 <- cr_mats_soph(str_subset(
    mFilesDAN$r_tx_pre, paste(covars3$Study.ID, collapse = '|')), inds3, "consensus")

# Longitudinal matrices (T0 model)
matsDANt1 <- apply_thresholds(matsDANt0$A.norm.sub, matsDANt0$A.norm.mean,
                               mFilesDAN$r_t1, inds)

matsDANtx1 <- apply_thresholds(matsDANtx0$A.norm.sub, matsDANtx0$A.norm.mean,
                                mFilesDAN$r_tx_post, inds2)

matsDANl1 <- apply_thresholds(matsDANl0$A.norm.sub, matsDANl0$A.norm.mean,
                                   str_subset(mFilesDAN$r_tx_post, 
                                              paste(covars3$Study.ID, collapse = '|')), inds3)
matsDANl2 <- apply_thresholds(matsDANl0$A.norm.sub, matsDANl0$A.norm.mean,
                                  mFilesDAN$r_t2, inds3)


# Default mode network ------------------------------------------------------------------------

mFilesDMN <- ext_mat_files("dmn", dataCTRL, dataTMS)
matsDMNt0 <- cr_mats_soph(mFilesDMN$r_t0, inds, "consensus")

matsDMNtx0 <- cr_mats_soph(mFilesDMN$r_tx_pre, inds2, "consensus")

matsDMNl0 <- cr_mats_soph(str_subset(
    mFilesDMN$r_tx_pre, paste(covars3$Study.ID, collapse = '|')), inds3, "consensus")

# Longitudinal matrices (T0 model)
matsDMNt1 <- apply_thresholds(matsDMNt0$A.norm.sub, matsDMNt0$A.norm.mean,
                               mFilesDMN$r_t1, inds)

matsDMNtx1 <- apply_thresholds(matsDMNtx0$A.norm.sub, matsDMNtx0$A.norm.mean,
                                mFilesDMN$r_tx_post, inds2)

matsDMNl1 <- apply_thresholds(matsDMNl0$A.norm.sub, matsDMNl0$A.norm.mean,
                               str_subset(mFilesDMN$r_tx_post, 
                                          paste(covars3$Study.ID, collapse = '|')), inds3)
matsDMNl2 <- apply_thresholds(matsDMNl0$A.norm.sub, matsDMNl0$A.norm.mean,
                               mFilesDMN$r_t2, inds3)


# Fronto-parietal network ---------------------------------------------------------------------

mFilesFPN <- ext_mat_files("fp_tc", dataCTRL, dataTMS)
matsFPNt0 <- cr_mats_soph(mFilesFPN$r_t0, inds, "consensus")

matsFPNtx0 <- cr_mats_soph(mFilesFPN$r_tx_pre, inds2, "consensus")

matsFPNl0 <- cr_mats_soph(str_subset(
    mFilesFPN$r_tx_pre, paste(covars3$Study.ID, collapse = '|')), inds3, "consensus")

# Longitudinal matrices (T0 model)
matsFPNt1 <- apply_thresholds(matsFPNt0$A.norm.sub, matsFPNt0$A.norm.mean,
                               mFilesFPN$r_t1, inds)

matsFPNtx1 <- apply_thresholds(matsFPNtx0$A.norm.sub, matsFPNtx0$A.norm.mean,
                                mFilesFPN$r_tx_post, inds2)

matsFPNl1 <- apply_thresholds(matsFPNl0$A.norm.sub, matsFPNl0$A.norm.mean,
                                   str_subset(mFilesFPN$r_tx_post, 
                                              paste(covars3$Study.ID, collapse = '|')), inds3)
matsFPNl2 <- apply_thresholds(matsFPNl0$A.norm.sub, matsFPNl0$A.norm.mean,
                                  mFilesFPN$r_t2, inds3)


# Salience network ----------------------------------------------------------------------------

mFilesSAL <- ext_mat_files("sal", dataCTRL, dataTMS)
matsSALt0 <- cr_mats_soph(mFilesSAL$r_t0, inds, "consensus")

matsSALtx0 <- cr_mats_soph(mFilesSAL$r_tx_pre, inds2, "consensus")

matsSALl0 <- cr_mats_soph(str_subset(
    mFilesSAL$r_tx_pre, paste(covars3$Study.ID, collapse = '|')), inds3, "consensus")

# Longitudinal matrices (T0 model)
matsSALt1 <- apply_thresholds(matsSALt0$A.norm.sub, matsSALt0$A.norm.mean,
                               mFilesSAL$r_t1, inds)

matsSALtx1 <- apply_thresholds(matsSALtx0$A.norm.sub, matsSALtx0$A.norm.mean,
                                mFilesSAL$r_tx_post, inds2)

matsSALl1 <- apply_thresholds(matsSALl0$A.norm.sub, matsSALl0$A.norm.mean,
                                   str_subset(mFilesSAL$r_tx_post, 
                                              paste(covars3$Study.ID, collapse = '|')), inds3)
matsSALl2 <- apply_thresholds(matsSALl0$A.norm.sub, matsSALl0$A.norm.mean,
                                  mFilesSAL$r_t2, inds3)


# Subcortical network -------------------------------------------------------------------------

mFilesSUB <- ext_mat_files("subc", dataCTRL, dataTMS)
matsSUBt0 <- cr_mats_soph(mFilesSUB$r_t0, inds, "consensus")

matsSUBtx0 <- cr_mats_soph(mFilesSUB$r_tx_pre, inds2, "consensus")

matsSUBl0 <- cr_mats_soph(str_subset(
    mFilesSUB$r_tx_pre, paste(covars3$Study.ID, collapse = '|')), inds3, "consensus")

# Longitudinal matrices (T0 model)
matsSUBt1 <- apply_thresholds(matsSUBt0$A.norm.sub, matsSUBt0$A.norm.mean,
                               mFilesSUB$r_t1, inds)

matsSUBtx1 <- apply_thresholds(matsSUBtx0$A.norm.sub, matsSUBtx0$A.norm.mean,
                                mFilesSUB$r_tx_post, inds2)

matsSUBl1 <- apply_thresholds(matsSUBl0$A.norm.sub, matsSUBl0$A.norm.mean,
                                   str_subset(mFilesSUB$r_tx_post, 
                                              paste(covars3$Study.ID, collapse = '|')), inds3)
matsSUBl2 <- apply_thresholds(matsSUBl0$A.norm.sub, matsSUBl0$A.norm.mean,
                                  mFilesSUB$r_t2, inds3)


# Ventral attention network -------------------------------------------------------------------

mFilesVAN <- ext_mat_files("v_att", dataCTRL, dataTMS)
matsVANt0 <- cr_mats_soph(mFilesVAN$r_t0, inds, "consensus")

matsVANtx0 <- cr_mats_soph(mFilesVAN$r_tx_pre, inds2, "consensus")

matsVANl0 <- cr_mats_soph(str_subset(
    mFilesVAN$r_tx_pre, paste(covars3$Study.ID, collapse = '|')), inds3, "consensus")

# Longitudinal matrices (T0 model)
matsVANt1 <- apply_thresholds(matsVANt0$A.norm.sub, matsVANt0$A.norm.mean,
                               mFilesVAN$r_t1, inds)

matsVANtx1 <- apply_thresholds(matsVANtx0$A.norm.sub, matsVANtx0$A.norm.mean,
                                mFilesVAN$r_tx_post, inds2)

matsVANl1 <- apply_thresholds(matsVANl0$A.norm.sub, matsVANl0$A.norm.mean,
                                   str_subset(mFilesVAN$r_tx_post, 
                                              paste(covars3$Study.ID, collapse = '|')), inds3)
matsVANl2 <- apply_thresholds(matsVANl0$A.norm.sub, matsVANl0$A.norm.mean,
                                  mFilesVAN$r_t2, inds3)

