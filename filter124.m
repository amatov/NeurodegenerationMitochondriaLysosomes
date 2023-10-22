function g = filter124(g)
fltr4img = [1 1 1 1 1;1 2 2 2 1;1 2 4 2 1;1 2 2 2 1;1 1 1 1 1];
fltr4img = fltr4img / sum(fltr4img(:));
g = filter2( fltr4img , g );