function out=gm_areaopen(a,f)

y=zeros(size(a));
for k=min(a(:)):max(a(:)), 
    fk=a>k; 
    fo=bwareaopen(fk,f);
    if max(fo(:))==0, break, end;
    y = y + double(fo); 
end;
out=y;