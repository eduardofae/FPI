function [ I_realcada ] = UnsharpMaskGaussian( I, sigma )
%UnsharpMaskGaussian realça a imagem com UnsharpMask utilizando filtro gaussiano
    [R,C] = size(I);
    
    I_realcada = zeros(size(I));
    
    I_blurred = GaussianFilter(I,sigma);
    
    for x = 1 : R
        for y = 1 : C
            I_realcada(x,y) = I(x,y) - I_blurred(x,y) + I(x,y);
        end
    end
end

