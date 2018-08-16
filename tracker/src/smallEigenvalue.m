function lambdaMin = smallEigenvalue(I, sigma)

% Constants
[m, n] = size(I);
I = double(I);
h = ceil(2.5*sigma);

% Calculate convolution
G = grad(I);
Gamma = [G{1, :}.^2, G{1, :} .* G{2, :}, G{2, :}.^2];
w = gauss(-h:h, 0, sigma, 1);
A = conv2(w, w, Gamma, 'same');

% Calculate smallest eigenvalue image
S = A(:, 1:n) + A(:, 2*n+1:3*n);
D = sqrt((A(:, 1:n) - A(:, 2*n+1:3*n)).^2 + 4*A(:, n+1:2*n).^2);
lambdaMin = S - D;