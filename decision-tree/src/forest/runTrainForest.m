rng(3);
M = 10;

tic
[phi, used] = trainForest(T, M);
toc