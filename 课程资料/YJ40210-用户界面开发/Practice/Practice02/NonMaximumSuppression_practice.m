% Non-Maximum Suppression

% Generate a synthetic image
img = uint8(zeros(200, 200)); Imax = [100; 255; 255];
rmax = [100; 75; 125]; cmax = [35; 165; 165];
for k = 1:3
    img(rmax(k)-5:rmax(k)+5, cmax(k)-5:cmax(k)+5) = Imax(k);
end

for k = 1:3
    for r = 1:size(img,1)
        for c = 1:size(img,2)
            dmin = max(abs(rmax(k)-r), abs(cmax(k)-c));
            if (Imax(k)-2*dmin > img(r,c))
                img(r,c) = Imax(k)-2*dmin;
            end
        end
    end
end

% Image processing
img2 = img; img2(:,:) = 0; idx = find(img>99); img2(idx) = 255;
img3 = img; img3(:,:) = 0; idx = find(img>250); img3(idx) = 255; 
%%%%%%%%%%%%%%%%%%
%% TO BE COMPLETED
img4 = img; 

% img4 should be the NMSuppression result
%%%%%%%%%%%%%%%%%%

subplot(2,2,1), imshow(img); title('Original');
subplot(2,2,2), imshow(img2); title('Thresholding low');
subplot(2,2,3), imshow(img3); title('Thresholding high');
subplot(2,2,4), imshow(img4); title('NM Suppression');


