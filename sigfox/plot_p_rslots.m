 %1
region_f=1:100;
region_t=1000:1200 %3
pcolor(10*log10(p_rslots(region_f,region_t)+10^(-60))')

map2 = [1 1 1; 0 1 0 ;0 0.5 0; 0.6 0 0;];
colormap(map2);
colormap('default');
colorbar

axis ij
axis square
% image(p_rslots)
% colorbar