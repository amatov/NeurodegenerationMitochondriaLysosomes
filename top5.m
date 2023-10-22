% orthogonal regression using SVD
% function X = tls(A,B)
% 
% 
function res=top5(A, frac)

if (frac > 1.0 || frac<0.0) 
    frac=1.0; 
end;

A=double(A(:));
minA=min(A(:));
maxA=max(A(:));

[y,x]= hist(A, minA:maxA );
cdf = cumsum(y)/sum(y);
ind = find(cdf >= frac, 1, 'first');
res=x(ind);
