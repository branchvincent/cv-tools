function e = err(f, S)

e = 0;
for i = 1:length(S.y)
    y = f(S.X(i, :));
    if y ~= S.y(i)
        e = e + 1;
    end
end

e = e/length(S.y);