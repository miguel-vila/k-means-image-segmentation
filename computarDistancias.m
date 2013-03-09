function distancias = computarDistancias(Xs, centroides)
diferencia_grises = abs(Xs(:,1) - centroides(:,1));
d_x = Xs(:,2) - centroides(:,2);
d_y = Xs(:,3) - centroides(:,3);
distancia_posicion = d_x.*d_x + d_y.*d_y;
p = params();
if p.medida_distancia == 1
    distancias = diferencia_grises;
else
    distancias = diferencia_grises.*distancia_posicion;
end
end