image = imread('kids.tif');
equalized = histogramEq(image);
final = contrastStretch(equalized, 1);
showWBImages(image, equalized, final)

image = imread('autumn.tif');
hsvImage = rgb2hsv(image);
hue = hsvImage(:,:,1);
saturation = hsvImage(:,:,2);
value = hsvImage(:,:,3);

equalized = histogramEq(im2uint8(value));
final= contrastStretch(equalized, 0);

%concatena H S e V em 3 dimensoes
hsvHighValue = cat(3,hue,saturation,im2double(final));
backToRGB = hsv2rgb(hsvHighValue);
showColorImages(image, hsvImage, hsvHighValue, backToRGB);

function y = contrastStretch(img, useDouble)
    % transforma a imagem de signed pra double precision para evitar erros
    % de calculos abaixo de -255
    try
        i = rgb2gray(img);
    catch
        i = img;
    end

    if useDouble == 1
        i = im2double(i);  
        topValue = 1;
    else
        topValue = 255;
    end
    % acha o pixel de menor valor na imagem
    minValue = min(min(i));
    % acha o pixel de maior valor na imagem
    maxValue = max(max(i));
    % acha a inclinaçcao do ponto de junção (0,255) para (minValue,maxValue)
    slope = topValue /(maxValue - minValue);
    % acha a intersecção da linha com o eixo
    intersection = topValue - slope*maxValue;
    % transforma a imagem de acordo com a inclinação
    y = slope*i + intersection;
end

function y = histogramEq(img_in)
    [M,N] = size(img_in);
    for i = 1 : 256
        h(i) = sum(sum(img_in==i-1));
    end

    img_out = img_in;
    s = sum(h);
    
    for i = 1 : 256
        posicoes = find(img_in == i-1);
        img_out(posicoes) = sum(h(1:i))/s*255;
    end
    y = img_out;
end

function y = showWBImages(image, equalized, final)
    figure
    subplot(2,3,1);
    imhist(image);
    title("Original");
    subplot(2,3,2);
    imhist(equalized);
    title("Equalizado");
    subplot(2,3,3);
    imhist(final);
    title("Equalizado com Contraste");
    subplot(2,3,4);
    imshow(image);
    subplot(2,3,5);
    imshow(equalized);
    subplot(2,3,6);
    imshow(final);
end

function y = showColorImages(image, hsvImage, hsvHighValue, backToRGB)
    figure
    subplot(2,2,1);
    imshow(image);
    title("Imagem Original");
    subplot(2,2,2);
    imshow(hsvImage);
    title("Imagem em HSV");
    subplot(2,2,3);
    imshow(hsvHighValue);
    title("Imagem em HSV com V alterado");
    subplot(2,2,4);
    imshow(backToRGB);
    title("Convertida para RGB");
end