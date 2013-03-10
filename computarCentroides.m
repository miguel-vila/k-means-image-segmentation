function centroides = computarCentroides(X, idx, K)

for k=1:K,
	v = find(idx==k);
	centroides(k,:) = sum(X(v,:))/length(v);
end;

end