function distancias = computarDistancias(Xs, centroides)
t = Xs - centroides;
distancias = sum(t.*t,2);
end