% Lee los parametros de entrada
p = params();
archivo_imagen = p.archivo_imagen;
K = p.K;

% Lee la imagen y construye una matriz que representa la imagen
I = im2double(imread(archivo_imagen));

% La matriz tiene dimension igual a (# pixeles de la imagen) por 3
% Cada pixel es representado por un vector de 3 dimensiones que tiene:
% * El nivel de gris
% * La posicion en x del pixel dentro de la imagen
% * La posicion en y del pixel dentro de la imagen
X = construirMatrizDeEntrada(I);

% Ejecuta k-means y obtiene "centroides" que son los vectores de
% 3 dimensiones que representan los centroides. Ademas obtiene un
% vector columna "idx" de dimension igual al numero de pixeles de la 
% imagen. Este vector dice cual es el identificador del centroide que
% le corresponde al i-esimo pixel
[centroides, idx] = kMeans(X, K);

% Se obtiene la primera columna de los centroides (que es el nivel de gris)
centroides = centroides(:,1)

% A cada pixel se le asigna el valor de gris correspondiente a su centroide
% y se devuelve a una matriz con las mismas dimensiones que la imagen de entrada
I_out = reshape(im2uint8(centroides(idx,:)), size(I));

% Se muestran en pantalla la imagen original y la imagen segmentada
figure;imshow(im2uint8(I));
iminfo = impixelinfo;
set(iminfo,'Position',[15 22 300 20]);
figure;imshow(I_out);
iminfo = impixelinfo;
set(iminfo,'Position',[15 22 300 20]);

% Se almacena la imagen y en el nombre de archivo se ponen los parametros
imwrite(I_out, strcat(archivo_imagen,'_d',int2str(p.medida_distancia),'_K',int2str(K),'_out.png'));