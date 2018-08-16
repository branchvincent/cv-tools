data = readMNISTData('data');
k = 40;

% PCA
tic
[codeAll, sAll] = imagePCA(data.image, k);
toc 

% Variance
tic
pAll = variancePercentage(sAll);
toc

% Plot variance
showP(pAll)
saveas(gcf, 'tex/graphics/3b-variance.png');

% Compression ratio
[r,c,n] = size(data.image);
fprintf('rho: %f\n', r*c/k);

% Total var
fprintf('var: %f\n', pAll(k));
