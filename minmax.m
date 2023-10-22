
function minmax(d)
%
vmin=double(3);
vmax=double(3);
if size(size(d),2)==2
    k=1;
    v=asvector(d(:,:)); 
    vmin(k)=min(v);  
    vmax(k)=max(v);
    str=['[' num2str(vmin(k)) ' : ' num2str(vmax(k)) ']' ];
    disp(str);
else    
for k=1:3, 
    v=asvector(d(:,:,k)); 
    vmin(k)=min(v);  
    vmax(k)=max(v);
    str=['[' num2str(vmin(k)) ' : ' num2str(vmax(k)) ']' ];
    disp(str);
end;

end;