f = @(x)(1./(1+x.^2)); %función
a = -2; %punto uno de interpolacion
b = 2;  %punto dos de interpolacion
k = 5;  %numero de puntos a considerar
h = ((b-a)/(k-1)); %tamaño de paso separacion entre cada punto deseado
xn = a+(0:(k-1))*h  %valores en x
yn = [f(xn)]  %valores en y

A = ones(k,1); %matriz de una columna y tantas filas como puntos
for i = 1:(k-1)
  A = [A A(:,i).*(xn-xn(i))'];
end
A
x = (a-3):.0001:(b+3);
plot(xn,yn,'ro',x,f(x),'b' )
title("Newton")
