clear all;


% addpath(genpath('c:\work\mario\methodsCMT\Ptoolbox')); %savepath;
% mydir='c:/work/mario/methodsCMT';
% cd(mydir);
% addpath(mydir);

%-------------------
% PLATE 4 expeiment
% %-------------------


% FINP='D:\matlab\iPierian\79363_video_1001.nd2\79363_1001.nd2'; %  
% FINP='D:\matlab\iPierian\79363_video_2002.nd2\79363_2002.nd2'; % 
% FINP='D:\matlab\iPierian\79363_video_3003.nd2\79363_3003.nd2'; %   prop front BAD
% FINP='D:\matlab\iPierian\79363_video_4004.nd2\79363_4004.nd2'; %  
% FINP='D:\matlab\iPierian\79363_video_5005.nd2\79363_5005.nd2'; %   
% FINP='D:\matlab\iPierian\79363_video_6006.nd2\79363_6006.nd2'; %   
% FINP='D:\matlab\iPierian\79363_video_7007.nd2\79363_7007.nd2'; %  

% FINP='D:\matlab\iPierian\3691_video_001.nd2\3691_1.nd2'; % ALL DONE
% FINP='D:\matlab\iPierian\3691_video_002.nd2\3691_2.nd2'; %+
% FINP='D:\matlab\iPierian\3691_video_003.nd2\3691_3a.nd2'; 
% FINP='D:\matlab\iPierian\3691_video_004.nd2\3691_4_2.nd2'; 
% FINP='D:\matlab\iPierian\3691_video_005.nd2\3691_005.nd2'; %  
% FINP='D:\matlab\iPierian\3691_video_006.nd2\3691_006.nd2'; 
% FINP='D:\matlab\iPierian\3691_video_007.nd2\3691_007.nd2';%926.863355 seconds
% FINP='D:\matlab\iPierian\3691_video_008.nd2\3691_008.nd2'; %

% FINP='D:\matlab\iPierian\7F_video_1.nd2\7F_001.nd2';%   
% FINP='D:\matlab\iPierian\7F_video_2.nd2\7F_002.nd2';%  
% FINP='D:\matlab\iPierian\7F_video_3.nd2\7F_003.nd2';% 
% FINP='D:\matlab\iPierian\7F_video_4.nd2\7F_004.nd2';% 2 axons
% FINP='D:\matlab\iPierian\7F_video_5.nd2\7F_005.nd2';%  
% FINP='D:\matlab\iPierian\7F_video_6.nd2\7F_006.nd2';%  
% FINP='D:\matlab\iPierian\7F_video_7.nd2\7F_007.nd2';%  
% FINP='D:\matlab\iPierian\7F_video_8.nd2\7F_008.nd2';%  
% FINP='D:\matlab\iPierian\7F_video_9.nd2\7F_009.nd2';%  2 axons

% 79363 - 7 movies - 6 runs
% 3691 - 8 movies -  done
% 7F - 9 movies - 11 runs
% 9181 - 7 movies - 8 runs
% 9908 - 9 movies - 10 runs
% 68691 - 7 movies -  13 runs

% FINP='D:\matlab\iPierian\9181_video_1.nd2\9181.2_001.nd2';%   
% FINP='D:\matlab\iPierian\9181_video_2.nd2\9181.2_002.nd2';%   
% FINP='D:\matlab\iPierian\9181_video_3.nd2\9181.2_003.nd2';% 
% FINP='D:\matlab\iPierian\9181_video_4.nd2\9181.2_004.nd2';%  
% FINP='D:\matlab\iPierian\9181_video_5.nd2\9181.2_005.nd2';% 
% FINP='D:\matlab\iPierian\9181_video_6.nd2\9181.2_006.nd2';% detection? 
% FINP='D:\matlab\iPierian\9181_video_7.nd2\9181.2_007.nd2';% 2 axons - re-do 1

% FINP='D:\matlab\iPierian\9908_video_1.nd2\9908.1_001.nd2';%  
% FINP='D:\matlab\iPierian\9908_video_2.nd2\9908.1_002.nd2';%  
% FINP='D:\matlab\iPierian\9908_video_3.nd2\9908.1_003.nd2';% 
% FINP='D:\matlab\iPierian\9908_video_4.nd2\9908.1_004.nd2';%  
% FINP='D:\matlab\iPierian\9908_video_5.nd2\9908.1_005.nd2';%  
% FINP='D:\matlab\iPierian\9908_video_6.nd2\9908.1_006.nd2';% 
% FINP='D:\matlab\iPierian\9908_video_7.nd2\9908.1_007.nd2';% 2 axons
% FINP='D:\matlab\iPierian\9908_video_8.nd2\9908.1_008.nd2';% 
% FINP='D:\matlab\iPierian\9908_video_9.nd2\9908.1_009.nd2';%  

% FINP='D:\matlab\iPierian\68691_video_1.nd2\68691_001.nd2';%   
% FINP='D:\matlab\iPierian\68691_video_2.nd2\68691_002.nd2';%  3 axons 
% FINP='D:\matlab\iPierian\68691_video_3.nd2\68691_003.nd2';%  
% FINP='D:\matlab\iPierian\68691_video_4.nd2\68691_004.nd2';%  
% FINP='D:\matlab\iPierian\68691_video_5.nd2\68691_005.nd2';%  - 4 axons 
FINP='D:\matlab\iPierian\68691_video_6.nd2\68691_006.nd2';%   - 2 axons 
% FINP='D:\matlab\iPierian\68691_video_7.nd2\68691_007.nd2';%  

% FINP='\\\\Netapp\scope_video\msaporta\Time laspe\Axonal transport\Plate 4\BO5 video 1001.nd2'; %+
% FINP='\\\\Netapp\scope_video\msaporta\Time laspe\Axonal transport\Plate 4\BO5 video 1002.nd2'; %+
% FINP='\\\\Netapp\scope_video\msaporta\Time laspe\Axonal transport\Plate 4\BO5 video 1003.nd2'; %+
% FINP='\\\\Netapp\scope_video\msaporta\Time laspe\Axonal transport\Plate 4\BO5 video 1004.nd2'; %+
% FINP='\\\\Netapp\scope_video\msaporta\Time laspe\Axonal transport\Plate 4\BO5 video 1.nd2'; %+
% %
% FINP='\\\\Netapp\scope_video\msaporta\Time laspe\Axonal transport\Plate 4\H9 video 1001.nd2'; %+
% FINP='\\\\Netapp\scope_video\msaporta\Time laspe\Axonal transport\Plate 4\H9 video 1002.nd2'; %+
% FINP='\\\\Netapp\scope_video\msaporta\Time laspe\Axonal transport\Plate 4\H9 video 1003.nd2'; %+
% FINP='\\\\Netapp\scope_video\msaporta\Time laspe\Axonal transport\Plate 4\H9 video 1004.nd2'; %+
% FINP='\\\\Netapp\scope_video\msaporta\Time laspe\Axonal transport\Plate 4\H9 video 1.nd2'; %
%
% FINP='\\\\Netapp\scope_video\msaporta\Time laspe\Axonal transport\Plate 4\P8 1video1001.nd2'; %+
% FINP='\\\\Netapp\scope_video\msaporta\Time laspe\Axonal transport\Plate 4\P8 1video1.nd2'; %
% FINP='\\\\Netapp\scope_video\msaporta\Time laspe\Axonal transport\Plate 4\P8 1video1002.nd2';%-
% FINP='\\\\Netapp\scope_video\msaporta\Time laspe\Axonal transport\Plate 4\P8 1video1003.nd2';%-
% FINP='\\\\Netapp\scope_video\msaporta\Time laspe\Axonal transport\Plate 4\P8 1video1004.nd2';%-
%
% FINP='\\\\Netapp\scope_video\msaporta\Time laspe\Axonal transport\Plate 4\P8 4video1.nd2';%
% FINP='\\\\Netapp\scope_video\msaporta\Time laspe\Axonal transport\Plate 4\P8 4video1001.nd2';%
% FINP='\\\\Netapp\scope_video\msaporta\Time laspe\Axonal transport\Plate 4\P8 4video1002.nd2';
% FINP='\\\\Netapp\scope_video\msaporta\Time laspe\Axonal transport\Plate 4\P8 4video1003.nd2';
% FINP='\\\\Netapp\scope_video\msaporta\Time laspe\Axonal transport\Plate 4\P8 4video1004.nd2'; %+
% FINP='\\\\Netapp\scope_video\msaporta\Time laspe\Axonal transport\Plate 4\P8 4video1005.nd2'; %+
%
% FINP='\\\\Netapp\scope_video\msaporta\Time laspe\Axonal transport\Plate 4\P9 2 video1.nd2'; %+
% FINP='\\\\Netapp\scope_video\msaporta\Time laspe\Axonal transport\Plate 4\P9 2 video1001.nd2'; %+
% FINP='\\\\Netapp\scope_video\msaporta\Time laspe\Axonal transport\Plate 4\P9 2 video1002.nd2'; %+
% FINP='\\\\Netapp\scope_video\msaporta\Time laspe\Axonal transport\Plate 4\P9 2 video1003.nd2'; %+
% FINP='\\\\Netapp\scope_video\msaporta\Time laspe\Axonal transport\Plate 4\P9 4video1.nd2';%
% FINP='\\\\Netapp\scope_video\msaporta\Time laspe\Axonal transport\Plate 4\P9 4video1001.nd2';%
% FINP='\\\\Netapp\scope_video\msaporta\Time laspe\Axonal transport\Plate 4\P9 4video1002.nd2';%
% FINP='\\\\Netapp\scope_video\msaporta\Time laspe\Axonal transport\Plate 4\P9 4video1003.nd2';%
% FINP='\\\\Netapp\scope_video\msaporta\Time laspe\Axonal transport\Plate 4\H9 video 1001.nd2'; %+

%use it on linux
% FINP=regexprep(regexprep(FINP, '\', '/'), '////Netapp','/mnt/netapp');

[file_dir, file_name, file_ext, versn] = fileparts(FINP);
file_name=strcat(file_name,file_ext);
MYDIRIN  = file_dir;
% MYDIROUT = regexprep(MYDIRIN, '.*Netapp', 'c:\\work\\mario1');
%use it on linux
% MYDIROUT = regexprep(MYDIRIN, '.*netapp', '/data/methodsCMT/mario1');


MYDIROUT=MYDIRIN;
% MYDIROUT = [MYDIROUT filesep file_name];
% mkdir(MYDIROUT);
mkdir(fullfile(MYDIROUT,'frames'));

SAVE_POINTS_DATA='on';
SAVE_TRACKS_DATA='on';
SAVE_AXON_POINTS='on';
SAVE_PNG='on';


data = bfopen(FINP); %37.083137 seconds
data = data{1,1};
%
% mito planes: i=2*k-1,
% axon planes: i=2*k,  k=1:NumFrames
%
NumFrames = size(data,1)/2;
imSize=size(data{1,1});
xrange =[1 imSize(1)];
yrange =[1 imSize(2)];

%=========================================================
%
% prepare axon track
%
%=========================================================
% DONT TAKE THE FIRST AXON IMAGES BUT THE SECOND, i.e. 21st
g=data{2,1}; %imread(strcat(MYDIRIN,'/',fs_msk1{1})); % READ ANOTHER FRAME - MAYBE NUMBER 20
g=uint8(bytscl(imadjust(g, stretchlim(g, 0.001))));
g = filter124( g );

%
% peyre fast marching
%
getd = @(p)path(p,path);
getd('toolbox_signal/'); % change the path to get in iPierian
getd('toolbox_general/');
getd('toolbox_graph/');

[axp,W,D] = select_axon1(g,5);
start_point=fix(axp(:,1)); end_point=fix(axp(:,end));

%save axon trace image
F = getframe;
pngAxFileOut=fullfile(MYDIROUT,'axon_trace.tiff');
imwrite(F.cdata,pngAxFileOut, 'Compression','lzw','WriteMode', 'overwrite');



%while(1)
%[q1,q2,q3] = locate_axon1(g, start_point, end_point, 18);
%start_point=fix(q1(:,1)); end_point=fix(q1(:,end));
%mask = curve2mask(size(g), axp);
%g1=g - imopen(g,strel('disk',20));
%b = gm_closeth(imcomplement(g1), strel('disk',20));
%AxonMask=regions_grow2(b,mask, 5, 10);
%break;
%end;
%axp0=axp;

% % % mask = curve2mask(size(g), axp);
% % % %save axon trajectory
% % % boundaries = bwboundaries(bwmorph(mask, 'thin', inf));
% % % axp = boundaries{1};
% % % axp = axp(1:floor(end/2), :)';

[mask, axp] = curve2mask1(size(g), axp);


if(strcmp(SAVE_AXON_POINTS,'on'))
    FoutAxonData=fullfile(MYDIROUT, 'axonxy.csv');
    fid = fopen(FoutAxonData, 'wt');
    fprintf(fid,'%s\n','Xax,Yax');
    for ir=1:size(axp,2)
        fprintf(fid,'%g,%g\n',axp(2,ir),axp(1,ir));
    end;
    fclose(fid);
end;


AxonMask=imdilate(mask, strel('disk',10,0));
%imscroll(overlay(g,bwperim(AxonMask),'y',mask,'r' ));
tiffAxonMaskFileOut=fullfile(MYDIROUT,'AxonMask.tiff');
imwrite(uint8(overlay(g,bwperim(AxonMask),'y',mask,'r' )),tiffAxonMaskFileOut, 'Compression','lzw','WriteMode', 'overwrite');



WAIT_FOR_INPUT='off';
PLOT_TRACKS='on';
PLOT_TRACKS_OLD='off';
ADJUST_AXON_POSITION='off';

SAVE_PNG='on';

hFig = figure;
set(hFig, 'visible','off');

RES=zeros(0,9);
kmin=1; kmax=size(data,1)/2; k=kmin;
while (1)
    
    TimeStart_ikjk = tic;
    
    % update axon position
    if(strcmp(ADJUST_AXON_POSITION,'on')),
        g = data{2*k};
        g=uint8(bytscl(imadjust(g, stretchlim(g, 0.001))));
        g = filter124( g );
        [axp,q2,q3] = locate_axon(g, start_point, end_point, 18);
        start_point=fix(axp(:,1)); end_point=fix(axp(:,end));
        mask = curve2mask(size(g), axp);
        g1=g - imopen(g,strel('disk',20));
        b = gm_closeth(imcomplement(g1), strel('disk',20));
        AxonMask=regions_grow2(b,mask, 5, 10);
    end;
    
    
    %finp=[MYDIRIN '/' fs_msk0{k}];
    %im=imread(finp);
    %i0=uint16(conv2(double(imresize(im,1.)),fspecial('gaussian',5,0.5),'same'));]
    im = data{2*k-1}; % READ CORRESPONDING IMAGE 
    finp=sprintf('frame_%d',k);
    % REPLACE FROM HERE -----------------------------------------
    i0 = wiener2(im,[5 5]);
    a = bytscl(imadjust(i0, stretchlim(i0, 0.0001)));
    b = bpass(a,1,3); %  default (a,1,15) 
    b = imfill((bytscl(b)),'holes');
    
    
    %do computation
    bw = adaptivethresh(b, 4, -20, 'gaussian', 'relative'); % (b,4
    bw = bw & b >10;
    bw = imfill(bw,'holes');
    %toggle(im, overlay(b,bw ,'r'));
    
    %remove objects touch large blobs
    bwOut = hysthresh(b, 30, 10);
    bwOut = bwmorph(bwOut,'thin',1);
    bwOut = bwareaopen(bwOut,300);
    Lbw=bwlabel(bw);
    s = regionprops(Lbw,bwOut,'Area','MeanIntensity');
    bw1 = ismember(Lbw, find([s.MeanIntensity] < 0.01 & [s.Area] > 20 & [s.Area] < 140 ));%default bw1 = ismember(Lbw, find([s.MeanIntensity] < 0.01 & [s.Area] > 20
    %toggle(bw,bw1)
    % REPLACE UNTIL HERE ------------------------------------------------------
    % NEW CODE STARTS HERE
%     im = double(im);
%     [detectionResults, detectionMask] = spotDetector(im);
%     bw1 = detectionMask;
    % NEW CODE ENDS HERE -----------------------------------------------
    %check for ovelap with axon
    Lbw=bwlabel(bw1);
    s = regionprops(Lbw,AxonMask,'Area','MeanIntensity');
    bw1 = ismember(Lbw, find([s.MeanIntensity] >0.3 ));
    
    %now compute properties
    sH = {'Area','MeanIntensity','Perimeter','Eccentricity','Centroid','Orientation','Solidity'};
    s = regionprops(bw1,im,sH);
    frameInd=repmat(k,1,length(s));
    sdat=[[s.Area]; [s.MeanIntensity]; [s.Perimeter]; [s.Eccentricity];
        cat(1,s.Centroid)'; [s.Orientation]; [s.Solidity]; frameInd ]';
    
    RES=[RES;sdat];
    
    z = cat(3,uint8(bytscl(im)), g, g*0);
    %z = imresize(z,0.5);
    %z = overlay(z, mask,'r', bwperim(bw1),'w');
    
    %%% hIm = imshow(z,[],'InitialMagnification',100);
    %%% hold on;
    
    if(strcmp(SAVE_PNG,'on'))
        
        
        subplot('position', [0 0 1 1]);
        imshow(z, 'border','tight'); hold on;
        %plot centroids for current frame
        for jj = 1:numel(s)
            plot(s(jj).Centroid(1), s(jj).Centroid(2), 'y+');
        end;
        hold off;
        
        rectangle('Position', [100, 100, 10, 10]);
        [H,W,D] = size(z);
        dpi = 100;
        set(hFig, 'paperposition', [0 0 W/dpi H/dpi]);
        set(hFig, 'papersize', [W/dpi H/dpi]);
        %print(hFig, sprintf('-r%d',dpi), '-dtiff', 'image2.tif');
        pngFileOut=fullfile(MYDIROUT,'frames', ['frame_' sprintf('%04d',k) '.png']);
        print(hFig, '-r80', '-dpng', pngFileOut);
        
        %axis off; axis image;
        %set(hFig,'visible','on');
        % % % % else
        % % % %   subplot('position', [0 0 1 1]);
        % % % %   imshow(z, 'border','tight'); hold on;
        % % % %   %plot centroids for current frame
        % % % %   for jj = 1:numel(s)
        % % % %     plot(s(jj).Centroid(1), s(jj).Centroid(2), 'w+');
        % % % %   end;
        % % % %   axis off; axis image;
    end;
    
    
    if(strcmp(PLOT_TRACKS_OLD,'on')),
        %plot trajectories
        ColTrackId=4; ColXpos=1; ColYpos=2;
        MinTrackId = min(tr(:,ColTrackId));
        MaxTrackId = max(tr(:,ColTrackId));
        
        cstring='rgbcmy';
        for itr=MinTrackId:MaxTrackId,
            indTrack=tr(:,ColTrackId)==itr;
            plot( tr(indTrack,ColXpos), tr(indTrack,ColYpos), cstring(mod(itr,6)+1));
        end;
    end;
    
    
    
    %%% hold off;
    %%% drawnow;
    %toggle(b,overlay(b,bwperim(bw1),'r'));
    
    if(strcmp(WAIT_FOR_INPUT,'on')),
        keyin = getkey ;
        switch lower(keyin)
            case {'f'}
                k=min(k+1,kmax);
            case {'b'}
                k=max(k-1,kmin);
            case {'q'}
                break;
        end;
    else
        k=k+1;
        if (k>kmax), break;end;
    end;
    
    
    
    %%set(hFig','Name',finp,'Selected','on');
    
    fprintf(1,'%s\t',finp);
    TimeEnd_ikjk   = toc(TimeStart_ikjk);
    fprintf(1,'%g\n',TimeEnd_ikjk);
    
end;

%
% save results of segmentations for all processed fames
%
if(strcmp(SAVE_POINTS_DATA,'on'))
    FoutCellData=fullfile([MYDIROUT '\points.csv']);
    fid = fopen(FoutCellData, 'wt');
    fprintf(fid,'%s\n','Area,MeanIntensity,Perimeter,Eccentricity,CentroidX,CentroidY,Orientation,Solidity,frameInd');
    for ir=1:size(RES,1)
        fprintf(fid,'%g,%g,%g,%g,%g,%g,%g,%g,%g\n', RES(ir,:));
    end;
    fclose(fid);
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% save results of trajectory reconstruction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pos_lst= RES(:,[5 6 9]);
maxdisp=30; param.mem=1; param.good=10; param.dim=2;param.quiet=0;
tr = track(pos_lst, maxdisp, param);

if(strcmp(SAVE_TRACKS_DATA,'on'))
    FoutTrackData=fullfile(MYDIROUT ,'tracks.csv');
    fid = fopen(FoutTrackData, 'wt');
    fprintf(fid,'%s\n','Xcm,Ycm,frameInd,TrackId');
    for ir=1:size(tr,1)
        fprintf(fid,'%g,%g,%g,%g\n',tr(ir,:));
    end;
    fclose(fid);
end;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



if(strcmp(PLOT_TRACKS,'on')),
    imscroll1(g,70); hold on;
    %plot trajectories
    ColTrackId=4; ColXpos=1; ColYpos=2;
    MinTrackId = min(tr(:,ColTrackId));
    MaxTrackId = max(tr(:,ColTrackId));
    
    cstring='rgbcmy';
    for itr=MinTrackId:MaxTrackId,
        indTrack=tr(:,ColTrackId)==itr;
        plot( tr(indTrack,ColXpos), tr(indTrack,ColYpos), cstring(mod(itr,6)+1));
        %R = input(int2str(itr));
    end;
    %xlim(xrange); ylim(yrange);
    hold off;
    
    F = getframe;
    tiffTracksFileOut=fullfile(MYDIROUT,'all_tracks.tiff');
    imwrite(F.cdata,tiffTracksFileOut, 'Compression','lzw','WriteMode', 'overwrite');
    imwrite(uint8(bytscl(g)),tiffTracksFileOut, 'Compression','lzw','WriteMode', 'append');
    %imwrite(F.cdata,pngTracksFileOut, 'Compression','lzw','WriteMode', 'overwrite');
end;


PLOT_Kymograph='on';
if(strcmp(PLOT_Kymograph,'on')),
    
    % %     %AxonIndx = find(mask);
    % %     %[B,L] = bwboundaries(mask,'noholes');
    % %     %boundary = B{1};
    % %     mask1 = bwmorph(mask, 'thin', inf);
    % %     boundaries = bwboundaries(mask1);
    % %     b = boundaries{1};
    % %     b = b(1:floor(end/2), :);
    % %     AxonIndx=sub2ind(size(mask),b(:,1),b(:,2));
    
    b=axp';
    AxonIndx=sub2ind(size(mask),b(:,1),b(:,2));
    kernel=fspecial('gaussian',10,5);
    
    %kmin=1; kmax=100;
    kymo=zeros(kmax-kmin+1,length(AxonIndx));
    
    for k=kmin:kmax,
        %finp=[MYDIRIN '/' fs_msk0{k}];
        %im=imread(finp);
        im = data{2*k-1};
        finp=sprintf('frame_%d',k);
        %im=conv2(double(im),kernel,'same');
        im=conv2(double(im), 1.0*getnhood(strel('disk', 5)), 'same' );
        kymo(k,1:end)=im(AxonIndx);
        fprintf(1,'%s\n',finp);
    end;
    pngKymFileOut=fullfile(MYDIROUT, 'Kymograph.tiff');
    imwrite(imresize(uint8(bytscl(kymo)),1.),pngKymFileOut, 'Compression','lzw','WriteMode', 'overwrite');
    
end;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% prjection
%

FoutTrackAlongData=fullfile(MYDIROUT, 'tracks_Lcm.csv');
trOut = zeros(size(tr,1), size(tr,2)+1);
trOut(1:size(tr,1),1:size(tr,2)) = tr;
ExtraCol=size(tr,2)+1;


cxy=fliplr(axp');
lenxy = zeros(size(cxy,1),1);
dx1=diff(cxy(:,1));
dy1=diff(cxy(:,2));
lenxy(2:end)=cumsum(sqrt(dx1.*dx1 + dy1.*dy1));

h=figure;hold all;
if(strcmp(PLOT_TRACKS,'on')),
    %plot trajectories
    ColTrackId=4; ColXpos=1; ColYpos=2;
    MinTrackId = min(tr(:,ColTrackId));
    MaxTrackId = max(tr(:,ColTrackId));
    
    cstring='rgbcmy';
    for itr=MinTrackId:MaxTrackId,
        indTrack=tr(:,ColTrackId)==itr;
        pnts=[tr(indTrack,ColXpos), tr(indTrack,ColYpos)];
        [xy,distance,t_a] = distance2curve(cxy,pnts,'linear');
        p=plot( tr(indTrack,3), t_a*lenxy(end), cstring(mod(itr,6)+1));
        set(p, 'LineWidth', 2);
        trOut(indTrack,ExtraCol)=t_a*lenxy(end);
        %p=plot( tr(indTrack,ColXpos), tr(indTrack,ColYpos), cstring(mod(itr,6)+1)); set(p, 'LineWidth', 2);
        %p=plot( tr(indTrack,3), tr(indTrack,ColXpos), cstring(mod(itr,6)+1)); set(p, 'LineWidth', 2);
    end;
end;

xlabel('frame'); ylabel('x coordinate [px]');
xlabel('frame'); ylabel('coordinate along the axon [px]');
pdfAxTrajsFileOut=fullfile(MYDIROUT, 'trajs_along_axon.pdf');
print(h,'-dpdf',pdfAxTrajsFileOut);
%xlabel('x coordinate [px]'); ylabel('y coordinate [px]');
%set(hh, 'LineWidth', 2);

fid = fopen(FoutTrackAlongData, 'wt');
fprintf(fid,'%s\n','Xcm,Ycm,frameInd,TrackId,Lcm');
for ir=1:size(trOut,1)
    fprintf(fid,'%g,%g,%g,%g,%g\n',trOut(ir,:));
end;
fclose(fid);







% mail = 'matlab.ipierian@gmail.com';
% password = 'matlab.ipierian123';
% setpref('Internet','E_mail',mail);
% setpref('Internet','SMTP_Server','smtp.gmail.com');
% setpref('Internet','SMTP_Username',mail);
% setpref('Internet','SMTP_Password',password);
% props = java.lang.System.getProperties;
% props.setProperty('mail.smtp.auth','true');
% props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
% props.setProperty('mail.smtp.socketFactory.port','465');
% %sendmail('dnvolfson@gmail.com',FINP,'Hello! I am done!');
% sendmail('dvolfson@ipierian.com',FINP,'Hello! I am done!');
