function out=overlay(a,mask1,col1,mask2,col2,mask3,col3,mask4,col4)
a=uint8(bytscl(a));

switch nargin
   case 3
      c1=rgb(col1); 
      out=imoverlay(a, mask1, c1);
   case 5
      c1=rgb(col1);
      c2=rgb(col2);
      out=imoverlay(imoverlay(a, mask1, c1), mask2, c2); 
   case 7
     c1=rgb(col1);
     c2=rgb(col2);
     c3=rgb(col3);
     out=imoverlay(imoverlay(imoverlay(a, mask1, c1), mask2, c2), mask3, c3); 
   case 9
     c1=rgb(col1);
     c2=rgb(col2);
     c3=rgb(col3);
     c4=rgb(col4);
     out=imoverlay(imoverlay(imoverlay(imoverlay(a, mask1, c1), mask2, c2), mask3, c3), mask4, c4); 
   otherwise
      disp('RTFM')
end

