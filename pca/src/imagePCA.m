function [code, s] = imagePCA(images, k)

[r,c,n] = size(images); % num rows, cols, images
m = r*c;                % num pixels
p = min(m, n);

% Check k
if k > p
    k = p;
end

% Algorithm 1
A = reshape(double(images), m, n);
mu = A*ones(n, 1)/n;
Ac = A - mu*ones(1, n);
[U,S,~] = svd(Ac);
U = U(:, 1:k);
s = diag(S)/sqrt(n - 1);

% Set return values
code.U = U;
code.mu = mu;
code.size = [r c];