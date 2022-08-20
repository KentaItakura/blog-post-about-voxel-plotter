%Author: Itzik Ben Shabat
%Date: 10.5.15

function [vol_handle]=VoxelPlotter(VoxelMat,Vox_Size,FaceAlpha)
%detect the external voxels and faces
vol_handle=0;
if nargin==1
Vox_Size=1;
end
    FV=FindExternalVoxels(VoxelMat,Vox_Size);
%plot only external faces of external voxels
cla;
if size(FV.vertices,1)==0
    cla;
else
vol_handle=patch(FV,'FaceColor','r','FaceAlpha',FaceAlpha);
%use patchslim here for better results
end
end

