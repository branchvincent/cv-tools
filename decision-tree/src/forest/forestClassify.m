function y = forestClassify(x, phi)

% Determine number of labels
tau = phi{1};
while isempty(tau.p)
    tau = tau.L;
end
K = length(tau.p);

% Classify
v = zeros(K, 1);
for i = 1:length(phi)
    y = treeClassify(x, phi{i});
    v(y) = v(y) + 1;
end
[~, y] = max(v);

