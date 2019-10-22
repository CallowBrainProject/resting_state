#!/bin/tcsh

setenv FREESURFER_HOME /Applications/freesurfer/
source $FREESURFER_HOME/SetUpFreeSurfer.csh
setenv subjdir /Volumes/DANIEL/FAD_analysis

@ linenum = 1

cd ${subjdir}

foreach subj (FAD1015)
foreach cond (BL)

cd /Volumes/DANIEL/FAD_analysis/${subj}/${cond}/resting/
Dimon -infile_prefix /Volumes/DANIEL/FAD_analysis/${subj}/${cond}/resting/ -gert_create_dataset -gert_to3d_prefix ${subj}.${cond}.nii.gz

cd /Volumes/DANIEL/FAD_analysis/${subj}/${cond}/anat/T1/
Dimon -infile_prefix /Volumes/DANIEL/FAD_analysis/${subj}/${cond}/anat/T1/ -gert_create_dataset -gert_to3d_prefix ${subj}.${cond}.nii.gz

cd /Volumes/DANIEL/FAD_analysis/${subj}/${cond}/anat/T2/
Dimon -infile_prefix /Volumes/DANIEL/FAD_analysis/${subj}/${cond}/anat/T2/ -gert_create_dataset -gert_to3d_prefix ${subj}.${cond}.nii.gz

end

