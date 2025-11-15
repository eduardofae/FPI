function r = fxy(f, x, y)
    r = (f(y - 1, x - 1) + f(y + 1, x + 1) - f(y - 1, x + 1) - f(y + 1, x - 1))/4;
     
end