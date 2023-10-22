function [gpath,W,D] = locate_axon1(img, start_point, end_point, nei_size, show_result)

if ~exist('nei_size','var')
    nei_size=5;
end
if ~exist('show_result','var')
    show_result='off';
end


%if ( strcmp(hessian_work,'on'))
    I=double(img);
    FrangiBeta=0.5;
    FrangiC=4.;
    Sigma=2.5;
    beta  = 2*FrangiBeta^2;
    c     = 2*FrangiC^2;
    %for bright
    % abs(Lambda1)<abs(Lambda2)
    [L1,L2,Ix,Iy] = hessianeigs(I,Sigma);
    % Compute some likelyhoods
    L1(abs(L1)<eps) = eps;
    Rb2 = (L1./L2).^2;
    S2 = L1.^2 + L2.^2;
    W = exp(-Rb2/beta) .*(ones(size(I))-exp(-S2/c));
    W(L2>0)=0;
    %imscroll(I2)
%end;

W=rescale(W);
epsilon = 1e-2;
W = epsilon + W;


% imscroll(img); hold on;
% [xx,yy] = ginput(2);
% start_point=[yy(1);xx(1)];
% end_point=[yy(2);xx(2)];


% find local maxima in the neighbs of start/end points

start_point=fix(start_point);
end_point=fix(end_point);
mask=false(size(W));
mask(start_point(1),start_point(2))=1;
mask(end_point(1),end_point(2))=1;
%nei_size=18;
mask = imdilate(mask, strel('disk',nei_size,0));

if ( strcmp(show_result,'on'))
  imscroll( overlay(img, bwperim(mask),'r')); hold on;
end;

inds=zeros(2,1);
Lmask=bwlabel(mask);
Lstart=Lmask(start_point(1), start_point(2)); 
px=find(Lmask==Lstart); pxv=W(px); ii = find(pxv==max(pxv(:)), 1, 'first'); 
inds(1)=px(ii);
    
Lend=Lmask(end_point(1), end_point(2));
px=find(Lmask==Lend); pxv=W(px); ii = find(pxv==max(pxv(:)), 1, 'first'); 
inds(2)=px(ii);

Wmaxvals=W(inds);
[Imax,Jmax] = ind2sub(size(W),inds);

Wold1 = W(start_point(1), start_point(2));
Wold2 = W(end_point(1), end_point(2));

if(Wmaxvals(1) > 1.2*Wold1),
start_point(1)=Imax(1) ; start_point(2)=Jmax(1) ;
end;
if(Wmaxvals(2) > 1.2*Wold2),
  end_point(1)=Imax(2);   end_point(2)=Jmax(2) ;
end;



tic,clear options;
options.nb_iter_max = Inf;
options.end_points = end_point; % stop propagation when end point reached
[D,S] = perform_fast_marching(W, start_point, options);
gpath = compute_geodesic(D,end_point);toc;
%imscroll(W); hold on;
if ( strcmp(show_result,'on'))
    
  h = plot(start_point(2),start_point(1), '.r'); set(h, 'MarkerSize', 15); 
  h = plot(end_point(2),end_point(1), '.r'); set(h, 'MarkerSize', 15);
  h = plot(gpath(2,:),gpath(1,:), '-b'); set(h, 'LineWidth', 1);
  hold off;
end;
