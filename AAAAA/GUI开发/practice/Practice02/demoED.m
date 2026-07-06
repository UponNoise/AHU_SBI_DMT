%% Demonstrate Edge Detection
img = rgb2gray(imread('RTS02.jpg'));
[Iu1, Iv1, Ig1] = GradientImage(img);
% GradientImageSobel.m needs to be completed first
[Iu2, Iv2, Ig2] = GradientImageSobel(img);
figure(1), subplot(1,2,1), imshow(uint8(7*Ig1)); subplot(1,2,2), imshow(uint8(7*Ig2));