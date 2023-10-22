
function out=gm_obrcbr(I,sesize)
%se = strel('disk', sesize);
se = strel('disk', sesize);
Ie = imerode(I, se);
Iobr = imreconstruct(Ie, I);
Iobrd = imdilate(Iobr, se);
Iobrcbr = imreconstruct(imcomplement(Iobrd), imcomplement(Iobr));
Iobrcbr = imcomplement(Iobrcbr);
out=Iobrcbr;
