% Remove waterproof

img = imread('Tribute_YAN_AN_watermark.jpg');
img = rgb2gray(img);
figure(1), imshow(img);

for r = 1:size(img,1)
    for c = 1:size(img,2)
        %%%%%%%%%%%%%%%%%%
        %% TO BE COMPLETED
        %% Hint: The water proof part is with light gray
        %%       Turn image part with light gray into white
        
        %%%%%%%%%%%%%%%%%%
    end
end

% imwrite(img, 'Tribute_YAN_AN_withoutWaterProof.png');
% figure(2), imshow(img);