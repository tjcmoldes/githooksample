#!/bin/sh

Path=/home/training/iVenture
ParamFile1=version.properties
ParamFile2=versioncopy.properties
ParamName=flavor_sunmi_versionCode

ParamData=`cat ${Path}/${ParamFile1} | grep ${ParamName} | cut -d ""="" -f 2`
addMe=1

sumMe=`expr $ParamData + $addMe`

awk -F"=" -v newval="$sumMe" -v OFS='=' '/flavor_sunmi_versionCode/{$2=newval;print;next}1' $ParamFile1 > $ParamFile2
awk -F'=' -v newval="$sumMe" -v OFS='=' '/flavor_sunmi_versionCode/{$2=newval;print;next}1' $ParamFile2 > $ParamFile1

