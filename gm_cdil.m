function [y] = gm_cdil(f,g, b, n)

%y = mmsubm(f, mmopen(f,b))
if ~exist('b','var')
    b=strel('disk',1);
end
if ~exist('n','var')
    n=1;
end
y = gm_intersec(f,g);

nn=min(n,100);
%nn=n;
for k=1:nn,
    aux=y;
    y = gm_intersec( imdilate(y,b), g);
    if y==aux, break, end;
end;
