% Define parameters
sigma = 2;
lambdaThresh = 15;
nMax = Inf;
minDist = 20;
margin = 80;

% Find letters
[xI, lambda] = goodFeatures(I, sigma, lambdaThresh, nMax, minDist, margin);
d = scaleTrack(I, J, xI, sigma);
trackable = ~isnan(d(1, :));
fprintf('%d of %d features trackable!\n', sum(trackable), size(d, 2));

% Overlay features (trackable and not) on image I
imshow(I, []); hold on;
plot(xI(2, trackable), xI(1, trackable), '.g', 'MarkerSize', 16);
plot(xI(2, ~trackable), xI(1, ~trackable), '.r', 'MarkerSize', 16);
export_fig('tex/graphics/4d-features-I.png', '-native');

% Overlay features (tracked) on image J
imshow(J, []); hold on;
xJ = xI(:, trackable) + d(:, trackable);
% xJr = xI + squeeze(D(xI(1, :), xI(2, :), :));
plot(xJ(2, :), xJ(1, :), '.g', 'MarkerSize', 16);
export_fig('tex/graphics/4d-features-J.png', '-native');

% Plot displacements
scatterplot(d);
saveas(gcf, 'tex/graphics/4d-scatter.png');