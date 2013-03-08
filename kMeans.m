function [centroides, idx] = kMeans(X, K)
% [Esta funcion no solo sirve para imagenes]
% Recibe X que es una matriz que en cada FILA tiene el valor de cada pixel de la imagen
% (Esto quiere decir que X no tiene las mismas dimensiones que la imagen de entrada)
% Tambien recibe los K centroides iniciales
% Devuelve los centroides finales y el identificador del centroide que se le asigna a cada pixel

max_num_iters = params().max_iters;

[m n] = size(X);
centroides = inicializarCentroides(X, K);
idx = zeros(m, 1);
idx_previo = idx;
for i=1:max_num_iters
    % Output progress
    fprintf('K-Means iteration %d/%d...\n', i, max_num_iters);
    if exist('OCTAVE_VERSION')
        fflush(stdout);
    end
    
    % Le asigna a cada pixel el centroide que mas cerca encuentre
    idx = encontrarCentroidesMasCercanos(X, centroides);
    
	centroides_previos = centroides;
	
    % Computa los centroides promediando los valores en un mismo cluster
    centroides = computarCentroides(X, idx, K)
	if idx==idx_previo
		break
    end
    idx_previo = idx;
end

end