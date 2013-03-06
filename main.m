I = imread("imagenes/regle.png");
X = I(:);
K = 3;
[centroids, idx] = kMeans(X, K);
centroids
I_out = reshape(round(centroids(idx,:)), size(I));
imshow(I_out);
imwrite(I_out, "out.png");