
clear 
close all
clc
%Generating sinthetic input
gridSize = 0.3;


pt = pcread('teapot.ply');
xyz = pt.Location-[pt.XLimits(1),pt.YLimits(1),pt.ZLimits(1)];
pt_shifted = pointCloud(xyz);

xyzMax = [pt_shifted.XLimits(2),pt_shifted.YLimits(2),pt_shifted.ZLimits(2)];

VoxelMat = ones(round(xyzMax./gridSize));

[vol_handle]=VoxelPlotter(VoxelMat,1,0.3);hold on;
%visual effects (I recommend using the FigureRotator function from MATLAB
%Centeral
view(3);
daspect([1,1,1]);
% set(gca,'xlim',[0 gridSize], 'ylim',[0 gridSize], 'zlim',[0 gridSize]);
pcshow(pt_shifted.Location./gridSize)