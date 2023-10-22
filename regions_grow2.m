
%function BWout = regions_grow2(I, mask, thglobal, nring)
function BW1 = regions_grow2(I, mask, thglobal, niter)

BW1=mask;
sd1=strel('disk',1);
BD = -bwdist(mask,'euclidean');
BD = exp(-BD.*BD/25); 
GBW=I.*BD>thglobal;

for k=1:niter
BW2=imdilate(BW1,sd1);
BW1=(BW2 & GBW) | mask;
end;

BW1=imclose(imopen(BW1,sd1),sd1);


%toggle(I, label2rgb(L2,'jet','black'));
%toggle(L1, label2rgb(L3,'jet','black'));



