% This function converts GAN Nifti files to native Nifti files which
% are compatible for image registration (344 x 344 x 127)
%
% Author : Lalith Kumar Shiyam Sundar
% Date   : 18 November, 2019
%
% Inputs: 
%       [1]CGONinputs.path2GanNifti: file path to the nifti medical images.
%       [2]CGONinputs.where2Store: file path to store the generated images.
%
% Outputs: Folder containing the converted images. 
%
% Usage: convertGanOutputToNativeSpace(CGONinputs);
%       
%------------------------------------------------------------------------%
%                               Program start
%------------------------------------------------------------------------%

% create the folder where the cropped images will be stored.

cd(CGONinputs.where2Store)
splitFiles=regexp(CGONinputs.path2Nifti,filesep,'split');
convertedFolder=[splitFiles{end},'-','native'];
mkdir(convertedFolder); % creating the converted folder for storing
path2ConvFolder=[CNGinputs.where2Store,filesep,convertedFolder];


% load the nifti files.

cd(CGONinputs.path2GanNifti);
niftiFiles=dir('*.nii');
