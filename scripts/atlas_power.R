#!/usr/bin/Rscript

## Packages
library("data.table")
library("here")

## Set atlas variable
atlas <- "power264"

## Data.table
power264 <- fread(here("./data/raw/atlas_power_r.csv"), header = T)
power264[, `:=`(
    name = factor(name),
    lobe = factor(lobe),
    hemi = factor(hemi),
    network = factor(network),
    V9 = NULL)]

# Add label column
power264[network == "Sensory/somatomotor Hand", network_label := "SMH"]
power264[network == "Sensory/somatomotor Mouth", network_label := "SMM"]
power264[network == "Cingulo-opercular Task Control", network_label := "CON"]
power264[network == "Auditory", network_label := "AUD"]
power264[network == "Default mode", network_label := "DMN"]
power264[network == "Memory retrieval?", network_label := "MEM"]
power264[network == "Visual", network_label := "VIS"]
power264[network == "Fronto-parietal Task Control", network_label := "FPN"]
power264[network == "Salience", network_label := "SAL"]
power264[network == "Subcortical", network_label := "SUB"]
power264[network == "Ventral attention", network_label := "VAN"]
power264[network == "Dorsal attention", network_label := "DAN"]
power264[network == "Cerebellar", network_label := "CER"]
power264[network == "Uncertain", network_label := "UNC"]

## RDS object
saveRDS(power264, here("./data/processed/rds/power264.rds"))
