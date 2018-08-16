% Define parameters
sigma = 2;
lambdaThresh = 15;
nMax = Inf;
minDist = 20;
margin = 80;

% Find features
[pos, lambda] = goodFeatures(I, sigma, lambdaThresh, nMax, minDist, margin);
fprintf('%d features found!\n', size(pos, 1));

% Overlay features on image
imshow(I, []); hold on;
plot(pos(2, :), pos(1, :), '.g', 'MarkerSize', 16);
export_fig('tex/graphics/4b-features.png', '-native');