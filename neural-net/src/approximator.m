function net = approximator(f, T)

% Adjust T
K = ceil(1/T);
T = 1/K;

% First layer
k = repmat(0:K, 3, 1);
v1 = repmat([-1 0 1]', K+1, 1);
net(1).gain = 1/T * ones(3*(K+1), 1);
net(1).bias = -k(:) - v1;
net(1).h = @(a) max(0, a);

% Second layer
a = repmat(arrayfun(f, 0:T:1), 3, 1);
v2 = repmat([1 -2 1], 1, K+1);
net(2).gain = a(:)' .* v2;
net(2).bias = zeros(1, 1);
net(2).h = @(a) a;
