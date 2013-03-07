function centroids = computeCentroids(X, idx, K)

for k=1:K,
	v = find(idx==k);
	centroids(k,:) = sum(X(v,:))/length(v);
end;

end