clear all
clc
f = @(x)(1./(1+x.^2)); %función real
a = -2; %punto uno de interpolacion
b = 2;  %punto dos de interpolacion
k = 12;  %numero de puntos a considerar
h = ((b-a)/(k-1)); %tamaño de paso separacion entre cada punto deseado
%xn = a+(0:(k-1))*h; %valores en x
%yn = [f(xn)];  %valores en y
xn=  [-2.00  -1.6300  -1.2600 -.8900  -.53  -.16 .21 .58 .95 1.32 1.68 2.05];
yn= [3.5000 4.8700 5.4500 7.7600 7.4000 7.8600 8.7300 8.6700 10.3200 11.0000 10.7000 11.7800];
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
