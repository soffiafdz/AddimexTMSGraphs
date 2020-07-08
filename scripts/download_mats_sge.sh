#!/usr/bin/env sh

rsync -avzhLe ssh \
  --include "*/" --include "*ts.1D" --exclude "*" \
  sfernandezl@ada.lavis.unam.mx:garzaLab/addimex_tms/derivatives/XCP/XCP_FEB2020 \
  data/raw/timeseries \
  --progress \
  --prune-empty-dirs

for network in data/raw/timeseries/XCP_FEB2020/sub-???/ses-t*/fcon/*
do cp -r $network data/raw/timeseries
done

rm -r data/raw/timeseries/XCP_FEB2020
