function C = encode(I, code)

% Get dims
[r,c,n] = size(I);  % num rows, cols, images
m = r*c;            % num pixels

% Encode
Ic = reshape(double(I), m, n);
mu = code.mu*ones(1, n);
C = code.U'*(Ic - mu);
