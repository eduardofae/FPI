function Y = AlphaTrimMean(I,SE,alpha)
%ALPHATRIMMEAN Filtra a imagem I, com a janela SE e o fator alpha.
%   0 < alpha < 0.5
    [R,C] = size(I);
    [SER,SEC] = size(SE);
    Y = I;

    for x = 1 + floor(SER/2) : R - floor(SER/2)
        for y = 1 + floor(SEC/2) : C - floor(SEC/2)
            w = I(x + (-floor(SER/2) : floor(SER/2)), y + (-floor(SEC/2) : floor(SEC/2)));
            
            s = sort(w(:));
            
            Y(x,y) = mean(s(1 + floor(end*alpha): end - floor(end*alpha)));
        end
    end
end