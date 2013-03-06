I = imread("imagenes/histo.bmp");
X = I(:);
K = 3;
[centroids, idx] = kMeans(X, K);
centroids
idx