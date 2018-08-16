% NOTE: execute runTrainTree first

% Errors for optimal tree
et1 = err(@(x) treeClassify(x, tau1), T);
es1 = err(@(x) treeClassify(x, tau1), S);
fprintf('training err1 = %f\n', et1);
fprintf('test err1 = %f\n', es1);

% Errors for random tree
et2 = err(@(x) treeClassify(x, tau2), T);
es2 = err(@(x) treeClassify(x, tau2), S);
fprintf('training err2 = %f\n', et2);
fprintf('test err2 = %f\n', es2);