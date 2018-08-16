function p = variancePercentage(s)

v = s.^2;
p = cumsum(100*v/sum(v));