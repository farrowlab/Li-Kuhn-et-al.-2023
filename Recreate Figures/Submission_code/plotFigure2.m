%% Figure 2
dataPath = [rawPath,'/Figure 2'];
close all;clc;
figure; set(gcf,'position',[109 1482 1000 150]); 
%set(gcf, 'PaperUnits', 'centimeters'); set(gcf, 'PaperSize', [17.4 5.5]);
rN = 1; cN =4;
% Figure 2D: bar plot
subplot(rN,cN,4)
%------load experiment group mean data 
load(fullfile(dataPath,'total_CellNum.mat'));
m1 = tbl.Mean;err = tbl.SEM;
disp('experiment'); disp(tbl);disp(tbl_pVal)
bb = bar(m1,'FaceColor','flat','FaceAlpha',1,'LineWidth',1);hold on
nbars = length(m1);groupwidth = min(0.8, nbars/(nbars + 1.5));
x = [1 2 3];
for k =1:nbars
    bb.CData(k,:) = coll(k,:);
    %set the errors
    e = errorbar(x(k), m1(k),-err(k), err(k),'.'); e.Color = [0.3 0.3 0.3]; e.LineWidth = 2;
end
ax = gca;ax.YLim = [0 100];
row1 = {'LGN','Pbg','Both'}; row2 = {'only','only',''};
labelArray = [row1; row2]; 
tickLabels = strtrim(sprintf('%s\\newline%s\n', labelArray{:}));
set(gca,'XTickLabel',tickLabels,'fontsize',8);
ap = ax.Position; ax.Position= ap .*[1 2 1 0.8];
ax.TickDir= 'out';
ylabel({'% of labeled neurons'},'Fontsize',10);set(gca,'box','off','color','none');
title('D', 'FontSize', 10, 'FontWeight','bold','Units','normalized','Position',[-0.2 0.98 0]);

% Figure 2C: IHC image: zoom version
subplot(rN,cN,3)
I = imread('Figure2-C.tif');imshow(I);
ax = gca; ap = ax.Position; ax.Position= ap.*[1 1 1 1];
title('C', 'FontSize', 10,'FontWeight','bold', 'Units','normalized','Position',[-.08 0.95  0]);

% Figure 2B: IHC image
subplot(rN,cN,2)
I = imread('Figure2-B.tif');imshow(I);
ax = gca; ap = ax.Position; ax.Position= ap.*[1 1 1 1];
ap = ax.Position;ax.Position= ap+[0.05 0 0 0];
title('B', 'FontSize', 10, 'FontWeight','bold','FontWeight','bold','Units','normalized','Position',[-.08 0.95 0]);

% Figure 2A: Injection schematic
rN = 1; cN = 4;
subplot(rN,cN,1)
I = imread('Figure2-A.tif');imshow(I)
ax = gca; ap = ax.Position; ax.Position= ap.*[1 1 1 1];
ap = ax.Position;ax.Position= ap+[0.105 0 0 0];
title('A', 'FontSize', 10, 'FontWeight','bold','Units','normalized','Position',[-.08 0.95 0]);

tightfig
