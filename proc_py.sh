#!/bin/tcsh

setenv FREESURFER_HOME /Applications/freesurfer/
source $FREESURFER_HOME/SetUpFreeSurfer.csh
setenv subjdir /Volumes/DANIEL/FAD_analysis
setenv dicoms /Volumes/DANIEL/FAD_raw

@ linenum = 1

cd ${subjdir}

foreach subj (FAD1015)
foreach cond (BL)

cd ${subjdir}/${subj}/${cond}
afni_proc.py \
-dsets resting/${subj}.${cond}.nii.gz \
-copy_anat anat/T1/${subj}.${cond}.nii.gz \
-blocks despike tshift align tlrc volreg blur mask scale regress \
-tcat_remove_first_trs 3 \
-tlrc_base MNI152_T1_2009c+tlrc \
-tlrc_NL_warp \
-volreg_align_e2a \
-volreg_tlrc_warp \
-mask_epi_anat yes \
-regress_censor_motion 0.2 \
-regress_censor_outliers 0.05 \
-regress_bandpass 0.01 0.1 \
-regress_apply_mot_types demean deriv \
-regress_est_blur_epits \
-regress_est_blur_errts

end
end

