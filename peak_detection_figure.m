% URL of the .mat file on GitHub (use the direct link from the "Raw" button)
url = 'https://github.com/yangshao2/cropland/raw/master/mfigure.mat'; 
% The local filename to save the .mat file
filename = 'localfile.mat'; 

% Download the file
websave(filename, url);


% Load the .mat file into MATLAB
load(filename);
x=1:8:365

dcrop=u(:,1);
scrop=u(:,2);


subplot(1,2,1)
findpeaks(scrop(1:46),x,'MinPeakHeight',0.35,'MinPeakDistance',4,'Annotate','extents')
ylim([0 1]);
xlabel('Day of Year','FontSize', 14);
ylabel('NDVI','FontSize', 14)
set(gca, 'FontSize', 14);
text(10, 0.95, '(a) Single crop', 'FontSize', 18);
legend('off');

subplot(1,2,2)
findpeaks(dcrop(1:46),x,'MinPeakHeight',0.35,'MinPeakDistance',4,'Annotate','extents')
xlabel('Day of Year','FontSize', 14)
ylabel('NDVI','FontSize', 14)
set(gca, 'FontSize', 14);
text(10, 0.95, '(b) Double crop', 'FontSize', 18);