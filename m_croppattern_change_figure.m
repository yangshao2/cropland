load C:/jie/newresults/tt_posneg

subplot(2,1,1)
plot(tt(1,:))
ylim([0.1 0.85])
xlim([0 1060])
yticks([0 0.2 0.4 0.6 0.8 1]); 
ylabel('NDVI')

subplot(2,1,2)
plot(tt(2,:))
xlim([0 1060])
ylim([0.1 0.85])
yticks([0 0.2 0.4 0.6 0.8 1]); 
xlabel('MODIS NDVI 8-day composites 2001-2023')
ylabel('NDVI')