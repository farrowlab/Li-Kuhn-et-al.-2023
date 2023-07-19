%% Figure 5A & C- polar plot 
dataPath = [rawPath,'/Figure 5'];
close all;clc;
figure; set(gcf,'position',[109 1482 1000 180]);
rN = 1; cN = 2;hold on;
subplot(rN,cN,1); load functionalDevisionPercentage; 
ld = length(labels);

%create degree
theta = linspace(0,360,ld+1);theta = theta(1:end-1)';
% degree to radian
xx = deg2rad(theta);

p1 = polar([xx;xx(1)],[Data1; Data1(1,1)]);hold on;
set(p1,'LineWidth',2,'Color',col(1,:));
p2 = polar([xx;xx(1)],[Data2; Data2(1,1)]);
set(p2,'LineWidth',2,'Color',col(2,:));
% sem of LGN per - Pbg per
lo1 = Data1 - sem1;hi1 = Data1(:,1) + sem1;
lo2 = Data2 - sem2;hi2 = Data2(:,1) + sem2;
% convert the polar coordinates to cartesian coordinates
[u1,v1] = pol2cart(xx,lo1); [u11,v11] = pol2cart(xx,hi1);
[u2,v2] = pol2cart(xx,lo2); [u22,v22] = pol2cart(xx,hi2);
%show the sem
hold all;
er1 = patch([u1;fliplr(u11)], [v1;fliplr(v11)], 'b')
set(er1,'facecolor',col(1,:),'facealpha',0.50,'edgealpha',0.2,'edgecolor','none');
er2 = patch([u2;fliplr(u22)], [v2;fliplr(v22)], 'm')
set(er2,'facecolor',col(2,:),'facealpha',0.50,'edgealpha',0.2,'edgecolor','none');
title('A', 'FontSize', 10,  'FontWeight','bold','Units','normalized','Position',[-.05 0.98 0]);

subplot(rN,cN,2);
load sensoryDevisionPercentage
%create degree
ld = length(labels); theta = linspace(0,360,ld+2);theta = theta(1:end-1)';
% degree to radian
xx = deg2rad(theta);

% --- polar plot - v2
p1 = polar([xx;xx(1)],[Data1; 0;Data1(1)]);hold on;
set(p1,'LineWidth',2,'Color',col(1,:));
p2 = polar([xx;xx(1)],[Data2; 0;Data2(1)]);
set(p2,'LineWidth',2,'Color',col(2,:));
% sem of LGN per - Pbg per
lo1 = Data1 - sem1;hi1 = Data1 + sem1;
lo2 = Data2 - sem2;hi2 = Data2 + sem2;
lo1 = [lo1;0];lo2 = [lo2;0];
hi1 = [hi1;0];hi2 = [hi2;0];
% convert the polar coordinates to cartesian coordinates
[u1,v1] = pol2cart(xx,lo1); [u11,v11] = pol2cart(xx,hi1);
[u2,v2] = pol2cart(xx,lo2); [u22,v22] = pol2cart(xx,hi2);
%show the sem
hold all;
er1 = patch([u1;fliplr(u11)], [v1;fliplr(v11)], 'b')
set(er1,'facecolor',col(1,:),'facealpha',0.50,'edgealpha',0.2,'edgecolor','none');
er2 = patch([u2;fliplr(u22)], [v2;fliplr(v22)], 'm')
set(er2,'facecolor',col(2,:),'facealpha',0.50,'edgealpha',0.2,'edgecolor','none');
title('C', 'FontSize', 10,  'FontWeight','bold','Units','normalized','Position',[-.05 0.98 0]);

set(gcf,'renderer','Painters');
print(gcf,(fullfile(savePath,'Figure-5_A_C')), '-dpng', '-r300');
close all

%% Figure 5B - bias heat map 
load(fullfile(dataPath,'BiasData.mat'));
p1_log = Bias_logLGN;
p2_log = Bias_logPBG;
label_arc_LGNPbg_log = Bias_log_AreaName;

% LGN+Pbg parental area
FigName = ['BiasIndex_ParentalCode'];
figure;set(gcf,'position',[246 1444 200 900]);
heatmap(parentalCode,'YDisplayLabels',Bias_AreaName);
ax = gca;ax.Position = ax.Position .* [1 1 0.1 1];
colormap(myParentArea);grid off
ax.CellLabelColor='none';
axs = struct(gca); %ignore warning that this should be avoided
cb = axs.Colorbar;
cb.Ticks = [0.25:1:7];  
cb.TickLabels = {'CTX','sCTX','TH','HYP','MB','HB','CB'}; 
title('ParentalCode')
set(gcf,'renderer','Painters');
print(gcf,(fullfile(savePath,['Figure-5_B_',FigName])), '-dpng', '-r300');

% plot LGN+Pbg bias
FigName = ['BiasIndex_FunctionDevision'];
figure;set(gcf,'position',[36 1444 200 900]);
heatmap(Bias_IndexValue,'YDisplayLabels',Bias_AreaName);
ax = gca;ax.Position = ax.Position .* [1 1 0.2 1];
colormap(col_bias2(1:11,:));grid off
ax.CellLabelColor='none';
title('Bias')
set(gcf,'renderer','Painters');
print(gcf,(fullfile(savePath,['Figure-5_B_',FigName])), '-dpng', '-r300');

% LGN+Pbg percentage - correction 2 (log scale)
FigName = ['PerLogscale_FunctionDevision'];
figure;set(gcf,'position',[414 1002 400 900]);

subplot(1,2,1)
heatmap([p1_log;p2_log],'YDisplayLabels',label_arc_LGNPbg_log);
ax = gca;cur_po = ax.Position;
ax.Position = cur_po .* [1 1 0.2 1];
colormap(myGreys_mod);grid off
ax.CellLabelColor='none';
title('Gad2-LGN');

subplot(1,2,2)
heatmap([p2_log;p1_log],'YDisplayLabels',label_arc_LGNPbg_log);
ax = gca;cur_po = ax.Position;
ax.Position = cur_po .* [1 1 0.2 1];
colormap(myGreys_mod);grid off
ax.CellLabelColor='none';
title('Gad2-PBG')
set(gcf,'renderer','Painters');
print(gcf,(fullfile(savePath,['Figure-5_B_',FigName])), '-dpng', '-r300');
close all

