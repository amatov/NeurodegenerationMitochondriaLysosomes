function out=bytscl(in)
in=double(in);
minin=min(in(:));
maxin=max(in(:));
dd=maxin-minin;
out=in;
out(:)=round((in(:)-minin)*(255/dd)) ;
