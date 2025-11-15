function [ I_realcada ] = Q3_B( I, sigma )
    %% Mostra Imagem Original
    figure, subplot(1,2,1);
    imshow(uint8(I)), title('Imagem Normal');
    
    %% Realça Imagem
    I_realcada(:,:,1) = UnsharpMaskGaussian(I(:,:,1), sigma);
    I_realcada(:,:,2) = UnsharpMaskGaussian(I(:,:,2), sigma);
    I_realcada(:,:,3) = UnsharpMaskGaussian(I(:,:,3), sigma);
    
    %% Mostra Imagem Realçada
    subplot(1,2,2);
    imshow(uint8(I_realcada)), title('Imagem Realçada');
    
end