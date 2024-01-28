%ag=imread('ag20002020s.tif');
load ag
sig=zeros(10086472,46);
count=0;
for year=2023:2023
    year
    for j=1:8:366
         count=count+1;
        f=sprintf('/media/newhd/yshao/evi250_8day/ndvi%d_%d.mat',year,j);
      load(f);
sig(:,count)=ndvi(u==1);
    end
end

f=sprintf('/media/newhd/yshao/evi250_8day/agndvi%d.mat',year);

save(f,"sig","-v7.3")


