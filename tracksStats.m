function ret = tracksStats(trackInfos, minTrackLifetime)
%OUTPUT:
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

N = numel(trackInfos);
ret = NaN(N, 9);

for i = 1:N

  trackInfo = trackInfos(i);
  tracksFeatIndxCG = trackInfo.tracksFeatIndxCG;
  tracksCoordAmpCG = trackInfo.tracksCoordAmpCG;
  seqOfEvents = trackInfo.seqOfEvents;

  % first frame
  ret(i, 1) = seqOfEvents(1,1);
  % last frame
  ret(i, 4) = seqOfEvents(end,1);
  % lifetime in number of frames
  ret(i, 7) = ret(i,4) - ret(i,1);

  Xs = tracksCoordAmpCG(1:8:end);
  Ys = tracksCoordAmpCG(2:8:end);

  x = Xs(1);
  y = Ys(1);

  % coordinates of the first point
  ret(i, 2) = x;
  ret(i, 3) = y;

  s = 0;
  for j = 2:length(Xs)
      x2 = Xs(j); y2 = Ys(j);
      if isnan(x2) || isnan(y2)
        continue
      end
      s = s + sqrt((x2 - x) ^ 2 + (y2 - y) ^ 2);
      x = x2; y = y2;
  end

  % coordinates of the last point
  ret(i, 5) = x;
  ret(i, 6) = y;

  % total length of the track
  ret(i, 8) = s;
  % average speed
  ret(i, 9) = s / ret(i,7) ;

end % for i

ret = ret(ret(:,7) > minTrackLifetime, :);

end % function

