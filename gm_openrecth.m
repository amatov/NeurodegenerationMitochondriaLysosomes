function y = gm_openrecth(f,bero,bc)
%        - Description
%            gm_openrecth creates the image y by subtracting the open by
%            reconstruction of f , defined by the structuring elements bero e
%            bc , of f itself.


%y = mmsubm(f, mmopen(f,b))
if ~exist('bero','var')
    bero=strel('disk',1);
end
if ~exist('bc','var')
    bc=strel('disk',1);
end
y = gm_subm(f,gm_openrec(f,bero,bc));
%y = mmsubm(f, mmopenrec( f, bero, bc))

%%http://www.mmorph.com/mxmorph/html/morph/mmopenrecth.html
% a = imread('keyb.jpg');a=a(:,:,1);
% b = gm_openrecth(a,strel('square',4));