#!/usr/bin/env sh

for gsig in gs ngs; do
	[ $gsig = ngs ] && orig="graphs_ngs_20210205" || orig="graphs_20210205"
	out="data/raw/timeseries/$gsig/"
	mkdir -p $out
	rsync -avzhLe ssh \
		--include "*/" --include "*ts.1D" --exclude "*" \
		ada:garzaLab/addimex_tms/derivatives/XCP/$orig $out \
		--progress \
		--prune-empty-dirs
	for atlas in data/raw/timeseries/$gsig/$orig/sub-???/ses-t*/fcon/*; do
		cp -r $atlas $out
	done
	rm -r $out/$orig
done
