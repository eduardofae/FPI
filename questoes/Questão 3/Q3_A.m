function [ I_filtered ] = Q3_A( I, w, gaussian, saltPepper, alpha )
    %% Cria Imagem com ruído
    I_noisy = imnoise(I, 'salt & pepper', saltPepper);
    I_noisy = imnoise(I_noisy, 'gaussian', gaussian);

    %% Mostra Imagens
    figure, subplot(2,2,1);
    imshow(I), title('Imagem Normal');

    subplot(2,2,3);
    imshow(I_noisy), title('Imagem com Ruído');

    %% Filtra Imagem
    I_filtered(:,:,1) = AlphaTrimMean(I_noisy(:,:,1), w, alpha);
    I_filtered(:,:,2) = AlphaTrimMean(I_noisy(:,:,2), w, alpha);
    I_filtered(:,:,3) = AlphaTrimMean(I_noisy(:,:,3), w, alpha);
    
    %% Mostra Imagem Filtrada
    subplot(1,2,2);
    imshow(uint8(I_filtered)), title('Imagem Filtrada');
    
    %% Calcula SNR e PSNR
    [SNR, PSNR] = SNR_PSNR(double(I), double(I_filtered));
  
    %% Mostra SNR e PSNR
    txt = {['SNR = ', num2str(SNR), ' (dB)'], ['PSNR = ', num2str(PSNR(:,:,1)), ' (dB)']};
    text(0, 400, txt);
    
end