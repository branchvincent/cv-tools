function J = decode(C, code)

% Get dims
[k,n] = size(C);
r = code.size(1);
c = code.size(2);

% Decode
mu = code.mu*ones(1, n);
Jc = code.U*C + mu;
J = uint8(reshape(Jc, r, c, n));
