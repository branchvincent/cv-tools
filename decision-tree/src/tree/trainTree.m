function tau = trainTree(S, depth, random, dMax, sMin)

% Set default options
if depth == 0
    if nargin < 3 || isempty(random)
        random = false;
    end
    if nargin < 4 || isempty(dMax)
        dMax = Inf;
    end
    if nargin < 5 || isempty(sMin)
        sMin = 1;
    end
end

% Initialize variables
delta = sqrt(eps);
tau.L = []; tau.R = [];
tau.d = []; tau.t = [];
tau.p = [];

% Train
if OkToSplit(S, depth)
    [L, R, tau.d, tau.t] = findSplit(S);
    if ~isempty(L)
        tau.L = trainTree(L, depth + 1, random, dMax, sMin);
        tau.R = trainTree(R, depth + 1, random, dMax, sMin);
    else
        tau.p = distribution(S);
    end
else
    tau.p = distribution(S);
end


%% Sub functions

    function answer = OkToSplit(S, depth)
        answer = impurity(S) > 0 && depth < dMax && length(S.y) > sMin;
    end

    function [LOpt, ROpt, dOpt, tOpt] = findSplit(S)
        % Initialize empty return values
        LOpt = []; ROpt = [];
        dOpt = -1; tOpt = -1;
        % Determine dimension (random or all)
        dims = 1:size(S.X, 2);
        if random
            dims = datasample(dims, 1);
        end
        % Find split
        iS = impurity(S);
        DeltaOpt = -1;
        for d = dims
            x = unique(S.X(:, d));
            t = mean([x(1:end-1) x(2:end)], 2);
            for l = 1:length(t)
                % Construct left subtree
                lIdx = find(S.X(:, d) <= t(l));
                L.X = S.X(lIdx, :);
                L.y = S.y(lIdx);
                L.labelMap = S.labelMap;
                % Construct right subtree
                rIdx = setdiff(1:size(S.X, 1), lIdx);
                R.X = S.X(rIdx, :);
                R.y = S.y(rIdx);
                R.labelMap = S.labelMap;   
                % Calculate delta
                iL = length(L.y)/length(S.y)*impurity(L);
                iR = length(R.y)/length(S.y)*impurity(R);
                Delta = iS - iL - iR;
                Delta = fix(Delta, S, L, R);
                % Update delta
                if Delta > DeltaOpt
                    DeltaOpt = Delta;
                    LOpt = L; ROpt = R;
                    dOpt = d; tOpt = t(l);
                end
            end
        end
    end

    function p = distribution(S)
        n = length(S.y);
        p = zeros(size(S.labelMap));
        % Count each feature      
        for i = 1:n
            y = S.y(i);
            p(y) = p(y) + 1;
        end
        p = p/n;
    end

    function i = impurity(S)
        i = 1 - max(distribution(S));
        i = clip(i);
    end

    %% DO NOT CHANGE
    function c = count(S)
        c = histcounts(S.y, (0:length(S.labelMap)) + 0.5);
    end

    function x = clip(x)
        if abs(x) < delta
            x = 0;
        end
    end

    function Delta = fix(Delta, S, L, R)
        Delta = map(Delta, 0, 0.5, delta, 0.5);
        cS = count(S);
        cL = count(L);
        cR = count(R);
        zL = nnz(cL) == 1;
        zR = nnz(cR) == 1;
        if nnz([zL zR]) == 1
            % Exactly one of L, R is pure. Call that P, and the other one Q
            cP = cL;
            cQ = cR;
            if zR
                cP = cR;
                cQ = cL;
            end
            [mP, lP] = max(cP);
            [mS, lS] = max(cS);
            if lP == lS % The only label of P is the majority label of S
                % Make a larger P have a higher delta, but below any
                % genuinely nonzero delta
                [~, lQ] = max(cQ);
                if lQ == lS % The majority label of Q is the majority label of S
                    Delta = 0.9 * delta * mP / mS;
                end
            end
        end
        
        function x = map(x, a, b, c, d)
            if abs(a - b) < delta
                error('a=%g is too close to b=%g', a, b)
            end
            m = 1/(a - b);
            u = (c - d) * m;
            v = (d * a - c * b) * m;
            x = u * x + v;
        end
    end
end