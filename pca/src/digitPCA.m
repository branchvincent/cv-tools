function [code, p] = digitPCA(data, k)

digit = 0:9;
N = length(digit);
code = cell(1, N);

[r,c,n] = size(data.image);
m = r*c;
p = zeros(min(m, n), N);

% Compute PCA for each digit
for d=1:N
    I = data.image(:, :, data.label == digit(d));
    [code{d}, s] = imagePCA(I, k);
    p(:, d) = variancePercentage(s);
end