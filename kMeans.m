function [centroides, idx] = kMeans(X, K)
% [Esta funcion no solo sirve para imagenes: fijese que de ahora en adelante en los comentarios
% se habla de "elementos" y no de "pixeles"]
% Recibe X que es una matriz que en cada FILA tiene un vector que representa uno de los elementos que se quiere segmentar
% Tambien recibe K, el numero de segmentos que se desea conseguir
% Devuelve los centroides finales y el identificador del centroide que se le asigna a cada elemento

% Se leen los parametros para asignar el numero maximo de iteraciones
p = params();
max_num_iters = p.max_iters;

% Se inicializan los centroides
centroides = inicializarCentroides(X, K);

% Se inicializan algunas variables utiles
[m n] = size(X);
idx = zeros(m, 1);
idx_previo = idx;
for i=1:max_num_iters
    % Se imprime el numero de iteracion actual
    fprintf('K-Means iteracion %d de maximo %d...\n', i, max_num_iters);
    
    % Le asigna a cada pixel el centroide que mas cerca encuentre
    idx = encontrarCentroidesMasCercanos(X, centroides);
    	
    % Computa los centroides promediando los valores en un mismo cluster
    centroides = computarCentroides(X, idx, K)
	
	% Condicion de terminacion:
	% El algoritmo acaba cuando la asignacion de centroides no cambia
	if idx==idx_previo
		break
    end
	
	% Almacena la asignacion de centroides de la iteracion
    idx_previo = idx;
end

end