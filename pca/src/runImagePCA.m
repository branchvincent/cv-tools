load Im
[c, s] = imagePCA(Im, 4);
fprintf('c.U = %0.4f \n', c.U);
fprintf('c.mu = %0.4f \n', c.mu);
fprintf('c.size = %0.4f \n', c.size);
fprintf('s = %0.4f \n', s);