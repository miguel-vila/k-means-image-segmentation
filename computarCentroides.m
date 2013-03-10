function centroides = computarCentroides(X, idx, K)
% A partir de la asignacion de centroides computa los nuevos centroides

for k=1:K,
	% Encuentra los indices de los elementos que fueron asignados al k-esimo cluster
	v = find(idx==k);
	
	% Obtiene los elementos a partir de los indices 
	Xs = X(v,:);
	
	% El nuevo centroide es el promedio de los elementos asignados al k-esimo cluster
	centroides(k,:) = sum(Xs)/length(v);
end;

end