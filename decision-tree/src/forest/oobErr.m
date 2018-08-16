function e = oobErr(phi, T, used)

e = 0;
len = 0;
for i = 1:length(T.y)
    % Get trees that did not use x(i)
    trees = phi(~used(i, :));
    if ~isempty(trees)
        % Construct set with current x(i)
        U.X = T.X(i, :); 
        U.y = T.y(i);
        U.labelMap = T.labelMap;
        % Add to error
        e = e + err(@(x) forestClassify(x, trees), U);
        len = len + 1;
    end
end

e = e/len;