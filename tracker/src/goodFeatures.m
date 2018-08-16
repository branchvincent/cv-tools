function [pos, lambda] = goodFeatures(I, sigma, lambdaThresh, nMax, minDist, margin)

% Calculate smallest eigenvalue image
[m, n] = size(I);
lambdaMin = smallEigenvalue(I, sigma);

% Discard margin
X = combvec(margin+1:m-margin, margin+1:n-margin)';     % NOTE: requires nnet package
lambdaMin = lambdaMin(margin+1:end-margin, margin+1:end-margin);

% Discard small lambdas
indx = find(lambdaMin >= lambdaThresh);
X = X(indx, :);    
lambdaMin = lambdaMin(indx);

% Sort 
[lambdaMin, indx] = sort(lambdaMin);
X = X(indx, :);

% Compute good features
pos = []; 
lambda = [];
n = 1;
while n <= nMax && ~isempty(X)
    % Save best feature
    w = X(1, :);
    pos = [pos w'];
    lambda = [lambda lambdaMin(1)];
    % Discard overlaps
    dist = arrayfun(@(n) norm(X(n, :) - w), 1:size(X, 1));
    indx = dist >= minDist;
    X = X(indx, :);
    lambdaMin = lambdaMin(indx);
    n = n + 1;
end