#You'll need to adjust starting point and end point of imagelist
#the entire time-series can be divided into two segements of 2001-2012 and 2012-2023
#year 2012 is included in both segment 
#first segment range(1,553); second sement range(507,1059)

import os,sys

#imagetype=sys.argv[1]
set=sys.argv[1]

outfile1="/home/yshao/jie/input/filelist"+set+".txt"
outfile2="/home/yshao/jie/input/filelist"+set+"m.txt"
f1 = open(outfile1,'w')
f2 = open(outfile2,'w')

f1.write("552")
f1.write("\n")

f2.write("552")
f2.write("\n")


for i in range(507,1059):

        line="/media/newhd/yshao/evi250_8days/s"+set+"/evi"+str(i)
        f1.write(line)
        f1.write("\n")
        
        line1="/media/newhd/yshao/evi250_8days/s"+set+"/rels_"+str(i)+'.bin'
        f2.write(line1)
        f2.write("\n")
