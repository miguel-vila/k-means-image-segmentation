% Retorna K elementos de X elegidos al azar como los K centroides iniciales 
function centroids = initCentroids(X, K)
n = size(X, 1);
krandom = randperm(n);
krandom = krandom(1:K);
centroids = X(krandom,:)
end

