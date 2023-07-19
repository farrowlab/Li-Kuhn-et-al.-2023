%% Figure 6
dataPath = [rawPath,'/Figure 6'];
close all;clc;
figure; set(gcf,'position',[109 1482 1300 300]); 
%set(gcf, 'PaperUnits', 'centimeters'); set(gcf, 'PaperSize', [17.4 5.5]);
rN = 2; cN =4;

% Figure 6A: Example responses
subplot(rN,cN,[1,5])
I = imread('Figure6-A.tif');imshow(I)
%ax = gca; ap = ax.Position; ax.Position= ap.*[1 1 1 1];
%ap = ax.Position;ax.Position= ap+[0.105 0 0 0];
title('A', 'FontSize', 10, 'FontWeight','bold','Units','normalized','Position',[-.08 0.95 0]);

% Figure 6B: Mean responses to running onset
% Code to generate panel in "Jupyter scripts"
subplot(rN,cN,[2,6])
I = imread('Figure6-B.tif');imshow(I)
%ax = gca; ap = ax.Position; ax.Position= ap.*[1 1 1 1];
%ap = ax.Position;ax.Position= ap+[0.105 0 0 0];
title('B', 'FontSize', 10, 'FontWeight','bold','Units','normalized','Position',[-.08 0.95 0]);

% Figure 6C: 2D distribution of visual peak and running responses
% Code to generate panel in "Jupyter scripts"
subplot(rN,cN,[3,7])
I = imread('Figure6-C.tif');imshow(I)
%ax = gca; ap = ax.Position; ax.Position= ap.*[1 1 1 1];
%ap = ax.Position;ax.Position= ap+[0.105 0 0 0];
title('C', 'FontSize', 10, 'FontWeight','bold','Units','normalized','Position',[-.08 0.95 0]);

% Figure 6D: Modulation by running
% Code to generate panel in "Jupyter scripts"
subplot(rN,cN,4)
I = imread('Figure6-D.tif');imshow(I)
%ax = gca; ap = ax.Position; ax.Position= ap.*[1 1 1 1];
%ap = ax.Position;ax.Position= ap+[0.105 0 0 0];
title('D', 'FontSize', 10, 'FontWeight','bold','Units','normalized','Position',[-.08 0.95 0]);

% Figure 6E: Correlation with running
% Code to generate panel in "Jupyter scripts"
subplot(rN,cN,8)
I = imread('Figure6-E.tif');imshow(I)
%ax = gca; ap = ax.Position; ax.Position= ap.*[1 1 1 1];
%ap = ax.Position;ax.Position= ap+[0.105 0 0 0];
title('E', 'FontSize', 10, 'FontWeight','bold','Units','normalized','Position',[-.08 0.95 0]);

tightfig

set(gcf,'renderer','Painters');
print(gcf,(fullfile(savePath,'Figure-6')), '-dpng', '-r300');
close all