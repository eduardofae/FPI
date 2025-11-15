%% Limpa dados
clc;
clear all;
close all;

%% Entradas
I1 = imread('1.jpg');
I2 = imread('2.jpeg');
janela = [1 1 1 ; 1 1 1 ; 1 1 1];
gaussian   = 0.02;
saltPepper = 0.02;
alpha = 0.2;
sigma = 4;

%% Chamadas Questão A
[I_filtered1] = Q3_A(I1, janela, gaussian, saltPepper, alpha);
[I_filtered2] = Q3_A(I2, janela, gaussian, saltPepper, alpha);

%% Chamadas Questão B
[I_realcada1] = Q3_B(double(I1), sigma);
[I_realcada2] = Q3_B(double(I2), sigma);