function [ I_realcada ] = UnsharpMaskLaplace( I )
%UnsharMaskLaplace realça a imagem com UnsharpMask utilizando janela Laplace
    [R,C] = size(I);
    
    SE = [0 -1 0; -1 4 -1; 0 -1 0]/4;
    
    I_realcada = I;
    
    for x = 2 : R - 1
        for y = 2 : C - 1
            for i = -1 : 1
                for j = -1 : 1
                    I_realcada(x,y) = I_realcada(x,y) + SE(i+2, j+2).*I(x-i, y-j);
                end;
            end;
        end;
    end;
end