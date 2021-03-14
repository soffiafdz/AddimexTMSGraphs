## Small.world data.tale
sworld <- map(rnets, "small")

for (i in seq_along(names(sworld))) {
  sworld[[i]][, Session := names(sworld)[i]]
}

sworld <- rbindlist(sworld)

thresh <- unique(metrics[, threshold])
for (i in seq_along(thresh)) {
  sworld[threshold == i, threshold_new := thresh[i]]
}

sworld[, threshold := NULL]
setnames(sworld, "threshold_new", "threshold")
setkey(sworld, threshold, Session, Study.ID)

## Join
gattr <- metrics[sworld]
# gattr[, c("atlas", "modality", "i.density", "i.Lp", "i.Cp", "i.Group") := NULL]
## Set new column order
setcolorder(gattr,
  c("Study.ID", "Session", "Group", "threshold",
    "strength", "E.local", "E.local.wt", "E.global", "E.global.wt",
    "sigma", "density", "N",
    "Cp", "Cp.norm", "Cp.rand", "Lp", "Lp.norm", "Lp.rand",
    "mod.wt", "diameter.wt", "num.hubs.wt"))

set(gattr, NULL, names(gattr[,mod:i.Group]), NULL)

## Save rds object
write_rds(gattr, here("./data/processed/rds/gph_attr.rds"))

