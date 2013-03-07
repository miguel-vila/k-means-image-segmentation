I = im2double(imread('imagenes/CT.png'));
X = I(:);
K = 4;
[centroids, idx] = kMeans(X, K);
I_out = reshape(im2uint8(centroids(idx,:)), size(I));

figure;imshow(im2uint8(I));
iminfo = impixelinfo;
set(iminfo,'Position',[15 22 300 20]);
figure;imshow(I_out);
iminfo = impixelinfo;
set(iminfo,'Position',[15 22 300 20]);

imwrite(I_out, 'out.png');