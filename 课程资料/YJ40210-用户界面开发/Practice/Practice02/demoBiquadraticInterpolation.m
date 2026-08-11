%% Demonstrate biquadratic interpolation
img = imread('character_mu.png');
if (size(img,3) == 3) 
    img = rgb2gray(img); 
end
img = 255 - img; H = size(img,1); W = size(img,2); 
sc = 13; H2 = H*sc; W2 = W*sc;
imgA = uint8(zeros(H2, W2));
for r = 1:H  
    for c = 1:W  imgA((r-1)*sc+1:r*sc, (c-1)*sc+1:c*sc) = img(r,c); end  
end
practice_flg = 1;
if (practice_flg)
    imgB = BiquadraticInterpolation_Practice(img, sc);
else
    imgB = BiquadraticInterpolation(img, sc);
end
imgShow = uint8(zeros(H2,2*W2+200)); imgShow(:,:) = 255; 
imgShow(:,1:W2) = imgA; imgShow(:,(end-W2+1):end) = imgB;
fprintf('Original image resolution: %d x %d \n', H, W);
fprintf('Interpolated image resolution: %d x %d \n', H2, W2);
figure(1), imshow(imgShow);
imwrite(imgShow, 'demo_biquadratic_interpolation.jpg');