function [mask,axcrv] = curve2mask1(sizea,axp)


xx=round(axp(1,:) + 0.5); xx(xx>sizea(1))=sizea(1);
yy=round(axp(2,:) + 0.5); yy(yy>sizea(2))=sizea(2);

IndIn= false(1,length(xx));
for l=2:length(xx),
    if xx(l) ~=xx(l-1) || yy(l) ~= yy(l-1),
        IndIn(l-1)=1;
    end;
    
end;
xx=xx(IndIn);
yy=yy(IndIn);
ind = sub2ind(sizea, xx, yy); 
mask=false(sizea); 
mask(ind)=1;
axcrv=[xx;yy];