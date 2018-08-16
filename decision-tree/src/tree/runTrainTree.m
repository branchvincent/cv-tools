% addpath(genpath('./'));
% load data

rng(3);

% Optimal tree
tau1 = trainTree(T, 0, false);
showPartition(tau1, T, 1);
saveas(gcf, 'tex/graphics/2a-part1.png');

% Random tree
tau2 = trainTree(T, 0, true);
showPartition(tau2, T, 2);
saveas(gcf, 'tex/graphics/2a-part2.png');

% Classify x
x = [0 0];
y = treeClassify(x, tau1);