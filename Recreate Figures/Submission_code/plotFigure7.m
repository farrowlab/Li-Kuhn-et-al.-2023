%% Figure 7
dataPath = [rawPath,'/Figure 7'];
close all;clc;
figure; set(gcf,'position',[-192 940 1803 944]);
rN = 4; cN = 6;
col_1 = [col(3,:);col(1,:);col(2,:)];

%% Figure 7 A-C
% Figure 7C: behavior schematic
fN = [4 10 16]; subplot(rN,cN,fN)
I = imread('Figure7-C.tif');imshow(I)
ax = gca; ap = ax.Position; ax.Position= ap.*[0.88 1.2 1.5 1];
%ap = ax.Position;ax.Position= ap+[0.105 0 0 0];
title('C', 'FontSize', 10, 'FontWeight','bold','Units','normalized','Position',[-.08 0.95 0]);

% Figure 7B: IHC
fN = [2 8 14]; subplot(rN,cN,fN)
I = imread('Figure7-B.tif');imshow(I)
ax = gca; ap = ax.Position; ax.Position= ap.*[1.07 1.2 1.5 1];
%ap = ax.Position;ax.Position= ap+[0.105 0 0 0];
title('B', 'FontSize', 10, 'FontWeight','bold','Units','normalized','Position',[-.08 0.95 0]);


% Figure 7A: Injection schematic
fN = [1 7 13]; subplot(rN,cN,fN)
I = imread('Figure7-A.tif');imshow(I)
ax = gca; ap = ax.Position; ax.Position= ap.*[1 1.2 1.2 1];
%ap = ax.Position;ax.Position= ap+[0.105 0 0 0];
title('A', 'FontSize', 10, 'FontWeight','bold','Units','normalized','Position',[-.08 0.95 0]);

%% Figure 7D : speed plot
%------load speed data
load Behavior_Speed.mat;
dt = speedTime;
% ----- plot
fN = [5 11 17];
for t = 1:3 % CTR-LGN-PBG
    subplot(rN,cN,fN(t)); hold on
    
    speed = speedData{t,2};
    name = speedData{t,1};
    %calculate and plot interquartile range 10-90%
    pp2 = prctile(speed,[10,90]);
    lo2 = pp2(1,:);hi2 = pp2(2,:);
    pxx2 = [dt dt(end:-1:1) dt(1)];
    pyy2 = [lo2 hi2(end:-1:1) lo2(1)];
    
    %calculate and plot interquartile range 25-75%
    pp = prctile(speed,[25,75]);
    lo = pp(1,:);hi = pp(2,:);
    pxx = [dt dt(end:-1:1) dt(1)];
    pyy = [lo hi(end:-1:1) lo(1)];
    
    er = patch(pxx,pyy,[.7 .7 .7]);
    ax = gca;
    set(er,'facecolor',[.7 .7 .7],'facealpha',0,'edgealpha',0.3,'edgecolor',col_1(t,:));
    
    %plot mean/median traces
    ds_m = median(speed);
    plot(dt,ds_m,'color',col_1(t,:),'linewidth',2);
    
    ax.XLim = [dt(1) dt(end)];
    ax.YLim = [0 60];ym = ax.YLim(2);
    ax.YTick = [0 30 60]
    plot([0 0],[0 ym],'k-.');
    text(4,60,name);
    ylabel('speed (cm/s)');xlabel('time (s)');
    hold off
    set(gca,'box','off','color','none');
    if t== 1
        title('D', 'FontSize', 10, 'FontWeight','bold','Units','normalized','Position',[-0.2 0.98 0]);
    end
end

%% Figure 7E - cpf
load Behavior_cdf; 
fN = [6 18];
% Freeze
subplot(rN,cN,fN(1));hold on;
for n = 1:3
    plot(plot_time,cdf_f_all(n,:),'color',col_1(n,:),'linewidth',2);
end
ax = gca;ax.XLim = [-1 15];ax.YLim = [0 1];ax.PlotBoxAspectRatio = [1 1 1];
plot([0,0],[0,0],'-.','color',[0.7 0.7 0.7],'linewidth',1);
hold off;ax.XGrid = 'on';
ax.XTick = [0.5:1:15.5];
ax.XTickLabel = {'1','','','','5','','','','','10','','','','','15'};
ax.YTick = [0:0.5:1];
xlabel('# trials');ylabel('Cumulative probability');
ax.PlotBoxAspectRatio = [1 1 1];
set(gca,'box','off','color','none');
title('E', 'FontSize', 10, 'FontWeight','bold','Units','normalized','Position',[-0.2 0.98 0]);
% Escape
subplot(rN,cN,fN(2));hold on;
for n = 1:3
    plot(plot_time,cdf_e_all(n,:),'color',col_1(n,:),'linewidth',2);
end
ax = gca;ax.XLim = [-1 15];ax.YLim = [0 1];ax.PlotBoxAspectRatio = [1 1 1];
plot([0,0],[0,0],'-.','color',[0.7 0.7 0.7],'linewidth',1);
hold off;ax.XGrid = 'on';
ax.XTick = [0.5:1:15.5];
ax.XTickLabel = {'1','','','','5','','','','','10','','','','','15'};
ax.YTick = [0:0.5:1];
xlabel('# trials');ylabel('Cumulative probability');
ax.PlotBoxAspectRatio = [1 1 1];
set(gca,'box','off','color','none');

%% Figure 7F - travelDistance
subplot(rN,cN,19);hold on;
row1 = {'CTR','LGN', 'PBG',}; row2 = {'(n=19)','(n=15)','(n=12)'};
labelArray = [row1; row2]; 
tickLabels = strtrim(sprintf('%s\\newline%s\n', labelArray{:}));

%------load travel distance data
load Behavior_travelDistance;
df = 0.3;sz = 20;ja = 0.15; 
pixel2cm = 11;
xx = [1:3];

%scatter plot
for n = 1:3
    yy = travelDistance{n,2};ln = length(yy);name = travelDistance{n};
    scatter(repmat(xx(n),ln,1),yy,sz,'filled','MarkerFaceColor',col_1(n,:),...
        'jitter','on','jitterAmount',0.2);
    plot([xx(n)-df xx(n)+df],[median(yy) median(yy)],...
        'linewidth',2,'color',col_1(n,:));
    ax = gca;ax.XLim = [0 4];
    ax.PlotBoxAspectRatio = [1 1 1.5];
    ym = max(ax.YLim);
    ax.XTick = xx; %ax.XTickLabel = {'CTR','Gad-LGN', 'Gad-PBG'};
    ylabel('traveel distance (cm)');set(gca, 'Color','none','Box','off');
end
set(gca,'XTickLabel',tickLabels,'fontsize',8);



ax = gca; ap = ax.Position; ax.Position= ap.*[1 1 1 1];
set(gca,'box','off','color','none');
title('F', 'FontSize', 10, 'FontWeight','bold','Units','normalized','Position',[-0.2 0.98 0]);

%% Figure 7G - distance2shelter 
fN = [20 21 22];

%------load travel distance data
load Behavior_distance2shelter; 
for n = 1:3
    subplot(rN,cN,fN(n));hold on;
    distance = distance2shelter{n,2}; %distance
    distance_base = distance2shelter{n,3}; % distance_base
    name = distance2shelter{n,1};
    
    for d = 1:length(distance)
        scatter([1:2],[distance_base(d,1) distance(d,1)]./11,sz,'filled','MarkerFaceColor',col_1(n,:));hold on
        line([1:2],[distance_base(d,1) distance(d,1)]./11,'color',col_1(n,:));
        ax = gca;ax.XLim = [0.5 2.5];ax.YLim = [0 80];
    end
    ax.PlotBoxAspectRatio = [0.8 1 1];        
    ax.XTick = xx; ax.XTickLabel = {'pre','post'}

    if n == 1
        title('G', 'FontSize', 10, 'FontWeight','bold','Units','normalized','Position',[-0.2 0.98 0]);
        ylabel('distance to shelter (cm)');set(gca, 'Color','none','Box','off');
    elseif n ==2
        ax = gca; ap = ax.Position; ax.Position= ap.*[0.9 1 1 1];  
    else
        ax = gca; ap = ax.Position; ax.Position= ap.*[0.85 1 1 1];  
    end
    set(gca,'box','off','color','none');
end

%% Figure 7H - freeze time
load freezeTime
xx = [1:3];d = []; g= [];
row1 = {'CTR','LGN', 'PBG',}; row2 = {'(n=4)','(n=9)','(n=1)'};
labelArray = [row1; row2]; 
tickLabels = strtrim(sprintf('%s\\newline%s\n', labelArray{:}));

for n = 1:3 %
    name = freezeTime{n,1};
    yy = freezeTime{n,2};    
    ln = length(yy);
    g = [g;repmat(name,ln,1)];
    d = [d;yy];
        
    subplot(rN,cN,23);hold on
    %scatter plot
    scatter(repmat(xx(n)-0.5,ln,1),yy,sz,'filled','MarkerFaceColor',col_1(n,:),...
        'jitter','on','jitterAmount',0.11);
    ax = gca;ax.XLim = [0 4];
    ax.PlotBoxAspectRatio = [1 1 1];
    title('total freeze time (s)');ym = max(ax.YLim);
    ylabel('freeze time (s)');set(gca, 'Color','none','Box','off');
end
set(gca,'XTickLabel',tickLabels,'fontsize',8);

%boxplot
boxplot(d,g,'BoxStyle','outline','Whisker',1.5,'Symbol','');
%set colors
h = findobj(gca,'Tag','Box');
l = findobj(gcf, 'type', 'line', 'Tag', 'Median');
w = findobj(gcf, 'type', 'line');hold on
pCtr = patch(get(h(3),'XData'),get(h([3]),'YData'),'k','FaceAlpha',1);
lCtr = patch(get(l(3),'XData'),get(l([3]),'YData'),'k','FaceAlpha',1);

pPbg = patch(get(h(1),'XData'),get(h([1]),'YData'),'r','FaceAlpha',1);
lPbg = patch(get(l(1),'XData'),get(l([1]),'YData'),'r','FaceAlpha',1);

pLGN = patch(get(h(2),'XData'),get(h([2]),'YData'),'b','FaceAlpha',1);
lLGN = patch(get(l(2),'XData'),get(l([2]),'YData'),'b','FaceAlpha',1);

pLGN.FaceColor = col_1(2,:);pPbg.FaceColor = col_1(3,:);pCtr.FaceColor = col_1(1,:);
lLGN.FaceColor = col_1(2,:);lPbg.FaceColor = col_1(3,:);lCtr.FaceColor = col_1(1,:);
pLGN.EdgeColor = col_1(2,:);pPbg.EdgeColor = col_1(3,:);pCtr.EdgeColor = col_1(1,:);

%ax.XTick = xx; ax.XTickLabel = {'CTR','LGN', 'PBG' };
set(gca,'XTickLabel',{'CTR','LGN', 'PBG' },'fontsize',8);
ax = gca;ax.XLim = [0 4];ym = ax.YLim;
ax.PlotBoxAspectRatio = [1 1 1];
set(gca, 'Color','none','Box','off');
title('H', 'FontSize', 10, 'FontWeight','bold','Units','normalized','Position',[-0.2 0.98 0]);

%% Figure 7I - escape time    
load escapeTime
row1 = {'CTR','LGN', 'PBG',}; row2 = {'(n=12)','(n=4)','(n=9)'};
labelArray = [row1; row2]; 
tickLabels = strtrim(sprintf('%s\\newline%s\n', labelArray{:}));

xx = [1:3];d = []; g= [];
for n = 1:3 %
    name = escapeTime{n,1};
    yy = escapeTime{n,2};    
    ln = length(yy);
    g = [g;repmat(name,ln,1)];
    d = [d;yy];
        
    subplot(rN,cN,24);hold on
    %scatter plot
    scatter(repmat(xx(n)-0.5,ln,1),yy,sz,'filled','MarkerFaceColor',col_1(n,:),...
        'jitter','on','jitterAmount',0.11);
    ax = gca;ax.XLim = [0 4];
    ax.PlotBoxAspectRatio = [1 1 1];
    ym = max(ax.YLim);
    ax.XTick = xx; ax.XTickLabel = {'LGN', 'PBG', 'CTR'};
    ylabel('escape latercy time (s)');set(gca, 'Color','none','Box','off');
end

%boxplot
boxplot(d,g,'BoxStyle','outline','Whisker',1.5,'Symbol','');
%set colors
h = findobj(gca,'Tag','Box');
l = findobj(gcf, 'type', 'line', 'Tag', 'Median');
w = findobj(gcf, 'type', 'line');hold on
pCtr = patch(get(h(3),'XData'),get(h([3]),'YData'),'k','FaceAlpha',1);
lCtr = patch(get(l(3),'XData'),get(l([3]),'YData'),'k','FaceAlpha',1);

pPbg = patch(get(h(1),'XData'),get(h([1]),'YData'),'r','FaceAlpha',1);
lPbg = patch(get(l(1),'XData'),get(l([1]),'YData'),'r','FaceAlpha',1);

pLGN = patch(get(h(2),'XData'),get(h([2]),'YData'),'b','FaceAlpha',1);
lLGN = patch(get(l(2),'XData'),get(l([2]),'YData'),'b','FaceAlpha',1);

pLGN.FaceColor = col_1(2,:);pPbg.FaceColor = col_1(3,:);pCtr.FaceColor = col_1(1,:);
lLGN.FaceColor = col_1(2,:);lPbg.FaceColor = col_1(3,:);lCtr.FaceColor = col_1(1,:);
pLGN.EdgeColor = col_1(2,:);pPbg.EdgeColor = col_1(3,:);pCtr.EdgeColor = col_1(1,:);

ax.XTick = xx; %ax.XTickLabel = {'CTR','LGN', 'PBG' };
set(gca,'XTickLabel',{'CTR','LGN', 'PBG' },'fontsize',8);

ax = gca;ax.XLim = [0 4];ym = ax.YLim;
ax.PlotBoxAspectRatio = [1 1 1];
set(gca, 'Color','none','Box','off');
title('I', 'FontSize', 10, 'FontWeight','bold','Units','normalized','Position',[-0.2 0.98 0]);


set(gcf,'renderer','Painters');
print(gcf,(fullfile(savePath,'Figure-7')), '-dpng', '-r300');
close all
