function lc = convolve2( I,mascara )
    lc = uint8(filter2(mascara,double(I)));
end

