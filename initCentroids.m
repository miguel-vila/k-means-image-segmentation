% Retorna K elementos de X elegidos al azar como los K centroides iniciales 
function centroids = initCentroids(X, K)
n = size(X, 1);
n
krandom = randperm(n)(1:K);
centroids = X(krandom,:)
end

