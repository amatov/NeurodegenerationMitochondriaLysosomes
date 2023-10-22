function out = gm_union(a,b)
if all(size(a)==size(b)),
out=a;
w=b(:)>a(:);
out(w)=b(w);
else
  out=[];  
  fprintf(2,'input arrays are of different size\n');  
end;    