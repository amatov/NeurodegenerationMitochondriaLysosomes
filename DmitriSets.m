

% ret: N x 9 matrix, where N is the number of tracks with lifetime more than minTrackLifetime
% the columns of ret have the following meaning
% ret(:,1) : first frame of the track
% ret(:,2) : X-coord of the track on the first frame
% ret(:,3) : Y-coord of the track on the first frame
% ret(:,4) : last frame of the track
% ret(:,5) : X-coord of the track on the last frame
% ret(:,6) : Y-coord of the track on the last frame
% ret(:,7) : Lifetime of the track in frames (includes the frames between the segments)
% ret(:,8) : length of the track trajectory
% ret(:,9) : average speed over the whole lifetime


load ('tracks11.mat');
ret=tracksStats(tracksFinal, 3);
s1=ret(:, 9) * 15 / 4.725;

load ('tracks12.mat');
ret=tracksStats(tracksFinal, 3);
s2=ret(:, 9) * 15 / 4.725;

load ('tracks1.mat');
ret=tracksStats(tracksFinal, 3);
s3=ret(:, 9) * 15 / 4.725;

load ('tracks2.mat');
ret=tracksStats(tracksFinal, 3);
s4=ret(:, 9) * 15 / 4.725;

load ('tracks3.mat');
ret=tracksStats(tracksFinal, 3);
s5=ret(:, 9) * 15 / 4.725;


si = max([size(s1,1),size(s2,1),size(s3,1),size(s4,1),size(s5,1)]);
 

N00(1:si - size(s1,1))=nan;
s11 = [s1',N00];
N(1:11188)=nan;
s22 = [s2',N];
N94(1:si - size(s3,1))=nan;
s33 = [s3',N94];
N109(1:si - size(s4,1))=nan;
s44 = [s4',N109];

N101(1:si - size(s5,1))=nan;
s55 = [s5',N101];



% figure, boxplot(s11,s22,s33,s44,s55,'notch',1,'whisker',1.5,  ...
%     'widths', 0.1, 'labels',  {'set1','set2','room t','set3','set4'},...
%      'positions' , [ 1, 3, 5, 7, 9])
%  
 
 
 
 
 figure, boxplot(s11,'notch',1,'whisker',1.5,  ...
    'widths', 0.1, 'labels',  {'set1'},...
     'positions' , [ 1])
 ylim([-1 13])
 
  figure, boxplot(s22,'notch',1,'whisker',1.5,  ...
    'widths', 0.1, 'labels',  {'set 2'},...
     'positions' , [ 1])
 ylim([-1 13])
 
  figure, boxplot(s33,'notch',1,'whisker',1.5,  ...
    'widths', 0.1, 'labels',  {'room t'},...
     'positions' , [ 1])
 ylim([-1 13])
 
  figure, boxplot(s44,'notch',1,'whisker',1.5,  ...
    'widths', 0.1, 'labels',  {'set3'},...
     'positions' , [ 1])
 ylim([-1 13])
 
  figure, boxplot(s55,'notch',1,'whisker',1.5,  ...
    'widths', 0.1, 'labels',  {'set4'},...
     'positions' , [ 1])
 ylim([-1 13])