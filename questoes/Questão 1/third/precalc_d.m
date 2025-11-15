function [Ix, Iy, Ixy] = precalc_d(I)

    [m n nr_colors] = size(I);
    
      I = double(I);

      Ix(: , 1) = 0;
      Iy(1 , :) = 0;
      Ixy(: , 1) = 0;
      Ixy(1 , :) = 0;
      
      for y = 1 : m 
        for x = 2 : n - 1 
          Ix(y, x) = fx(I, x, y);
        end
      end
      
      Ix(: , n) = 0;
      Ixy(: , n) = 0;
      Iy(m , :) = 0;
      Ixy(m , :) = 0;
     
    for y = 2 : m - 1
        for x = 1 : n 
          Iy(y, x) = fy(I, x, y);
        end
    end
    
    for y = 2 : m - 1
        for x = 2 : n - 1 
          Ixy(y, x) = fxy(I, x, y); 
        end
    end

end
