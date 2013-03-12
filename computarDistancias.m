function distancias = computarDistancias(Xs, centroides)
% Computa la distancia de posicion
% (Para el caso de pixeles el segundo y el tercer elemento del vector representan la posicion en x y y respectivamente)
d_x = Xs(:,2) - centroides(:,2);
d_y = Xs(:,3) - centroides(:,3);
distancia_posicion = d_x.*d_x + d_y.*d_y;

% Obtiene los parametros para saber que medida de distancia se debe usar
p = params();
diferencia_grises = abs(Xs(:,1) - centroides(:,1));
if p.medida_distancia == 1 
	% La distancia es la diferencia de grises
    distancias = diferencia_grises;
elseif p.medida_distancia == 2
	% La distancia es es el producto de la diferencia de grises y la distancia
	distancias = diferencia_grises.*distancia_posicion; 
elseif p.medida_distancia == 3
	% La distancia es proporcional a la magnitud del vector diferencia entre el vector x y cada centroide
	t = Xs - centroides;
	distancias = sum(t.*t,2);
else
	exception = MException('Excepcion:ParametrosInvalidos', 'Identificador de medida de distancia invalido (Validos = 1,2 o 3)');
    throw(exception);
end
end