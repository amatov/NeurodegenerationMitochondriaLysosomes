

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


% load ('tracks11.mat');
% ret=tracksStats(tracksFinal, 3);
x = 243; y = 259;
I = imread('D:\Dmitri\set1\images\Nontg Astrocytes  Lysotracker-Red Hoesct-Image Export-01_b2t0001c3_ORG.tif');
figure,imshow(I,[0 40000])
hold on
plot(x,y,'r*')
% dxs = x- ret(:,2); % X-coord of the track on the first frame
% dys = y- ret(:,3); % Y-coord of the track on the first frame
% dxe = x- ret(:,5) ;% X-coord of the track on the last frame
% dye = y- ret(:,6); % Y-coord of the track on the last frame
% ds = sqrt(dxs.*dxs+dys.*dys);
% de = sqrt(dxe.*dxe+dye.*dye);
% d1 = (de-ds) * 15 / 4.725;
% % figure, quiver(ret(:,2), ret(:,3), ret(:,5)-ret(:,2), ret(:,6)-ret(:,3))
% figure,histogram(d1)
% set(gca,'yscale','log')
% % clear d
% clear ret
% 
% load ('tracks12.mat');
% ret=tracksStats(tracksFinal, 3);
x = 278; y = 279;
I = imread('D:\Dmitri\set2\images\Nontg Astrocytes  Lysotracker-Red Hoesct-02-Image Export-01_b2t0001c3_ORG.tif');
figure,imshow(I,[0 30000])
hold on
plot(x,y,'r*')
% dxs = x- ret(:,2); % X-coord of the track on the first frame
% dys = y- ret(:,3); % Y-coord of the track on the first frame
% dxe = x- ret(:,5); % X-coord of the track on the last frame
% dye = y- ret(:,6); % Y-coord of the track on the last frame
% ds = sqrt(dxs.*dxs+dys.*dys);
% de = sqrt(dxe.*dxe+dye.*dye);
% d2 = (de-ds) * 15 / 4.725;
% % figure, quiver(ret(:,2), ret(:,3), ret(:,5)-ret(:,2), ret(:,6)-ret(:,3))
% figure,histogram(d2)
% set(gca,'yscale','log')
% % clear d
% clear ret

% load ('tracks1.mat');
% ret=tracksStats(tracksFinal, 3);
% I = imread('C:\Documents and Settings\amatov.LCCBWS035\Desktop\Dmitri\dmitri1\images\Nontg Astrocytes Lysotracker Red Hoescht_Room Temperature.czi - Nontg Astrocytes Lysotracker Red Hoescht_Room Temperature0000.tif');
% x = 270; y = 200;
% figure,imshow(I,[0 10000])
% hold on
% plot(x,y,'r*')
% dxs = x- ret(:,2); % X-coord of the track on the first frame
% dys = y- ret(:,3); % Y-coord of the track on the first frame
% dxe = x- ret(:,5); % X-coord of the track on the last frame
% dye = y- ret(:,6) ;% Y-coord of the track on the last frame
% ds = sqrt(dxs.*dxs+dys.*dys);
% de = sqrt(dxe.*dxe+dye.*dye);
% dr = (de-ds) * 15 / 4.725;
% % figure, quiver(ret(:,2), ret(:,3), ret(:,5)-ret(:,2), ret(:,6)-ret(:,3))
% figure,histogram(dr)
% set(gca,'yscale','log')
% % clear d1
% clear ret

% load ('tracks2.mat');
% ret=tracksStats(tracksFinal, 3);
% I = imread('C:\Documents and Settings\amatov.LCCBWS035\Desktop\Dmitri\dmitri2\images\Nontg Astrocytes LysoTrackerRed5.czi - Nontg Astrocytes LysoTrackerRed50000.tif');
% x = 239; y = 207;
% figure,imshow(I,[0 30000])
% hold on
% plot(x,y,'r*')
% dxs = x- ret(:,2); % X-coord of the track on the first frame
% dys = y- ret(:,3); % Y-coord of the track on the first frame
% dxe = x- ret(:,5); % X-coord of the track on the last frame
% dye = y- ret(:,6);% Y-coord of the track on the last frame
% ds = sqrt(dxs.*dxs+dys.*dys);
% de = sqrt(dxe.*dxe+dye.*dye);
% d3 = (de-ds) * 15 / 4.725;
% % figure, quiver(ret(:,2), ret(:,3), ret(:,5)-ret(:,2), ret(:,6)-ret(:,3))
% figure,histogram(d3)
% set(gca,'yscale','log')
% % clear d
% clear ret

% load ('tracks3.mat');
% ret=tracksStats(tracksFinal, 3);
% I = imread('C:\Documents and Settings\amatov.LCCBWS035\Desktop\Dmitri\dmitri3\images\Nontg.tif');
% x = 273; y = 281;
% figure,imshow(I,[0 30000])
% hold on
% plot(x,y,'r*')
% dxs = x- ret(:,2); % X-coord of the track on the first frame
% dys = y- ret(:,3); % Y-coord of the track on the first frame
% dxe = x- ret(:,5); % X-coord of the track on the last frame
% dye = y- ret(:,6); % Y-coord of the track on the last frame
% ds = sqrt(dxs.*dxs+dys.*dys);
% de = sqrt(dxe.*dxe+dye.*dye);
% d4 = (de-ds) * 15 / 4.725;
% % figure, quiver(ret(:,2), ret(:,3), ret(:,5)-ret(:,2), ret(:,6)-ret(:,3))
% figure,histogram(d4)
% set(gca,'yscale','log')


 