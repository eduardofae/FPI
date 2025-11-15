function [ SNR, PSNR ] = SNR_PSNR( I, I_new )
%SNR_PSNR Summary of this function goes here
%   Detailed explanation goes here
    I_max = double(max(max(I)));
    I_min = double(min(min(I)));
    A = (I_max - I_min);
    SNR = 10*log10(double(std2(I)^2 / std2(I - I_new)^2));
    PSNR = 10*log10((A.^2)/(std2(I-I_new)^2));
end

