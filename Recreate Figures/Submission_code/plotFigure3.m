%% Figure 3 F-G-H-I
dataPath = [rawPath,'/Figure 3'];
close all;clc;
figure; set(gcf,'position',[109 1482 1000 150]); 
rN = 1; cN =4;sz = 7;ls = 0.12;

% Figure 3I: 
load(fullfile(dataPath,'RGC_molecularPer'));

per = table2array(RGC_molecularPer(:,1:2));
err = table2array(RGC_molecularPer(:,3:4));
subplot(rN,cN,4)
b = bar(per,'FaceColor','flat','EdgeColor','k','LineWidth',0.8,'BarWidth',0.8,'FaceAlpha',1)%,'LineStyle','none');
for k = 1: size(per,2)
    b(k).CData = [col(k,:)]
end
hold on
ngroups = size(per, 1);nbars = size(per, 2);
% Calculating the width for each bar group
groupwidth = min(0.8, nbars/(nbars + 1.5));

for i = 1:nbars
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    errorbar(x, per(:,i), err(:,i), '.','Color',col(i,:),'LineWidth',2,'CapSize',6);
end
%legend({'Gad2LGN','Gad2Pbg'},'Location','northeast','box' ,'off')
legend off;
ylabel('% of GFP^+ RGCs');
tickLabels = {'CART','SMI32','FOXP2'}; 
set(gca,'XTickLabel',tickLabels,'fontsize',8);
set(gca,'box','off','color','none');
title('I', 'FontSize', 10, 'FontWeight','bold','Units','normalized','Position',[-0.2 0.95 0]);
rN = 4; cN = 4;

% Figure 3A: Injection schematic
subplot(rN,cN,1)
I = imread('Figure3-A.tif');imshow(I)
ax = gca; ap = ax.Position; ax.Position= ap.*[1 1 1 1];
ap = ax.Position;ax.Position= ap+[0.105 0 0 0];
title('A', 'FontSize', 10,  'FontWeight','bold','Units','normalized','Position',[-.08 0.95 0]);

% Figure 3B: IHC image
subplot(rN,cN,5)
I = imread('Figure3-B.tif');imshow(I);
ax = gca; ap = ax.Position; ax.Position= ap.*[1 1 1 1];
ap = ax.Position;ax.Position= ap+[0.05 0 0 0];
title('B', 'FontSize', 10,  'FontWeight','bold','Units','normalized','Position',[-.08 0.95 0]);

% Figure 3C: Injection schematic
subplot(rN,cN,[2, 3])
I = imread('Figure3-C.tif');imshow(I)
ax = gca; ap = ax.Position; ax.Position= ap.*[1 1 1 1];
ap = ax.Position;ax.Position= ap+[0.105 0 0 0];
title('C', 'FontSize', 10,  'FontWeight','bold','Units','normalized','Position',[-.08 0.95 0]);

% Figure 3D: IHC image
subplot(rN,cN,[6,7])
I = imread('Figure3-D.tif');imshow(I);
ax = gca; ap = ax.Position; ax.Position= ap.*[1 1 1 1];
ap = ax.Position;ax.Position= ap+[0.05 0 0 0];
title('D', 'FontSize', 10,  'FontWeight','bold','Units','normalized','Position',[-.08 0.95 0]);

% Figure 3E: Injection schematic
subplot(rN,cN,[4, 8])
I = imread('Figure3-E.tif');imshow(I)
ax = gca; ap = ax.Position; ax.Position= ap.*[1 1 1 1];
ap = ax.Position;ax.Position= ap+[0.105 0 0 0];
title('E', 'FontSize', 10,  'FontWeight','bold','Units','normalized','Position',[-.08 0.95 0]);

% Figure 3F: Injection schematic
subplot(rN,cN,9)
I = imread('Figure3-F.tif');imshow(I)
ax = gca; ap = ax.Position; ax.Position= ap.*[1 1 1 1];
ap = ax.Position;ax.Position= ap+[0.105 0 0 0];
title('F', 'FontSize', 10,  'FontWeight','bold','Units','normalized','Position',[-.08 0.95 0]);

% Figure 3G: IHC image
subplot(rN,cN,10)
I = imread('Figure3-G.tif');imshow(I);
ax = gca; ap = ax.Position; ax.Position= ap.*[1 1 1 1];
ap = ax.Position;ax.Position= ap+[0.05 0 0 0];
title('G', 'FontSize', 10,  'FontWeight','bold','Units','normalized','Position',[-.08 0.95 0]);

% Figure 3I: IHC image
subplot(rN,cN,12)
I = imread('Figure3-I.tif');imshow(I);
ax = gca; ap = ax.Position; ax.Position= ap.*[1 1 1 1];
ap = ax.Position;ax.Position= ap+[0.05 0 0 0];
title('I', 'FontSize', 10,  'FontWeight','bold','Units','normalized','Position',[-.08 0.95 0]);

% Figure 3J: IHC image
subplot(rN,cN,[13, 14, 15, 16])
I = imread('Figure3-J.tif');imshow(I);
ax = gca; ap = ax.Position; ax.Position= ap.*[1 1 1 1];
ap = ax.Position;ax.Position= ap+[0.05 0 0 0];
title('J', 'FontSize', 10,  'FontWeight','bold','Units','normalized','Position',[-.08 0.95 0]);

% Figure 3H
load(fullfile(dataPath,'RGC_diameter.mat'));
subplot(rN,cN,11)
for s = 1: 4
    xx1 = [];xx1 = 0.3+(s-1);xx2 = [];xx2 = 0.7 + (s-1);
    yy1 = [];yy1 = RGC_diameter{1,s}; % read diameter from LGN circuit
    yy2 = [];yy2 =  RGC_diameter{2,s} % read diameter from PBG circuit
    med1 = [];med1 = median(2*sqrt(yy1./pi)); % median - LGN
    med2 = [];med2 = median(2*sqrt(yy2./pi)); % median - PBG
    
    scatter(repmat(xx1,length(yy1),1),2*sqrt(yy1./pi),sz,'filled','MarkerFaceColor',col(1,:),...
        'jitter','on','jitterAmount',0.09);hold on
    plot ([xx1-ls,xx1+ls],[med1 med1],'linewidth',3,'Color',col(1,:));
    
    scatter(repmat(xx2,length(yy2),1),2*sqrt(yy2./pi),sz,'filled','MarkerFaceColor',col(2,:),...
        'jitter','on','jitterAmount',0.09);
    plot ([xx2-ls,xx2+ls],[med2 med2],'linewidth',3,'Color',col(2,:));
end
ax = gca; ap = ax.Position;ax.Position= ap+[0.02 0 0 0];
ap = ax.Position; ax.Position= ap .*[1 1 0.96 1];
ylim([0 500]);
set(gca,'box','off','color','none','XTick',[0.5 1.5 2.5 3.5],...
    'XTickLabel',{'bistratified','below ChAT','between ChAT','above ChAT'}, ...
    'XTickLabelRotation',45,'Fontsize',8);
ylabel({'Dendritic diameter (um)'},'Fontsize',10);set(gca,'box','off','color','none');
title('H', 'FontSize', 10,  'FontWeight','bold','Units','normalized','Position',[-0.15 0.95 0]);

tightfig
