%% Figure 8
dataPath = [rawPath,'/Figure 8'];
close all;clc;
figure; set(gcf,'position',[-192 940 1000 800]);
rN = 6; cN = 4;
% different behavioral types:
newColors = [...
    191,212,95; %Green----Freeze & Pauses_Freeze
    135, 115, 178; %Purple----Escape & Pauses_Escape
    198,198,198; %Gray----No_Response
    255,222,59]./255; %Yellow---- Pauses 
newColors2 = [0, 0, 0; 198,198,198]./255;
colseq = [coll(3,:); coll(1,:); coll(2,:);coll(1,:); coll(2,:);]

%% Figure 8E-F
load OptoBehaviorPercentage; 
% ---- bar plot - left panel
fN = [7 11];subplot(rN,cN,fN);
ln = length(plot_per);
plot_behavior(:,1)= plot_per(:,1) + plot_per(:,2);
plot_behavior(:,2)= plot_per(:,3);
bb = bar(plot_behavior,'stack','FaceColor','flat');
for jj = 1: 2
    bb(jj).CData = repmat(newColors2(jj,:),ln,1);
end
labelName = {'CTR','LGN','PBG','LGN','PBG'};
text(2.36,-10,'ACA','fontsize',8,'fontweight','bold');
text(4.36,-10,'ZI','fontsize',8,'fontweight','bold')

ax = gca;set(ax,'color','none','box','off');
ax.XTickLabel = labelName;%ax.TickLabelInterpreter = 'latex';
ax.XTickLabelRotation = 0;ax.FontSize = 8;
ylabel({'Probability of behavioral responses'});%title('Behavioral Scoring');
ax = gca; ap = ax.Position; ax.Position= ap.*[1 1 1 1];
ap = ax.Position;ax.Position= ap+[0.02 0 0 0];
title('E', 'FontSize', 10, 'FontWeight','bold','FontWeight','bold','Units','normalized','Position',[-.12 0.98 0]);

% ---- bar plot - right panel
fN = [8 12];subplot(rN,cN,fN);
ln = length(plot_per_norm);
bb = bar(plot_per_norm,'stack','FaceColor','flat');
for jj = 1:2
    bb(jj).CData = repmat(newColors(jj,:),ln,1);
end
labelName = {'CTR','LGN','PBG','LGN','PBG'};
text(2.36,-10,'ACA','fontsize',8,'fontweight','bold');
text(4.36,-10,'ZI','fontsize',8,'fontweight','bold');

ax = gca;set(ax,'color','none','box','off');
ax.XTickLabel = labelName;%ax.TickLabelInterpreter = 'latex';
ax.XTickLabelRotation = 0;ax.FontSize = 8;
ylabel({'Probability of behavioral responses'});%title('Behavioral Scoring');
ax = gca; ap = ax.Position; ax.Position= ap.*[1 1 1 1];
ap = ax.Position;ax.Position= ap+[0.02 0 0 0];
title('F', 'FontSize', 10, 'FontWeight','bold','FontWeight','bold','Units','normalized','Position',[-.12 0.98 0]);

%% Figure 8G-H
load OptoBehaviorCDF; 

% ACA-Freeze
fN = [19 23];subplot(rN,cN,fN);hold on
for i = 1:2
    plot(plot_time,CDF_f(i,:),'color',col(i,:),'linewidth',2);
end
ax = gca;ax.XLim = [-1 15];ax.YLim = [0 1];%ax.PlotBoxAspectRatio = [2 1 1];
plot([0,0],[0,0],'-.','color',[0.7 0.7 0.7],'linewidth',1);
ax = gca;set(ax,'color','none','box','off');
hold off;ax.XGrid = 'on';
ax.XTick = [0.5:1:15.5];
ax.XTickLabel = {'1','','','','5','','','','','10','','','','','15'};
ax.YTick = [0:0.5:1];
xlabel('# trials');ylabel('Cumulative probability');
text(5,1.1,'ACA-Freeze','color',newColors(1,:),'FontSize', 10, 'FontWeight','bold');
ax = gca; ap = ax.Position; ax.Position= ap.*[1 1 1 1];
ap = ax.Position;ax.Position= ap+[0.02 0 0 0];
title('G', 'FontSize', 10,'color','k','FontWeight','bold','Units','normalized','Position',[-.12 0.98 0]);

% ZI-Escape
fN = [20 24];subplot(rN,cN,fN);hold on
for i = 1:2
    plot(plot_time,CDF_e(i,:),'color',col(i,:),'linewidth',2);
end
ax = gca;ax.XLim = [-1 15];ax.YLim = [0 1]%;ax.PlotBoxAspectRatio = [2 1 1];
plot([0,0],[0,0],'-.','color',[0.7 0.7 0.7],'linewidth',1);
ax = gca;set(ax,'color','none','box','off');
hold off;ax.XGrid = 'on';
ax.XTick = [0.5:1:15.5];
ax.XTickLabel = {'1','','','','5','','','','','10','','','','','15'};
ax.YTick = [0:0.5:1];
xlabel('# trials');
text(5,1.1,'ZI-Escape','color',newColors(2,:),'FontSize', 10, 'FontWeight','bold');
ax = gca; ap = ax.Position; ax.Position= ap.*[1 1 1 1];
ap = ax.Position;ax.Position= ap+[0.02 0 0 0];
title('H', 'FontSize', 10,'color','k','FontWeight','bold','Units','normalized','Position',[-.12 0.98 0]);

%% Figure 8D
load OptoBehaviorSpeed;
fN = [5 9 13 17 21];
labels = OptoBehaviorSpeed(:,1);
for i = 1:length(labels)
    subplot(rN, cN,fN(i));hold on
    yy = OptoBehaviorSpeed{i,2};
    plot(dt,yy,'color',colseq(i,:),'linewidth',2);
    %set axis
    ax = gca;ax.XLim = [-1.8 5];
    yl = ax.YLim;ax.YLim = [0 50];
    plot([0,0],[0,yl(2)],'-.','color',[0.7 0.7 0.7],'linewidth',1);
    ax = gca;set(ax,'color','none','box','off');
    ax.XTick = [-2:2:4];ylabel('speed (cm/s)');
    ax.PlotBoxAspectRatio = [2 1 1];
    text(-2.3,55,labels(i),'fontsize',8);
  
    if i == 1
        title('D', 'FontSize', 10,'FontWeight','bold', 'Units','normalized','Position',[-0.2 0.98  0]);
    elseif i == 5
        xlabel('time (s)');
    end
end

fN = [6 10 14 18 22];
for e = 1:length(labels)
    subplot(rN, cN,fN(e));hold on
    
    speed_cur = OptoBehaviorSpeed{e,3};
    pp = prctile(speed_cur',[25,75]);%interquartile range 25-75%
    lo = pp(1,:);hi = pp(2,:);
    
    %plot mean/median traces
    ds_m = median(speed_cur,2);
    pxx = [dt dt(end:-1:1) dt(1)];
    pyy = [lo hi(end:-1:1) lo(1)];
    er = patch(pxx,pyy,[.7 .7 .7]);
    ax = gca;set(er,'facecolor',[.7 .7 .7],'facealpha',0,'edgealpha',0.3,'edgecolor',col(3,:));
    ax = gca;set(ax,'color','none','box','off');

    plot(dt,ds_m,'color',colseq(e,:),'linewidth',2);
    ax.PlotBoxAspectRatio = [2 1 1]; xlim([dt(1) dt(end)]);;
    ym = ax.YLim; ym = ym(2);
    plot([0 0],[0 ym],'k-.');
    %title(['Manipulation-',dataType_cur,'_']);
    if e  == 5
        xlabel('time (s)');
    end
end

%% Figure 8A-C
% Figure 8A: Injection schematic
fN = [1]; subplot(rN,cN,fN)
I = imread('Figure8-A.tif');imshow(I)
ax = gca; ap = ax.Position; ax.Position= ap.*[1 1 1 1.6];
%ap = ax.Position;ax.Position= ap+[0.105 0 0 0];
title('A', 'FontSize', 10, 'FontWeight','bold','Units','normalized','Position',[-.08 0.95 0]);

% Figure 8B: behavior schematic
fN = [2]; subplot(rN,cN,fN)
I = imread('Figure8-B.tif');imshow(I)
ax = gca; ap = ax.Position; ax.Position= ap.*[1 1 1 1.6];
%ap = ax.Position;ax.Position= ap+[0.105 0 0 0];
title('B', 'FontSize', 10, 'FontWeight','bold','Units','normalized','Position',[-.08 0.95 0]);

% Figure 8C: IHC
fN = [3 4]; subplot(rN,cN,fN)
I = imread('Figure8-C.tif');imshow(I)
ax = gca; ap = ax.Position; ax.Position= ap.*[1 1 1 1.6];
%ap = ax.Position;ax.Position= ap+[0.105 0 0 0];
title('C', 'FontSize', 10, 'FontWeight','bold','Units','normalized','Position',[-.08 0.95 0]);
%%
