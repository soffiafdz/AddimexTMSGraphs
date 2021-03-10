#!/usr/bin/env sh

input=~/garzaLab/addimex_tms/derivatives/XCP
for gsig in gs ngs; do
	[ $gsig = ngs ] && orig="graphs_ngs_20210205" || orig="graphs_20210205"
	out="data/raw/timeseries/$gsig/"
	mkdir -p $out
	for atlas in $input/$orig/sub-???/ses-t*/fcon/*
	do
		if [ -d $atlas ]
		then
			dest=$out/${atlas##*/}
			[ ! -e $dest ] && mkdir -p $dest
			cp -sv $atlas/*ts.1D $dest
		fi
	done
done

