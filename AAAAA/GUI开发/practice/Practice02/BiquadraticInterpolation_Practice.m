%% Biquadratic Interpolation
function imgI = BiquadraticInterpolation_Practice(imgOrg, sc) % gray-level image
    % Compute biquadratic interpolation coefficients
    img = double(imgOrg); 
    du = [-1; 0; 1]; dv = du';
    U = [du.^2, du, du.^0]; 
    V = [dv.^2; dv; dv.^0];
    idx = reshape(transpose(reshape([1:9],3,[])),1,[]); 
    P = zeros(3,3);
    for r = 1:9
        P(r,idx(r)) = 1;
    end % Permutation matrix
    C = kron(V', U)*P; % Matrix C in PPT
    invC = inv(C); % Inverse of the matrix C

    % Generate interpolated image with high resolution
    H = size(img,1); W = size(img,2); 
    H2 = H*sc; W2 = W*sc;
    imgI = uint8(zeros(H2, W2));
    for r = 1:H2
        for c = 1:W2
            u = c/sc; ub = round(u); 
            ub = max(2, min(W-1, ub)); 
            du = %% WHAT %% ;
            v = r/sc; vb = round(v); 
            vb = max(2, min(H-1, vb)); 
            dv = %% WHAT %% ;
            Iuv = reshape(img(vb-1:vb+1, ub-1:ub+1)',[],1);
            duv = kron([du^2, du, 1], [dv^2, dv, 1]);
            Itmp = %% WHAT %% ;
            imgI(r,c) = max( %% WHAT %% , min( %% WHAT %% , round(Itmp)));
        end
    end
end