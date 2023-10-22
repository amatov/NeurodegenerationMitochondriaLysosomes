function [y] = gm_subm(f1,f2)
if all(size(f1)==size(f2)),
y=f1*0;
w=f1(:)>f2(:);
y(w)=f1(w)-f2(w);
else
  out=[];  
  fprintf(2,'input arrays are of different size\n');  
end;    