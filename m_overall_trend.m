i=0
for year=2001:2023
    i=i+1
file=sprintf('peaks%d.tif',year);
a=imread(file);
[s(i) c]=size(find(a==1))
[d(i) c]=size(find(a==2))
end

% Example data: Rows are categories, columns are portions
data=[s' d'];
% Convert data to percentages
rowSums = sum(data, 2); % Sum across rows
percentData = 100 * data ./ rowSums;

x=2001:2023
plot(x,percentData(:,2),':*')
xlabel('Year');
ylabel('Multiple Crop Percentage');