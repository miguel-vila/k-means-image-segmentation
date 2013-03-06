I = imread("imagenes/CT.png");
X = I(:);
K = 2;
[centroids, idx] = kMeans(X, K);
centroids
I_out = reshape(round(centroids(idx,:)), size(I));
imshow(I_out);
imwrite(I_out, "out.png");