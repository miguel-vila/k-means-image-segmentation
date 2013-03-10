function X = construirMatrizDeEntrada(I)

[x y] = size(I);
% Inicializa una matriz de elementos que va a representar todos los pixeles de la imagen
X = zeros(x*y, 3);

for j=1:y
    for i=1:x
		% Cada elemento es un vector fila de tres dimensiones que tiene el nivel de gris del pixel y
		% su posicion en x y y
        X(i+(j-1)*x,:)=[I(i,j) i j];
    end
end
end