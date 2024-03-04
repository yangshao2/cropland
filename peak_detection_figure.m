% URL of the .mat file on GitHub (use the direct link from the "Raw" button)
url = 'https://github.com/yangshao2/cropland/raw/master/mfigure.mat'; 
% The local filename to save the .mat file
filename = 'localfile.mat'; 

% Download the file
websave(filename, url);

% Load the .mat file into MATLAB
load(filename);

dcrop=u(:,1);
scrop=u(:,2);

subplot(1,2,1)
findpeaks(scrop(1:92),'MinPeakHeight',0.35,'MinPeakDistance',10,'Annotate','extents')

subplot(1,2,2)
findpeaks(dcrop(1:92),'MinPeakHeight',0.35,'MinPeakDistance',10,'Annotate','extents')
