%% Initiate 
clc; clear; close all;

% please choose the directory for saving the downloaded folder
storePath = 'ScienceAdvances/OpenData/Recreate Figures';

rawPath = [storePath ,'Submission_data']
addpath(genpath(rawPath));

% necessary matlab functions used in the code
codePath = [storePath, 'Submission_code'];
addpath(genpath(codePath));

% color scheme used in the manuscript
load Gad2_colorInfo;
disp('---> Load color information');

%load(fullfile(rawPath,'infoRGC.mat'));
%load(fullfile(rawPath,'molecularCount.mat'));;

%% Figure 1
plotFigure1

%% Figure 2
plotFigure2

%% Figure 3
plotFigure3

%% Figure 4
plotFigure4

%% Figure 5
plotFigure4

%% Figure 6
plotFigure6

%% Figure 7
plotFigure7

%% Figure 8
plotFigure8