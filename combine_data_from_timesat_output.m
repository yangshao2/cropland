%This matlab script combines outputs (smoothed signals) from TIMESAT
%The dataset can be fairly large so we have 21 (total_set) data segments for TIMESAT

total_set=21
for j=1:total_set
    j
temp=[];
for i=1:552
outfile1=sprintf('/media/newhd/yshao/output/sg%d/sout_%s',j,sprintf('%04d',i));
        tfile=fopen(outfile1,'r');
        a=fread(tfile, 'float');
        fclose(tfile);
        
        temp=[temp a];
end
f=sprintf('/home/yshao/jie/sub_%d',j);
save(f,"temp","-v7.3")
end
