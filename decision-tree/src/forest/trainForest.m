function [phi, used] = trainForest(T, M)

N = length(T.y);
used = zeros(N, M);
samples = 1:N;

% Train each tree
phi = cell(1, M);
for m = 1:M
    % Get random tree
    r = round(1 + (N-1) * rand(N, 1));
    used(:, m) = ismember(samples, r);
    S.X = T.X(r, :); 
    S.y = T.y(r);
    S.labelMap = T.labelMap;
    % Train tree
    phi{m} = trainTree(S, 0, true);
end