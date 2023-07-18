%% Figure 4A-D
dataPath = [rawPath,'/Figure 4'];
close all;clc;
figure; set(gcf,'position',[109 1482 1000 180]);
rN = 1; cN = 5;hold on;

% Figure 4D : bar plot
%------load experiment group mean data
load(fullfile(dataPath,'AreaPer_ipsi.mat')); per_ipsi = AreaPer;
load(fullfile(dataPath,'AreaPer_cont.mat')); per_cont = AreaPer;
load(fullfile(dataPath,'ParentalAreaN_v3.mat'))

% ----- plot
nbars = 2;groupwidth = min(0.7, nbars/(nbars + 1.8));
per = {per_ipsi, per_cont};
xx = [ParentalAreaN_v3{:,2}];groupNames =  ParentalAreaN_v3(:,1);
len_part = length(groupNames);
subplot(rN,cN,5); hold on
for a = 1:2 % ipsi-contra
    cur_per = per{a};
    if a ==1 
        yy = cur_per.Val;err = cur_per.Err;ZZ = cur_per.Idv;
    else
         yy = (-1).*cur_per.Val;err = (-1).*cur_per.Err;
         ZZ = cur_per.Idv;
    end
    bp = bar(xx,yy,'FaceColor','flat','BarWidth',0.98);
    for i = 1: nbars
        %set the bar
        bp(i).CData = coll(i,:);
        bp(i).FaceAlpha = 1;
        bp(i).EdgeAlpha = 0;
        individuals = cell2mat(ZZ(:,i));
        
        %set the errors
        x = (1:length(groupNames)) - groupwidth/2 + (2*i-1) * groupwidth/(2*nbars);
        e = errorbar(x, yy(:,i)', err','.'); e.Color = 'k'; e.LineWidth = 0.8;
        if a == 2
            individuals = (-1).*individuals;
            e.YPositiveDelta = [];
        else
            individuals = individuals;
            e.YNegativeDelta = [];
        end
        %add individual data point
        for jj=1:len_part
            scatter(repmat(x(jj),size(individuals,2),1),individuals(jj,:),...
                5,'MarkerEdgeColor',[0.25 0.25 0.25]);
        end
    end 
    plot([0,8.5],[25,25],'-.','color',[0.5 0.5 0.5]);
    plot([0,8.5],[50,50],'-.','color',[0.5 0.5 0.5]);
    plot([0,8.5],[-25,-25],'-.','color',[0.5 0.5 0.5]);
    plot([0,8.5],[-50,-50],'-.','color',[0.5 0.5 0.5]);
    xlim([0 8.5]);
    ylim([-50 50]);
    set(gca,'XTick',[1:len_part],'XTickLabel',groupNames,...
            'XTickLabelRotation',30,'fontsize',8,'YTick',[0:25:100]);
    set(gca,'box','off','color','none', 'TickDir','out','Ticklength', [0.001 0.025],'fontsize',8);
    ylabel({'Propotion of input', '(%)'},'fontsize',10);
    legend({'LGN','PBG'},'Location','northeast');legend('boxoff');
end
text(8,21,'ipsi'); text(8,-21,'cont'); 
title('D', 'FontSize', 10, 'FontWeight','bold','Units','normalized','Position',[-0.2 0.98 0]);
ax = gca; ap = ax.Position; ax.Position= ap .*[1 1 1.6 1];
ap = ax.Position;ax.Position= ap +[0.01 0 0 0];

% Figure 4C: Brainrender
subplot(rN,cN,4)
I = imread('Figure4-C.tif');imshow(I)
ax = gca; ap = ax.Position; ax.Position= ap.*[1 1 1.6 1];
ap = ax.Position;ax.Position= ap +[-0.09 0 0 0];
title('C', 'FontSize', 10,  'FontWeight','bold','Units','normalized','Position',[-.08 0.98 0]);
% Figure 4A: Injection schematic
subplot(rN,cN,1)
I = imread('Figure4-A.tif');imshow(I);
ax = gca; ap = ax.Position; ax.Position= ap.*[1 1 1.6 1];
ap = ax.Position;ax.Position= ap+[-0.12 0 0 0];
title('A', 'FontSize', 10,  'FontWeight','bold','Units','normalized','Position',[-.08 0.98 0]);

% Figure 4B: IHC
subplot(rN,cN,2)
I = imread('Figure4-B.tif');imshow(I)
ax = gca; ap = ax.Position; ax.Position= ap.*[1 1 2.4 1];
ap = ax.Position;ax.Position= ap+[-0.08 0 0 0];
title('B', 'FontSize', 10,  'FontWeight','bold','Units','normalized','Position',[-.03 0.98 0]);

%% Figure 4E
load BiasPlot
xx = BiasPlot.val;sl = length(xx);
ColorSeq = BiasPlot.col; xx_labels= BiasPlot.name; 
CI_upper = BiasPlot.CI(2); CI_lower = BiasPlot.CI(1);

clc; figure; set(gcf,'position',[8 475 900 210]);hold on;
for i = 1:sl
    bar(i,xx(i),'BarWidth',0.7,'FaceColor',ColorSeq(i,:),'EdgeColor','none');
end
set(gca,'XTick',(1:1:sl),'TickLength',[0.0025 0.0025],'TickLabelInterpreter','none',...
    'XTickLabel',xx_labels,'XTickLabelRotation',90,'FontSize',10,'FontName', 'Arial',...
    'GridColor',[.5 .5 .5],'GridLineStyle', ':','XGrid', 'on','YGrid', 'on','color', 'none')
ax = gca; ax.GridAlpha = 0.2;YMinorGrid = 'on';
plot([0.5,sl+0.5],[CI_upper,CI_upper],'k-.');
plot([0.5,sl+0.5],[CI_lower,CI_lower],'k-.');
hold off;
colorSeqUni = unique(ColorSeq,'rows');
%colorSeqUniSort = colorSeqUni([6,4,3,2,1,8,5,7,9,10,11],:)
colorSeqUniSort = colorSeqUni([1,2,3,5,7,4,11,10,9,8,6],:)
colormap(colorSeqUniSort); 
cl = colorbar('southoutside');
cl.Ticks = [0.1 0.5 1];
row1 = {'-2.2',' -0.3 0.3','       1.8'}; row2 = {'Gad2-LGN','balanced','   Gad2-PBG'};
labelArray = [row1; row2]; 
tickLabels = strtrim(sprintf('%s\\newline%s\n', labelArray{:}));
cl.TickLabels = tickLabels;
cp = cl.Position; cl.Position = cp.*[5.5 1 0.2 1];
%cp = cl.Position; cl.Position = cp+[0.4 0 0 0];

title('E', 'FontSize', 10,  'FontWeight','bold','Units','normalized','Position',[-.05 0.98 0]);

%% Figure 3F
clc; figure; set(gcf,'position',[926 476 400 210]);
rowN = 2; colN = 3;hold on;

col_delta = [col_bias2(:,1:3);[1 1 1]];
load BiasOverview
delta_catN = BiasOverview.val; delta_areaList = BiasOverview.name;
% ---------------- Overview Altas showing the bias index ---------------- %%
slices = [35 46 57 68 79 90]; sliceLabel = {'3.00','2.64','2.28','1.92','1.20','0.84'};
colN = 3;typeCol = col;

subplot(rN,cN,[4:5])
% ----- Get my areas -----%
jj = 0;
for r =1:length(delta_areaList)
    dd = find(contains(D.acr,delta_areaList(r)));
    for ll = 1:length(dd)
        jj = jj+1;
        areaN_deltaName(jj) = D.acr(dd(ll));
        areaIdx(jj) = dd(ll);
        rv(jj) = delta_catN(r);
    end
end

% ----- plot -----%
pn = [4 6 10 12 16 18];
[~,plot_seq] = unique(areaIdx);
areaIdx = areaIdx(plot_seq);rv = rv(plot_seq);areaN_deltaName = areaN_deltaName(plot_seq);
cnt = 0;
for s = slices
    cnt = cnt+1;
    AA = subAtlas.mar.D(:,:,s);
    AA(AA == 1) = -9999;
    CC = zeros(size(AA,1),size(AA,2),1);
    for i = 1:length(areaIdx)
        pp = D.parts{areaIdx(i)};areaN_deltaName(i);
        %find the labeled areas with X-Y coordiante
        for p = 1:length(pp)
            [I,J] = find(abs(AA) == pp(p));
            if isempty(I) %this region is not in this slide
                continue
            else
                for idx = 1:length(I)
                    CC(I(idx),J(idx),1) = rv(i);
                end
            end
        end
    end
    
    %set the background with the lowest
    CC(AA == -9999) = max(rv)+1;
    CC(CC == 0) = max(rv)+1;%min(delta_dataX)-1;
    sa = subaxis(rowN,colN, cnt,'SpacingVert',0.15,'SpacingHoriz',0.05,'MR',0.05,'ML',0.05);
    imagesc(CC,[min(rv) max(rv)+1]);
    hold on;addLines02_CL01(LinMap,s,'-k',0.01);hold off
    colormap(col_delta);  
    addLines02_CL01(LinMap,s,'-k',0.02);hold off
    set(gca,'Box','on','XTick',[],'YTick',[],'XColor','w','YColor','w','Clipping','off')
    title (['Lateral ',sliceLabel{cnt}])
end
title('F', 'FontSize', 10,  'FontWeight','bold','Units','normalized','Position',[-2.5 2.51 0]);

%% Figure 4G-I
load normData; 
yy = normPer(:,1:2); err = normPer(:,3:4)
yyd = normDen(:,1:2);errd = normDen(:,3:4)
xx = biasIdx; xx_labels = labels;
sl = length(yy);
figure;set (gcf,'position',[-211 901 1920 1029]);clf
% ----- 1: Normalized percentage LGN vs Pbg
subplot(3,1,1);hold on
nbars = 2;groupwidth = min(0.7, nbars/(nbars + 1.8));
bp = bar(1:length(yy),yy,'FaceColor','flat','BarWidth',0.98);%     if np == 1
set(gca,'box','on','color','none');

for i = 1: nbars
    %set the bar
    bp(i).CData = col(i,:);
    bp(i).FaceAlpha = 1;
    bp(i).EdgeAlpha = 0;
    %set the errors
    xe = (1:length(xx_labels)) - groupwidth/2 + (2*i-1) * groupwidth/(2*nbars);
    e = errorbar(xe, yy(:,i)', err(:,i)','.'); 
    e.Color = [0.5 0.5 0.5]; e.LineWidth = 1;
    e. CapSize = 1;e.YNegativeDelta = [];
end
set(gca,'XTick',(1:1:sl),'TickLength',[0.0025 0.0025],'TickLabelInterpreter','none',...
    'XTickLabel',xx_labels,'XTickLabelRotation',90,'FontSize',10,'FontName', 'Arial',...
    'GridColor',[.5 .5 .5],'GridLineStyle', ':','XGrid', 'on','YGrid', 'on','color', 'none')
ax = gca; ax.GridAlpha = 0.2;YMinorGrid = 'on';
n = ax.YTick(1);m = ax.YTick(end);
for i = 1:7
    plot([b(i)-0.5 b(i)-0.5],[n m],'k-');
    text(b(i),8,bA(i),'Fontsize',10,'Fontweight','Bold');
end
hold off;
title('Figure 7G-H-I-J', 'FontSize', 10,  'FontWeight','bold','Units','normalized','Position',[.5 1.1 0]);

% ----- 2: Normalized density LGN vs Pbg
subplot(3,1,2);hold on
nbars = 2;groupwidth = min(0.7, nbars/(nbars + 1.8));
bp = bar(1:length(yyd),yyd,'FaceColor','flat','BarWidth',0.98);%     if np == 1
set(gca,'box','on','color','none');
for i = 1: nbars
    
    %set the bar
    bp(i).CData =col(i,:);
    bp(i).FaceAlpha = 1;
    bp(i).EdgeAlpha = 0;
    %individuals = cell2mat(ZZ(:,i));
    %set the errors
    xe = (1:length(xx_labels)) - groupwidth/2 + (2*i-1) * groupwidth/(2*nbars);
    e = errorbar(xe, yyd(:,i)', errd(:,i)','.'); 
    e.Color = [0.5 0.5 0.5]; e.LineWidth = 1;
    e. CapSize = 1;e.YNegativeDelta = [];
end
set(gca,'XTick',(1:1:sl),'TickLength',[0.0025 0.0025],'TickLabelInterpreter','none',...
    'XTickLabel',xx_labels,'XTickLabelRotation',90,'FontSize',10,'FontName', 'Arial',...
    'GridColor',[.5 .5 .5],'GridLineStyle', ':','XGrid', 'on','YGrid', 'on','color', 'none')
ax = gca; ax.GridAlpha = 0.2;YMinorGrid = 'on';
n = ax.YTick(1);m = ax.YTick(end);
for i = 1:7
    plot([b(i)-0.5 b(i)-0.5],[n m],'k-');
end
hold off;

% ----- 3: Normalized density bias LGN/Pbg
subplot(3,1,3); hold on
set(gca,'box','on','color','none');

for i = 1:sl
    bar(i,xx(i),'BarWidth',0.7,'FaceColor',plot_color(i,:),'EdgeColor','none');
end
set(gca,'XTick',(1:1:sl),'TickLength',[0.0025 0.0025],'TickLabelInterpreter','none',...
    'XTickLabel',xx_labels,'XTickLabelRotation',90,'FontSize',10,'FontName', 'Arial',...
    'GridColor',[.5 .5 .5],'GridLineStyle', ':','XGrid', 'on','YGrid', 'on','color', 'none')
ax = gca; ax.GridAlpha = 0.2;YMinorGrid = 'on';
n = ax.YTick(1);m = ax.YTick(end);

for i = 1:7
    plot([b(i)-0.5 b(i)-0.5],[n m],'k-');
end
hold off;
