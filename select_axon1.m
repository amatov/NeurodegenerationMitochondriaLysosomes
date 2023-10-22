function [gpath,W,D] = select_axon1(img,npnts)


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
    %imscroll(W)
%end;

W=rescale(W);
epsilon = 1e-2;
W = epsilon + W;

imscroll1(img,70); hold on;
[xx,yy] = ginput(npnts);
gpath=zeros(2,0);

for ipnt=2:npnts
    start_point=[yy(ipnt-1);xx(ipnt-1)];
    end_point=[yy(ipnt);xx(ipnt)];
    %h1 = plot(start_point(2),start_point(1), '.r'); set(h1, 'MarkerSize', 25);
    %h2 = plot(end_point(2),end_point(1), '.r'); set(h2, 'MarkerSize', 25);
    %hold off;
    %imscroll(img); hold on;

    tic,clear options;
    options.nb_iter_max = Inf;
    options.end_points = end_point; % stop propagation when end point reached
    [D,S] = perform_fast_marching(W, start_point, options);
    gpathi = compute_geodesic(D,end_point);toc;
    gpathi=fliplr(gpathi);
    %imscroll(W); hold on;
    h = plot(start_point(2),start_point(1), '.r'); set(h, 'MarkerSize', 25);
    h = plot(end_point(2),end_point(1), '.g'); set(h, 'MarkerSize', 25);
    h = plot(gpathi(2,:),gpathi(1,:), '-b'); set(h, 'LineWidth', 2);
    %gpath=gpath(:,1:end-1); 
    gpath=[gpath gpathi];
 end;

hold off;
