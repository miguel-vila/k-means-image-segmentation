p = params();
archivo_imagen = p.archivo_imagen;
K = p.K;

I = im2double(imread(archivo_imagen));
X = construirMatrizDeEntrada(I);

[centroids, idx] = kMeans(X, K);
centroids = centroids(:,1)
I_out = reshape(im2uint8(centroids(idx,:)), size(I));

figure;imshow(im2uint8(I));
iminfo = impixelinfo;
set(iminfo,'Position',[15 22 300 20]);
figure;imshow(I_out);
iminfo = impixelinfo;
set(iminfo,'Position',[15 22 300 20]);

imwrite(I_out, strcat(archivo_imagen,'_out.png'));