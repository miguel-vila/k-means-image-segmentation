function X = construirMatrizDeEntrada(I)
x = size(I,1);
y = size(I,2);
X = zeros(x*y, 3);
for j=1:y
    for i=1:x
        X(i+(j-1)*x,:)=[I(i,j) i j];
    end
end
end