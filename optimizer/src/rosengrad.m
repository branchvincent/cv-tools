function g = rosengrad(x)

g1 = -400*x(1)*(x(2) - x(1)^2) - 2*(1 - x(1));
g2 = 200*(x(2) - x(1)^2); 
g = [g1 g2]';