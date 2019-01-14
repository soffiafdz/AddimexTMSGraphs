
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
matsWBvs <- cr_mats_soph(mFilesWB$r_c, inds_p, "consensus")
matsWBt0 <- cr_mats_soph(mFilesWB$r_t0, inds, "consensus")
matsWBt1 <- cr_mats_soph(mFilesWB$r_t1, inds, "consensus")
matsWBtx0 <- cr_mats_soph(mFilesWB$r_tx_pre, inds2, "consensus")
matsWBtx1 <- cr_mats_soph(mFilesWB$r_tx_post, inds2, "consensus")
matsWBl0 <- cr_mats_soph(str_subset(
    mFilesWB$r_tx_pre, paste(covars3$Study.ID, collapse = '|')), inds3, "consensus")
matsWBl1 <- cr_mats_soph(str_subset(
    mFilesWB$r_tx_post, paste(covars3$Study.ID, collapse = '|')), inds3, "consensus")
matsWBl2 <- cr_mats_soph(mFilesWB$r_t2, inds3, "consensus")


# Cingulo-opercular network -------------------------------------------------------------------

mFilesCON <- ext_mat_files("co_tc", dataCTRL, dataTMS)
matsCONvs <- cr_mats_soph(mFilesCON$r_c, inds_p, "consensus")
matsCONt0 <- cr_mats_soph(mFilesCON$r_t0, inds, "consensus")
matsCONt1 <- cr_mats_soph(mFilesCON$r_t1, inds, "consensus")
matsCONtx0 <- cr_mats_soph(mFilesCON$r_tx_pre, inds2, "consensus")
matsCONtx1 <- cr_mats_soph(mFilesCON$r_tx_post, inds2, "consensus")
matsCONl0 <- cr_mats_soph(str_subset(
    mFilesCON$r_tx_pre, paste(covars3$Study.ID, collapse = '|')), inds3, "consensus")
matsCONl1 <- cr_mats_soph(str_subset(
    mFilesCON$r_tx_post, paste(covars3$Study.ID, collapse = '|')), inds3, "consensus")
matsCONl2 <- cr_mats_soph(mFilesCON$r_t2, inds3, "consensus")


# Default mode network ------------------------------------------------------------------------

mFilesDMN <- ext_mat_files("dmn", dataCTRL, dataTMS)
matsDMNvs <- cr_mats_soph(mFilesDMN$r_c, inds_p, "consensus")
matsDMNt0 <- cr_mats_soph(mFilesDMN$r_t0, inds, "consensus")
matsDMNt1 <- cr_mats_soph(mFilesDMN$r_t1, inds, "consensus")
matsDMNtx0 <- cr_mats_soph(mFilesDMN$r_tx_pre, inds2, "consensus")
matsDMNtx1 <- cr_mats_soph(mFilesDMN$r_tx_post, inds2, "consensus")
matsDMNl0 <- cr_mats_soph(str_subset(
    mFilesDMN$r_tx_pre, paste(covars3$Study.ID, collapse = '|')), inds3, "consensus")
matsDMNl1 <- cr_mats_soph(str_subset(
    mFilesDMN$r_tx_post, paste(covars3$Study.ID, collapse = '|')), inds3, "consensus")
matsDMNl2 <- cr_mats_soph(mFilesDMN$r_t2, inds3, "consensus")


# Dorsal attention network --------------------------------------------------------------------

mFilesDAN <- ext_mat_files("d_att", dataCTRL, dataTMS)
matsDANvs <- cr_mats_soph(mFilesDAN$r_c, inds_p, "consensus")
matsDANt0 <- cr_mats_soph(mFilesDAN$r_t0, inds, "consensus")
matsDANt1 <- cr_mats_soph(mFilesDAN$r_t1, inds, "consensus")
matsDANtx0 <- cr_mats_soph(mFilesDAN$r_tx_pre, inds2, "consensus")
matsDANtx1 <- cr_mats_soph(mFilesDAN$r_tx_post, inds2, "consensus")
matsDANl0 <- cr_mats_soph(str_subset(
    mFilesDAN$r_tx_pre, paste(covars3$Study.ID, collapse = '|')), inds3, "consensus")
matsDANl1 <- cr_mats_soph(str_subset(
    mFilesDAN$r_tx_post, paste(covars3$Study.ID, collapse = '|')), inds3, "consensus")
matsDANl2 <- cr_mats_soph(mFilesDAN$r_t2, inds3, "consensus")


# Fronto-parietal network ---------------------------------------------------------------------

mFilesFPN <- ext_mat_files("fp_tc", dataCTRL, dataTMS)
matsFPNvs <- cr_mats_soph(mFilesFPN$r_c, inds_p, "consensus")
matsFPNt0 <- cr_mats_soph(mFilesFPN$r_t0, inds, "consensus")
matsFPNt1 <- cr_mats_soph(mFilesFPN$r_t1, inds, "consensus")
matsFPNtx0 <- cr_mats_soph(mFilesFPN$r_tx_pre, inds2, "consensus")
matsFPNtx1 <- cr_mats_soph(mFilesFPN$r_tx_post, inds2, "consensus")
matsFPNl0 <- cr_mats_soph(str_subset(
    mFilesFPN$r_tx_pre, paste(covars3$Study.ID, collapse = '|')), inds3, "consensus")
matsFPNl1 <- cr_mats_soph(str_subset(
    mFilesFPN$r_tx_post, paste(covars3$Study.ID, collapse = '|')), inds3, "consensus")
matsFPNl2 <- cr_mats_soph(mFilesFPN$r_t2, inds3, "consensus")


# Salience network ----------------------------------------------------------------------------

mFilesSAL <- ext_mat_files("sal", dataCTRL, dataTMS)
matsSALvs <- cr_mats_soph(mFilesSAL$r_c, inds_p, "consensus")
matsSALt0 <- cr_mats_soph(mFilesSAL$r_t0, inds, "consensus")
matsSALt1 <- cr_mats_soph(mFilesSAL$r_t1, inds, "consensus")
matsSALtx0 <- cr_mats_soph(mFilesSAL$r_tx_pre, inds2, "consensus")
matsSALtx1 <- cr_mats_soph(mFilesSAL$r_tx_post, inds2, "consensus")
matsSALl0 <- cr_mats_soph(str_subset(
    mFilesSAL$r_tx_pre, paste(covars3$Study.ID, collapse = '|')), inds3, "consensus")
matsSALl1 <- cr_mats_soph(str_subset(
    mFilesSAL$r_tx_post, paste(covars3$Study.ID, collapse = '|')), inds3, "consensus")
matsSALl2 <- cr_mats_soph(mFilesSAL$r_t2, inds3, "consensus")


# Subcortical network -------------------------------------------------------------------------

mFilesSUB <- ext_mat_files("subc", dataCTRL, dataTMS)
matsSUBvs <- cr_mats_soph(mFilesSUB$r_c, inds_p, "consensus")
matsSUBt0 <- cr_mats_soph(mFilesSUB$r_t0, inds, "consensus")
matsSUBt1 <- cr_mats_soph(mFilesSUB$r_t1, inds, "consensus")
matsSUBtx0 <- cr_mats_soph(mFilesSUB$r_tx_pre, inds2, "consensus")
matsSUBtx1 <- cr_mats_soph(mFilesSUB$r_tx_post, inds2, "consensus")
matsSUBl0 <- cr_mats_soph(str_subset(
    mFilesSUB$r_tx_pre, paste(covars3$Study.ID, collapse = '|')), inds3, "consensus")
matsSUBl1 <- cr_mats_soph(str_subset(
    mFilesSUB$r_tx_post, paste(covars3$Study.ID, collapse = '|')), inds3, "consensus")
matsSUBl2 <- cr_mats_soph(mFilesSUB$r_t2, inds3, "consensus")


# Ventral attention network -------------------------------------------------------------------

mFilesVAN <- ext_mat_files("v_att", dataCTRL, dataTMS)
matsVANvs <- cr_mats_soph(mFilesVAN$r_c, inds_p, "consensus")
matsVANt0 <- cr_mats_soph(mFilesVAN$r_t0, inds, "consensus")
matsVANt1 <- cr_mats_soph(mFilesVAN$r_t1, inds, "consensus")
matsVANtx0 <- cr_mats_soph(mFilesVAN$r_tx_pre, inds2, "consensus")
matsVANtx1 <- cr_mats_soph(mFilesVAN$r_tx_post, inds2, "consensus")
matsVANl0 <- cr_mats_soph(str_subset(
    mFilesVAN$r_tx_pre, paste(covars3$Study.ID, collapse = '|')), inds3, "consensus")
matsVANl1 <- cr_mats_soph(str_subset(
    mFilesVAN$r_tx_post, paste(covars3$Study.ID, collapse = '|')), inds3, "consensus")
matsVANl2 <- cr_mats_soph(mFilesVAN$r_t2, inds3, "consensus")

