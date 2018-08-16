xs = [1 1]';

% Run steepest descent
fprintf('Normal\n');
x0 = [-1.2 1]';
deltax = 1.0e-4; maxit = 100;
[x, allx] = steepest(@rosengrad, x0, maxit, deltax);
drawRosenbrock(allx, 1);
saveas(gcf, 'tex/graphics/4d-steepest.png');

% Output results
fprintf('deltax = %f\n', norm(x - allx(:, end - 1)));
fprintf('deltax* = %f\n', norm(x - xs));

% Run again
fprintf('\nInf its\n');
deltax = 1.0e-4; maxit = Inf;
[x, allx] = steepest(@rosengrad, x0, maxit, deltax);
drawRosenbrock(allx, 1);
saveas(gcf, 'tex/graphics/4g-steepest.png');

% Output new results
fprintf('steps = %g\n', size(allx, 2));
fprintf('deltax* = %f\n', norm(x - xs));

% Run one last time
fprintf('\nInf its, small deltax\n');
deltax = eps; maxit = Inf;
[x, allx] = steepest(@rosengrad, x0, maxit, deltax);
drawRosenbrock(allx, 1);
saveas(gcf, 'tex/graphics/4h-steepest.png');

% Output new results
fprintf('steps = %g\n', size(allx, 2));
fprintf('deltax* = %f\n', norm(x - xs));


