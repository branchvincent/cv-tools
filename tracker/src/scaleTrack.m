function d = scaleTrack(I, J, xI, sigma)

% Constants 
nLevels = 4;
factor = 1/2;

% Compute pyramid, with specified levels
pI = gaussianPyramid(I, factor);
pJ = gaussianPyramid(J, factor);
pI = pI(1:nLevels); 
pJ = pJ(1:nLevels);

% Run lucas kanade, at each level
d = zeros(size(xI));
for l = nLevels:-1:1
    d = lucas_kanade(pI{l}, pJ{l}, xI*factor^(l-1), sigma, d/factor);
end