# voxelPlotterを利用して、点群とグリッドを重ね合わせてみよう

この記事では、以下のように、3次元点群にグリッドを重ね合わせて表示する方法について紹介します。メインのコードである、`VoxelPlotter.m`は、以下のMATLAB Centralにて公開されているものを使いました。

https://jp.mathworks.com/matlabcentral/fileexchange/50802-voxelplotter

![image_0.png](README_images/teapot.gif)

# メインコード

アイデアとしては、voxelPlotter.mの結果と、点群をスケールが合うように同時にプロットするということです。なお、voxelPlotter.mについても、グリッドの透明度を変えられるように微調整しています。

```matlab:Code
clear;clc;close all

% グリッドサイズの設定。小さくするとよりたくさんグリッドが表示される
gridSize = 0.3;
% テストデータの読み込み
pt = pcread('teapot.ply');
% 最小値を用いて、原点方向にシフト
xyz = pt.Location-[pt.XLimits(1),pt.YLimits(1),pt.ZLimits(1)];
% 点群の変数を作成
pt_shifted = pointCloud(xyz);
% シフトしたあとの、座標の最大値を取得
xyzMax = [pt_shifted.XLimits(2),pt_shifted.YLimits(2),pt_shifted.ZLimits(2)];
% グリッドの作成
VoxelMat = ones(round(xyzMax./gridSize));
% 表示
figure('Visible','on')
% メインコード。3つめの引数で、グリッドの透明度を制御できる
[vol_handle]=VoxelPlotter(VoxelMat,1,0.3);hold on;
pcshow(pt_shifted.Location./gridSize)
```

