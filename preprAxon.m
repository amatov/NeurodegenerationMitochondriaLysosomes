FINP='D:\matlab\iPierian\79363_7007.nd2'; %+

data = bfopen(FINP);

data = data{1,1};

NumFrames = size(data,1)/2;

imSize=size(data{1,1});

xrange =[1 imSize(1)];

yrange =[1 imSize(2)];

 

%=========================================================

%

% prepare axon track

%

%=========================================================

 

g=data{2,1};

g=uint8(bytscl(imadjust(g, stretchlim(g, 0.001))));

g