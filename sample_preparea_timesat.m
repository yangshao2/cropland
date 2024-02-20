%write to binary files - ready for timesat 
infile=sprintf('/home/yshao/jie/stemp.mat')
load(infile);
for i=1:1058
outfile1=sprintf('/home/yshao/jie/samples/evi%d',i);
        tfile=fopen(outfile1,'w');
        temp1=sig(:,i);
        fwrite(tfile, temp1,'float');
        fclose(tfile)
        i
end