function dn2tif

n = 301;
   L=length(num2str(n)); 
strg=sprintf('%%.%dd',L); % Creates the format string for the numerical indexes

for i = 1:size(data,1)/2 % 301
    
   
indxStr=sprintf(strg,i);
    imwrite(data{(2*i-1),1},['D:\matlab\iPierian\images\79363_7007_',indxStr,'.tif']);
    
end