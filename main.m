I = im2double(imread('imagenes/CT.png'));
X = I(:);
K = 4;
[centroids, idx] = kMeans(X, K);
I_out = reshape(im2uint8(centroids(idx,:)), size(I));
imshow(I);
imshow(I_out);
imwrite(I_out, 'out.png');