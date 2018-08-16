% Define parameters
sigma = 2;
lambdaThresh = 15;
nMax = Inf;
minDist = 20;
margin = 80;
h = 20;

% Find features
[xI, lambda] = goodFeatures(I, sigma, lambdaThresh, nMax, minDist, margin);

%% Run for best feature
xI1 = xI(:, 1);
fprintf('xI_good = %s\n', mat2str(xI1));
[e, dSpan] = ssdGraph(I, J, xI1, sigma, h);

% Plot
mesh(dSpan, dSpan, e);
axis ij
xlabel('column displacement');
ylabel('row displacement');
saveas(gcf, 'tex/graphics/4c-ssd.png');

%% Run for untracked feature
xI_bad = xI(:, ~trackable);
xI2 = xI_bad(:, 1);
fprintf('xI_bad = %s\n', mat2str(xI2));
[e, dSpan] = ssdGraph(I, J, xI2, sigma, h);

% Plot
mesh(dSpan, dSpan, e);
axis ij
xlabel('column displacement');
ylabel('row displacement');
saveas(gcf, 'tex/graphics/4e-untracked.png');