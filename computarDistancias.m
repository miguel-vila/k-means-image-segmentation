function distancias = computarDistancias(Xs, centroides)
% Computa la distancia de posicion
% (Para el caso de pixeles el segundo y el tercer elemento del vector representan la posicion en x y y respectivamente)

% Obtiene los parametros para saber que medida de distancia se debe usar
p = params();
if p.medida_distancia == 1 
	% La distancia es la diferencia de grises
	diferencia_grises = abs(Xs(:,1) - centroides(:,1));
    distancias = diferencia_grises;
elseif p.medida_distancia == 2
	% La distancia es proporcional a la magnitud del vector diferencia entre el vector x y cada centroide
	t = Xs - centroides;
	distancias = sum(t.*t,2);
else
	exception = MException('Excepcion:ParametrosInvalidos', 'Identificador de medida de distancia invalido (Validos = 1,2 o 3)');
    throw(exception);
end
end