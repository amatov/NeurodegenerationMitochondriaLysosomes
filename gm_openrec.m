function y = gm_openrec(f,bero,bc)
%        - Description
%             gm_openrec creates the image y by an inf-reconstruction of the
%             image f from its erosion by bero , using the connectivity
%             defined by Bc .


%y = mmsubm(f, mmopen(f,b))
if ~exist('bero','var')
    bero=strel('disk',1);
end
if ~exist('bc','var')
    bc=strel('disk',1);
end
y = gm_infrec(imerode(f,bero),f,bc);

