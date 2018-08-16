function y = treeClassify(x, tau)

if isempty(tau.d)
    [~, y] = max(tau.p);
else
    y = treeClassify(x, split(x, tau));
end

end

function tau = split(x, tau)
    if x(tau.d) <= tau.t
        tau = tau.L;
    else
        tau = tau.R;
    end
end