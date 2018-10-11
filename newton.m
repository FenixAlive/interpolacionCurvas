clear all
clc
f = @(x)(1./(1+x.^2)); %función real
a = -2; %punto uno de interpolacion
b = 2;  %punto dos de interpolacion
k = 9;  %numero de puntos a considerar
h = ((b-a)/(k-1)); %tamaño de paso separacion entre cada punto deseado
xn = a+(0:(k-1))*h; %valores en x
yn = [f(xn)];  %valores en y

x =((a-1):.001:(b+1))';

A = ones(k,1); %matriz de una columna y tantas filas como puntos
for i = 1:(k-1)
  A = [A A(:,i).*(xn-xn(i))'];
end
% matriz
A
s = inv(A)*yn'
% hacer la forma de newton
pk = s(1);
xi = ones(size(x-1),1);
for i = 2:k
  xi = xi.*(x-xn(i-1));
  pk = pk + s(i)*xi;
end

plot(xn,yn,'ro',x,f(x),'b', x,pk,'g--', x, x*0, 'k..');
axis([a-1,b+1,a-1,b+1]);
title("Interpolación Newton");
