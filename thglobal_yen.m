function out = thglobal_yen(r)
%
x=ceil(mat2gray(r)*255);
w=0:255;
[H values] = hist(double(x(:)),w);
Hnrm=H.*(1./sum(H));
P1 = cumsum(Hnrm);
Q1 = 1. - P1;
P1_Sq = cumsum(Hnrm.^2);

w = 256:-1:1; 
Hnrmr = Hnrm(w); 
HnrmCum2=cumsum(Hnrmr.^2);
P2_Sq = HnrmCum2(w);

crit = zeros(1,length(P1_Sq),'double');
q1= P1_Sq.*P2_Sq; 
q2= P1.*Q1;
ww= q1>0 & q2>0;
crit = - log10( q1(ww) ) + 2*log10( q2(ww) );
[ymax,imax] = max(crit);
%out = r > imax;
out=imax;