function X = nn(X, net)

for i = 1:length(net)
    [~, N] = size(X);
    a = net(i).gain*X + repmat(net(i).bias, 1, N);
    X = net(i).h(a);
end

