%% Figure 1
dataPath = [rawPath,'/Figure 1'];
close all;clc;
figure; set(gcf,'position',[109 1482 1000 300]); 
%set(gcf, 'PaperUnits', 'centimeters'); set(gcf, 'PaperSize', [17.4 5.5]);
rN = 2; cN =3;

% Figure 1A: IHC image of the SC
subplot(rN,cN,1)
I = imread('Figure1-A.tif');imshow(I);
ax = gca; %ap = ax.Position; ax.Position= ap.*[1 1 1 1];
ap = ax.Position; ax.Position= ap.*[1 1 1 1];
title('A', 'FontSize', 10,'FontWeight','bold', 'Units','normalized','Position',[-.08 0.95  0]);

% Figure 1B: Depth distribution of labeled SC neurons
% Code to generate panel in "Jupyter scripts"
subplot(rN,cN,2)
I = imread('Figure1-B.tif');imshow(I);
ax = gca; ap = ax.Position; ax.Position= ap.*[1 1 1 1];
ap = ax.Position;ax.Position= ap-[0.105 0 0 0];
title('B', 'FontSize', 10,'FontWeight','bold', 'Units','normalized','Position',[-.08 0.95  0]);

% Figure 1C: IHC image of Gad2 projections
subplot(rN,cN,3)
I = imread('Figure1-C.tif');imshow(I);
ax = gca; ap = ax.Position; ax.Position= ap.*[1 1 1 1];
ap = ax.Position;ax.Position= ap-[0.21 0 0 0];
title('C', 'FontSize', 10, 'FontWeight','bold','Units','normalized','Position',[-.08 0.95 0]);

% Figure 1D: IHC image of Gad2 projections - zoomed in with terminals
subplot(rN,cN,[4, 5])
I = imread('Figure1-D.tif');imshow(I)
ax = gca; ap = ax.Position; ax.Position= ap.*[1 1 1 1];
ap = ax.Position;ax.Position= ap-[0.025 0 0 0];
title('D', 'FontSize', 10, 'FontWeight','bold','Units','normalized','Position',[-.035 0.95 0]);

% Figure 1E: boxplot of axon terminal densities
% Code to generate panel in "Jupyter scripts"
subplot(rN,cN,6)
I = imread('Figure1-E.tif');imshow(I)
ax = gca; ap = ax.Position; ax.Position= ap.*[1 1 1 1];
ap = ax.Position;ax.Position= ap-[0.205 0 0 0];
title('E', 'FontSize', 10, 'FontWeight','bold','Units','normalized','Position',[-0.08 0.95 0]);

set(gcf,'color','w');
tightfig

set(gcf,'renderer','Painters');
print(gcf,(fullfile(savePath,'Figure-1')), '-dpng', '-r300');
close all