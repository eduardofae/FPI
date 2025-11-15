clear all;
clear scr;
I = imread('lena.jpg');

%imagem original
figure(1)
imshow(I);

factor_p = 3*size(I,1); 
factor_q = 3*size(I,2);
I1 = nn_resize_RGB(I, factor_p, factor_q);
figure(2);
imshow(I1);


