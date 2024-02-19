%extract ndvi values from sample locations
temp1=[];
temp2=[];
for year=2001:2023
    for j=1:8:366
f=sprintf('/media/newhd/yshao/evi250_8day/ndvi%d_%d',year,j)
load(f)

% Extracting values for pixels with value 1s or 2s in the first image
s_sig = ndvi(sub2ind(size(ndvi), row1s,col1s));
d_sig = ndvi(sub2ind(size(ndvi), row2s,col2s));

temp1=[temp1 s_sig];
temp2=[temp2 d_sig];

    end
end
