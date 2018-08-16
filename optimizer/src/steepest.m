function [x, allx] = steepest(Grad, x, maxits, deltax)

% Initialize allx
if ~isinf(maxits)
    allx = zeros(length(x), maxits + 1); 
end

% Compute first iteration
allx(:, 1) = x;
x = linesearch(Grad, x, -Grad(x));
g = Grad(x);
allx(:, 2) = x;
it = 2;

% Search
while norm(g) ~= 0 && norm(allx(:, it) - allx(:, it - 1)) >= deltax && it <= maxits 
    % Compute new x
    x = linesearch(Grad, x, -g);
    g = Grad(x);
    % Update
    it = it + 1;
    allx(:, it) = x;
end

% Reduce allx
if ~isinf(maxits)
    allx(:, it+1:end) = [];
end
