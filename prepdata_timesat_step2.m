function prep_fortimesate_8day(i)

i=str2num(i)
count=0
lb=1:500000:10000000;
ub=lb+500000-1;

    count=count+1
    temp=[];
    lbi=lb(i)
    ubi=ub(i)

    for year=2001:2023
        year
    f=sprintf('/media/newhd/yshao/evi250_8day/agndvi%d.mat',year);
    load(f);
    sig=sig(lbi:ubi,:);
    temp=[temp sig];
    end

 f1=sprintf('/media/newhd/yshao/evi250_8day/nsub%d.mat',i);
 temp(temp==-1)=0;
 save(f1,"temp","-v7.3")

end
