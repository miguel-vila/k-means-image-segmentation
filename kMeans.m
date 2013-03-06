function [centroids, idx] = kMeans(X, K)
% [Esta funcion no solo sirve para imagenes]
% Recibe X que es una matriz que en cada FILA tiene el valor de cada pixel de la imagen
% (Esto quiere decir que X no tiene las mismas dimensiones que la imagen de entrada)
% Tambien recibe los K centroides iniciales
% Devuelve los centroides finales y el identificador del centroide que se le asigna a cada pixel

max_iters = 50;

[m n] = size(X);
initial_centroids = initCentroids(X, K);
K = size(initial_centroids, 1);
centroids = initial_centroids;
previous_centroids = centroids;
idx = zeros(m, 1);

for i=1:max_iters    
    % Output progress
    fprintf('K-Means iteration %d/%d...\n', i, max_iters);
    if exist('OCTAVE_VERSION')
        fflush(stdout);
    end
    
    % Le asigna a cada pixel el centroide que mas cerca encuentre
    idx = findClosestCentroids(X, centroids);
    
    % Computa los centroides promediando los valores en un mismo cluster
    centroids = computeCentroids(X, idx, K);
end

end

