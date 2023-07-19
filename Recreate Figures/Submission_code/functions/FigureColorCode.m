%% --- Set Color information--------------------------%
% different behavioral types:
newColors = [...
    191,212,95; %Green----Freeze & Pauses_Freeze
    135, 115, 178; %Purple----Escape & Pauses_Escape
    198,198,198; %Gray----No_Response
    255,222,59]./255; %Yellow---- Pauses 

% Circuit color
col = [38 55 127;197 78 83;90 91 93]./255;% Gad2LGN; Gad2PBG; Ntsr1LP
coll = [38 55 127;197 78 83;97 97 97]./255;% Gad2LGN; Gad2PBG; CTR
coll2 = [190 186 218; 128 177 211; 252 192 134; 230 171 2; 153 153 153]./255;

col2 = [75 114 177;197 78 83;... %blue-GCaMP6s;
    53 53 53;125 125 125]/255; %red-mCherry

% Parental area color
col_HEX1 = {...
    '#0173b2', '#de8f05', '#029e73', '#d55e00', '#cc78bc', ...
    '#ca9161', '#fbafe4', '#949494', '#ece133', '#56b4e9'}; %'colorblind';
col_mouse = zeros(length(col_HEX1),3);

col_HEX2 = {...
    '#3787c0', '#dd8452', '#66c2a5', '#ccb974', '#8172b3',...
    '#937860', '#da8bc3', '#8c8c8c', '#ccb974', '#64b5cd'};%deep + set2
col_area = zeros(length(col_HEX2),3);
for c = 1: length(col_HEX2)
    col_area(c,:) = hex2rgb(col_HEX2{c});
    col_mouse(c,:) = hex2rgb(col_HEX1{c});
end

col_HEX3 = {...
    '#455cce', '#516ddb', '#5e7de7', '#6b8df0', '#799cf8',...%dark blue
    '#86a9fc','#93b5fe', '#a1c0ff', '#aec9fc', '#bbd1f8',... %light blue
    '#c7d7f0', '#d3dbe7','#dddcdc', '#e6d7cf', '#eed0c0',... %gray
    '#f3c7b1', '#f7bca1', '#f7af91','#f5a081', '#f29274',... %light red
    '#ec8165', '#e46e56', '#da5a49', '#cf453c', '#c12b30'};  %dark red

col_HEX4 = {...
    '#5572df', '#5a78e4', '#5e7de7', '#6282ea','#6788ee', ...%11-15
    '#6b8df0', '#6f92f3', '#7396f5', '#799cf8','#7da0f9',...%6-10
    '#81a4fb', '#86a9fc', '#8badfd', '#8fb1fe','#93b5fe', ...%1-5
    '#98b9ff', '#9dbdff', '#a1c0ff',  ...%16-18
    '#a6c4fe','#aac7fd', '#aec9fc', '#b2ccfb', '#b7cff9',...%11-15
    '#bbd1f8','#bfd3f6', '#c4d5f3', '#c7d7f0', '#cbd8ee', ...%6-10
    '#cedaeb', '#d3dbe7', '#d6dce4', '#d9dce1', '#dddcdc', ...%1-5
    '#e0dbd8', '#e3d9d3', '#e6d7cf', '#ead5c9', '#ecd3c5', ...%1-5
    '#eed0c0', '#f0cdbb', '#f2cab5', '#f3c7b1', '#f5c4ac', ...%6-10
    '#f6bfa6','#f7bca1', '#f7b89c', '#f7b497', '#f7af91', ...%11-15
    '#f7aa8c','#f7a688', '#f5a081', '#f59c7d', '#f39778',...%1-5
    '#f29274', '#f08b6e', '#ee8669', '#ec8165', '#e97a5f', ...%6-10
    '#e7745b', '#e46e56', '#e26952', '#de614d', '#da5a49', ...%11-15
    '#d75445', '#d24b40', '#cf453c', '#cb3e38', '#c73635', ...%16-20
    '#c12b30','#bd1f2d', '#b8122a'};%21-23
col_HEX4 = {...
    '#416aaf', '#6399c7', '#90c3dd', '#bde2ee', '#e5f5ef', ...%blue
    '#fffebe', ...%yellow
    '#fee597', '#fdbf71', '#f88c51', '#ea5739', '#ce2827'};%red
col_bias = zeros(length(col_HEX4),3);
for c = 1: length(col_HEX4)
    col_bias(c,:) = hex2rgb(col_HEX4{c});
end
myColMap = csvread('myColMap.csv');
%load cMap

equal = [.5 .5 .5];
col_bias2 = [myColMap(1:5,1:3);equal; myColMap(end-4:end,1:3)]


col_HEX5 = {...
    '#221331', '#451c47', '#691f55', '#921c5b', '#b91657', '#d92847', '#ed503e', '#f47d57', '#f6a47c', '#f7c9aa'}; %rocket
col_diff = zeros(length(col_HEX5),3);
for c = 1: length(col_HEX5)
    col_diff(c,:) = hex2rgb(col_HEX5{c});
end

%greys
col_HEX6 = {...
    '#fbfbfb', '#f7f7f7', '#f4f4f4', '#efefef', '#e9e9e9', '#e4e4e4',...
    '#dedede', '#d7d7d7', '#d0d0d0', '#c9c9c9', '#c2c2c2', '#b9b9b9', ...
    '#afafaf', '#a5a5a5', '#9c9c9c', '#919191', '#888888', '#7f7f7f', ...
    '#777777', '#6d6d6d', '#656565', '#5d5d5d', '#545454', '#484848', ...
    '#3d3d3d', '#323232', '#272727', '#1c1c1c', '#131313', '#090909'};

myGreys = zeros(length(col_HEX6),3);
for c = 1: length(col_HEX6)
    myGreys(c,:) = hex2rgb(col_HEX6{c});
end
myGreys_mod = myGreys(2:2:end,:);

col_HEX7 = {'#4e5da7','#c67641','#80bd59','#aa5050','#7957a0','#6c5031','#b36aa8'};
myParentArea = zeros(length(col_HEX7),3);
for c= 1:length(col_HEX7)
    myParentArea(c,:) = hex2rgb(col_HEX7{c});
end

%% color for anatomical areas 
colors = [];
co = [0,113,188;...%dark blue
    63,48,28;...%dark brown
    49,93,45;...%dark green
    130,35,84;...%dark purple
    85,35,34;...%dark pink
    98,101,103;...
    255,127,0;...
    84,34,68;...%dark red
    ]/255;%dark gray
g = 1;
groups(g).name = 'frontal';
groups(g).acr = {'MOs','MOp', 'ACAd', 'ACAv', 'SSs','SSp','PL','ORB','TEa','AUD','ILA','Ala'};
groups(g).color = repmat(co(1,:),length(groups(g).acr),1);
groups(g).alpha = linspace(1,0.5,length(groups(g).acr));

g = g+1;
groups(g).name = 'striatum';
groups(g).acr = {'SI', 'BST', 'SNr', 'LSd','CP','ACB'};%'SubG'
groups(g).color = repmat(co(2,:),length(groups(g).acr),1);
groups(g).alpha = linspace(1,0.5,length(groups(g).acr));

g = g+1;
groups(g).name = 'midbrain';
groups(g).acr = {'RN','PPN','NOT','PPT','PAG','OP','CUN','MRN','NPC','SAG','APN','IC','EWMA3'};%'MPT'
groups(g).color = repmat(co(3,:),length(groups(g).acr),1);
groups(g).alpha = linspace(1,0.5,length(groups(g).acr));

g = g+1;
groups(g).name = 'visual';
groups(g).acr = {'VISpl', 'VISl','VISp','VISrl', 'VISam', 'VISpm', 'VISa','VISal','VISli','VISpor'};
groups(g).color = repmat(co(4,:),length(groups(g).acr),1);
groups(g).alpha = linspace(1,0.5,length(groups(g).acr));

g = g+1;
groups(g).name = 'thalamus';
groups(g).acr = {'RT','LP','PPnT','LGv','VM','IGL','VPM','VPL','MG'};
groups(g).color = repmat(co(5,:),length(groups(g).acr),1);
groups(g).alpha = linspace(1,0.5,length(groups(g).acr)); % pink

g = g+1;
groups(g).name = 'hypothalamus';
groups(g).acr = {'PON','AHN', 'LHA','ZI','PH','VMH','DMH','PMH','PVH','PeVH','LPO'};
groups(g).color = repmat(co(6,:),length(groups(g).acr),1);
groups(g).alpha = linspace(1,0.5,length(groups(g).acr));

g = g+1;
groups(g).name = 'hippocampus';
groups(g).acr = {'POST', 'SUB', 'DG'};
groups(g).color = repmat(co(7,:),length(groups(g).acr),1);
groups(g).alpha = linspace(1,0.5,length(groups(g).acr));

g = g+1;
groups(g).name = 'others';
groups(g).acr = {...
    'LSv','CEA','MEA','Pros',...
    'RSPdl','RSPv','PRNr','MV','PRNc','PB','GRN','PCGSG','NLL','CENT','IP','PRCSCO'};
groups(g).color = repmat(co(8,:),length(groups(g).acr),1);
groups(g).alpha = linspace(1,0.5,length(groups(g).acr));

save(fullfile(rawPath,'Gad2_colorInfo.mat'),...
    'col','coll','coll2','col_bias','col_bias2','newColors',...
    'col_area','col_mouse','cMap','groups','col_diff',...
    'myGreys','myGreys_mod','myParentArea');
disp('updated color information')

