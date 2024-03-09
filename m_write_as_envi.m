load ag
load all_numsea

ag=u;

for year=2001:2023
ag(u==1)=temp(:,year-2000);
file=sprintf('peaks%d.dat',year);

   fileID = fopen(file,'w');
  fwrite(fileID,ag','uint8');
    fclose(fileID);
end

