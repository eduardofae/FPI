a = double(imread("passaro.png"));
figure, imshow(uint8(a)),title('Imagem Original'),
b = Floyd_Steinberg(a,2);
figure, imshow(b,[]), title('exemplo de exibição da imagem em meios tons (Floyd-Steinberg)');
c = Floyd_Steinberg(a,3);
figure, imshow(c,[]), title('(Floyd-Steinberg)');
figure, imshow(c,[]), title('Floyd-Steinberg, 3 bits/pixels');
figure, imshow(b,[]), title('Floyd-Steinberg, 2 bits/pixels');
b = Floyd_Steinberg(a,3);
d = double(imread('montanhas.jpeg'));
e = Floyd_Steinberg(d,3);
figure, imshow(e,[]), title('Floyd-Steinberg, 3 bits/pixels');
f = Floyd_Steinberg(d,2);
figure, imshow(f,[]), title('Floyd-Steinberg, 2 bits/pixels');
figure, imshow(uint8(d)),title('Imagem Original'),