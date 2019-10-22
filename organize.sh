#!/bin/tcsh

setenv FREESURFER_HOME /Applications/freesurfer/
source $FREESURFER_HOME/SetUpFreeSurfer.csh
setenv subjdir /Volumes/DANIEL/FAD_analysis
setenv dicoms /Volumes/DANIEL/FAD_raw

@ linenum = 1

cd ${subjdir}

foreach subj (FAD1015)
foreach cond (BL)

mkdir /Volumes/DANIEL/FAD_analysis/${subj}
mkdir /Volumes/DANIEL/FAD_analysis/${subj}/${cond}
mkdir /Volumes/DANIEL/FAD_analysis/${subj}/${cond}/resting
mkdir /Volumes/DANIEL/FAD_analysis/${subj}/${cond}/anat
mkdir /Volumes/DANIEL/FAD_analysis/${subj}/${cond}/anat/T1
mkdir /Volumes/DANIEL/FAD_analysis/${subj}/${cond}/anat/T2


cp ${dicoms}/${subj}/${cond}/*rest/*.dcm /Volumes/DANIEL/FAD_analysis/${subj}/${cond}/resting/

cd ${dicoms}/${subj}/${cond}/4-T1w_MPR_R0.8C/
cp *.dcm /Volumes/DANIEL/FAD_analysis/${subj}/${cond}/anat/T1/

cd ${dicoms}/${subj}/${cond}/6-T2w_SPC_R0.8C/
cp *.dcm /Volumes/DANIEL/FAD_analysis/${subj}/${cond}/anat/T2/

end

