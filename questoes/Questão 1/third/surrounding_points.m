function [x1 y1 x2 y2] = surrounding_points(n, m, x, y)

    x1 = floor(x);
    y1 = floor(y);
            
    x2 = floor(x) + 1;
    y2 = floor(y) + 1;
 
    if(y1 == m)
      y1 = m - 1;
      y2 = m;
    end

    if(x1 == n)
      x1 = n - 1;
      x2 = n;
    end
end