%% Compute the gradient image
function [Iu, Iv, Ig] = GradientImage(img)
    H = size(img,1); W = size(img,2);
    imgD = zeros(H+2, W+2); imgD(2:H+1,2:W+1) = double(img);
    Iu = (imgD(2:H+1,3:W+2)-imgD(2:H+1,1:W))/2; % u-gradient image
    Iv = (imgD(3:H+2,2:W+1)-imgD(1:H,2:W+1))/2; % v-gradient image
    Ig = sqrt(Iu.^2+Iv.^2);
end