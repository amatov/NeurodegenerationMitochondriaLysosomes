function mask = curve2mask(size,axp)


xx=round(axp(1,:) + 0.5); xx(xx>size(1))=size(1);
yy=round(axp(2,:) + 0.5); yy(yy>size(2))=size(2);

ind = sub2ind(size, xx, yy); 
mask=false(size); 
mask(ind)=1;