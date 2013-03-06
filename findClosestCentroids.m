function idx = findClosestCentroids(X, centroids)
% Computa para cada elemento el id del centroide mas cercano

K = size(centroids, 1);

idx = zeros(size(X,1), 1);
[m n] = size(X);

for i=1:m,
	x = X(i,:);
	t = (repmat(x, K, 1) - centroids);
	t = sum(t.*t,2);
	[v idx(i)] = min( t );
end;	

end

