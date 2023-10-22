function [WSj,WSe,d] = cwatershed(a,asfn,gradmr,display)

if ~exist('asfr','var')
    asfn=2;
end

if ~exist('gradmr','var')
    gradmr=2;
end

if ~exist('display','var')
    display='off';
end


c = gm_asf(a,asfn);
%c = gm_areaopen(a,50);
%display2(a,c);

hh=getnhood(strel('disk',1));
d = imregionalmax(c,hh);

%d = imopen(d, strel('disk',2));
%display2(a,overlay2(a,d));

e=imcomplement(a);
L = watershed(imimposemin(e, d));
WSe = L==0;
%display2(a, overlay3(a,d,WSe));

%remove pixels of seed markers from the neighborhood of WSe
se0 =strel('square',3);
z=imdilate(WSe,se0)>0;
d(z)=0;

g = double(WSe);
h = bwlabel(d); h(:)=h(:)+1;
h(d==0)=0;
%h(WSe==1)=1;
i=gm_union(g,h);

se_gradm=strel('disk',gradmr);
j=gm_gradm(a,se_gradm,se_gradm);
%%ab=blur(a,5,'gauss');
%%j=gm_gradm(ab,se_gradm,se_gradm);

%display2(label2rgb(i,'jet','black','shuffle'),j);
k = watershed(imimposemin(j, i));
WSj = k==0;

WSj = imclearborder(WSj,8);
d = imclearborder(d,8);
%display2(overlay2(a,i>0), overlay3(a,d,WSj));
if(strcmp(display,'on'))
 %display2(a, overlay3(a,d,WSj));
 imscroll(overlay3(a,d,WSj));
end
%imscroll(overlay3(a,d,WSj))
%imscroll(a)
%imscroll(overlay2(a,WSe))
%figure, imshow(label2rgb(k,'jet','y'));
