#!/usr/bin/env sh

rsync -avzhLe ssh \
  --include "*/" --include "*ts.1D" --exclude "*" \
  sfernandezl@ada.lavis.unam.mx:garzaLab/addimex_tms/derivatives/XCP \
  inData/timeSeries \
  --progress \
  --prune-empty-dirs

for network in inData/timeSeries/XCP/sub-???/ses-t*/fcon/*
do cp -r $network inData/timeSeries
done

rm -r inData/timeSeries/XCP
