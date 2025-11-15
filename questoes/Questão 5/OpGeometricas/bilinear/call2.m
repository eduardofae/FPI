I = imread('lena.jpg');

figure(1);
imshow(I);

factor_p = 3*size(I,1); 
factor_q = 3*size(I,2);
I2 = bilinear_resize_RGB(I, factor_p, factor_q);
figure(2);
imshow(I2);
