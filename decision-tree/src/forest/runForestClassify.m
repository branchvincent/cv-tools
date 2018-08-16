et = err(@(x) forestClassify(x, phi), T);
es = err(@(x) forestClassify(x, phi), S);
fprintf('training err = %f\n', et);
fprintf('test err = %f\n', es);