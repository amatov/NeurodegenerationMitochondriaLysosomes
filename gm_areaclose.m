function out=gm_areaclose(a,f,b)
out = imcomplement(gm_areaopen(imcomplement(a),f));

