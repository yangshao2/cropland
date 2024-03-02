temp=[];
for i=1:552
outfile1=sprintf('sout13_%s',sprintf('%04d',i));
        tfile=fopen(outfile1,'r');
        a=fread(tfile, 'float');
        fclose(tfile);
        
        temp=[temp a];
end
tt=[temp(1:20000,1:552) temp(20001:end, 47:end)];