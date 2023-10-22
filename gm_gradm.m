% def mmgradm(f, Bdil=None, Bero=None):
%     if Bdil is None: Bdil = mmsecross()
%     if Bero is None: Bero = mmsecross()
%     y = mmsubm(mmdil(f,Bdil),mmero(f,Bero))
%     return y
function out=gm_gradm(f, bdil, bero)

if ~exist('bdil','var')
    bdil=strel('disk',1);
end
if ~exist('bero','var')
    bero=strel('disk',1);
end
f1=imdilate(f,bdil);
f2=imerode(f,bero);
%out=f1-f2;
if isa(f,'uint8'), kmin=uint8(0); else kmin=double(0); end;
w=(f1(:)+kmin)>f2(:);
out=repmat(kmin,size(f));
out(w)=f1(w)-f2(w);