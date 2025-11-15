function [ I_blurred ] = GaussianFilter( I, sigma )
%GAUSSIANBLUR Aplica o filtro gaussiano, com desvio padrão sigma, na imagem I 
    M = round(5*sigma+1.5);
    
    SE = zeros(M,1);
    v = zeros(M);
    h = 0;
    
    for i = 1 : M
        v(i) = i - round(M/2);
        SE(i) = exp(-v(i)^2/(2*(sigma)^2));
        h = h + SE(i);
    end
    
    for i = 1 : M
        SE(i) = SE(i)/h;
    end
    
    I_blurred = convolve2(I,SE);
    I_blurred = convolve2(I_blurred,SE');
    
end

