function [e, dSpan] = ssdGraph(I, J, xI, sigma, h)

% Constants
e = zeros(2*h+1);
hh = ceil(2.5*sigma);
w = gauss(-hh:hh, 0, sigma, 1);
dSpan = -h:h;

r = xI(1, 1); c = xI(2, 1);
II = I(-hh+r:r+hh, -hh+c:c+hh);

% Compute grid
for d1 = -h:h
    for d2 = -h:h
        JJ = J(-hh+r+d1:r+d1+hh, -hh+c+d2:c+d2+hh);
        cv = conv2(w, w, (II - JJ).^2, 'same');
        e(d1+h+1, d2+h+1) = sum(cv(:));
    end
end