%------------------------------------------------------------------------%
% This function removes the empty image pairs to prevent unwanted
% calculation
% 
%
% Author : Lalith Kumar Shiyam Sundar
% Date   : 3 December, 2019
%
% Inputs: 
%       [1]RESinputs.pathOfImagePairs: file path to the image-pairs
%
% Outputs: Image-pairs that contain information.
%
% Usage: removeEmptySlices(RESinputs);
%       
%------------------------------------------------------------------------%
%                           Program start
%------------------------------------------------------------------------%
function []=removeEmptySlices(RESinputs)

% move inputs to local variables

pathOfImgPairs=RESinputs.pathOfImagePairs;

% Operation of removing empty image pairs

cd(pathOfImgPairs);

imgFiles=dir('*jpg*');
if isempty(imgFiles)
    imgFiles=dir('*png*');
end

parfor lp=1:length(imgFiles)
    img=imread(imgFiles(lp).name);
    if sum(img(:))==0
        imageIsEmpty=true;
    else
        imageIsEmpty=false;
    end
    if imageIsEmpty==true
        delete(imgFiles(lp).name);
    else
        continue
    end
end
end