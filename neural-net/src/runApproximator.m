% Parameters
N = 101;
T = 0.05;
f = @(x) exp(x) .* sin(3*pi*x);

% Approximator
net = approximator(f, T);
x = linspace(0, 1, N);
y = nn(x, net);

% Count weights
nw = 0;
for i = 1:length(net)
    [g1, g2] = size(net(i).gain);
    [b1, b2] = size(net(i).bias);
    nw = nw + g1*g2 + b1*b2;
end
K = ceil(1/T);
nw_est = 9*K + 10;
fprintf('nw err = %d\n', abs(nw_est - nw));

% Plot
clf;
plot(x, f(x), 'b');
hold on;
plot(x, y, 'r');
legend('f(x)', 'g(x)', 'location', 'northwest');
title(sprintf('Function Approximator: Net with %d Weights', nw));
saveas(gcf, 'tex/graphics/2b-approximator.png');