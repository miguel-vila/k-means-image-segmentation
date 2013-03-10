function idx = encontrarCentroidesMasCercanos(X, centroides)
% Computa para cada elemento el id del centroide mas cercano

K = size(centroides, 1);

idx = zeros(size(X,1), 1);
[m n] = size(X);

for i=1:m,
	x = X(i,:);
	distancias = computarDistancias( repmat(x, K, 1) , centroides);
	[~, idx(i)] = min( distancias );
end;	

end