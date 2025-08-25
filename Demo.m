%% -------------------- [ALI Method Demonstration] --------------------- %%
% This file demonstrates the superior extraction and discrimination 
% capabilities of the ALI method. It reads dynamic speckle patterns from 
% the "Speckles.mat" file, processes them using the "ALI.m" function, and 
% displays the extracted activity map.

% Copyright (c) 2025 holder: 
% Ali A. Al-Temeemy is a Professor in the Department of Laser and 
% Optoelectronics Engineering at Al-Nahrain University and an honorary 
% research fellow in the Department of Electrical Engineering and 
% Electronics at the University of Liverpool.

% In return for making this code available, I would appreciate that you 
% cite the following publications:

% [1]
% Ali A. Al-Temeemy, ALI: The adaptive levels of interval method for processing 
% laser speckle images with superior activity extraction and discrimination 
% capabilities, Optics and Lasers in Engineering, Volume 178, 2024, 108173, 
% ISSN 0143-8166, https://doi.org/10.1016/j.optlaseng.2024.108173

% [2]
% Al-Temeemy AA. The Methodology of Adaptive Levels of Interval for Laser 
% Speckle Imaging. Journal of Imaging. 2024; 10(11):289.
% https://doi.org/10.3390/jimaging10110289
%% --------------------------------------------------------------------- %%

%% --------------------- Speckle Patterns Reading ---------------------- %%
clear;close all;clc; % Initialization.
load('Speckles'); % Load Speckles Patterns Frames.
Speckles=double(Speckles)/255; % Double conversion and Normalization.
%% --------------------------------------------------------------------- %%

%% ---------------- [Adaptive Level of Interval Method] ---------------- %%
% --[Calculate the Number of interval levels (TL) Automatically]
[d1,d2,d3]=size(Speckles);for TL=3:10;e=0; 
for k=0:TL-1;e=e+((2^k)*2);end;if e>d3;TL=TL-1;break;end;end
% --[Set the Number of interval levels]
% TL=6; %             [**Uncomment to Set (TL) Value Manually**]
% --[Apply ALI Method]
ALIM=ALI(Speckles,TL); 
%% --------------------------------------------------------------------- %%

%% ----------------------- [Display Activity Map] ---------------------- %%
figure(2);imagesc(ALIM);colormap turbo;cb = colorbar(); 
ylabel(cb,'Activity Values','FontSize',12,'Rotation',270)
xlabel('Pixels');ylabel('Pixels');
title('Adaptive Level of Interval Method [Activity Map]');
%% --------------------------------------------------------------------- %%