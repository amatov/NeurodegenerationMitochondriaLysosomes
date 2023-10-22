
function out=gm_obr(I,sesize)
%se = strel('disk', sesize);
se = strel('disk', sesize);
Ie = imerode(I, se);
Iobr = imreconstruct(Ie, I);
out=Iobr;
