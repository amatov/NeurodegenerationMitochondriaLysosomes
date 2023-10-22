function out=gm_asf(a,n)

for k=1:n,
    se=strel('diamond',k);
    a = imclose(a,se);
    a = imopen(a,se);

end;
out=a;
