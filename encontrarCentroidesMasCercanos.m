function idx = encontrarCentroidesMasCercanos(X, centroides)
% Computa para cada elemento el id del centroide mas cercano

K = size(centroides, 1);

idx = zeros(size(X,1), 1);
[m n] = size(X);

for i=1:m,
	% Obtiene la i-esima fila (el i-esimo elemento)
	x = X(i,:);
	
	% Computa las distancias con respecto a los centroides
	% En esta llamada el vector x se convierte en una matriz con K veces el vector fila x
	distancias = computarDistancias( repmat(x, K, 1) , centroides);
	
	% Se le asigna al elemento el indice del centroide que se encuentra mas cerca
	% (El identificador del centroide del i-esimo elemento es el indice del centroide que minimice la distancia)
	[~, idx(i)] = min( distancias );
end;	

end