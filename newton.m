clear
clc
%f = @(x)(1./(1+x.^2)); %función real
%h = ((b-a)/(k-1)); %tamaño de paso separacion entre cada punto deseado
%xn = a+(0:(k-1))*h; %valores en x
%yn = [f(xn)];  %valores en y
xn=  [-2.00  -1.6300  -1.2600 -.8900  -.53  -.16 .21 .58 .95 1.32 1.68 2.05];
yn= [3.5000 4.8700 5.4500 7.7600 7.4000 7.8600 8.7300 8.6700 10.3200 11.0000 10.7000 11.7800];
a = min(xn); %punto uno de interpolacion
b = max(xn);  %punto dos de interpolacion
[r,k] = size(yn);  %numero de puntos a considerar
x =((a-3):.001:(b+3))';

A = ones(k,1); %matriz de una columna y tantas filas como puntos
for i = 1:(k-1)
  A = [A A(:,i).*(xn-xn(i))'];
end
% matriz
A
s = inv(A)*yn'
% hacer la forma de newton
pk = s(1);
xi = ones(size(x));
for i = 2:k
  xi = xi.*(x-xn(i-1));
  pk = pk + s(i)*xi;
end

plot(xn,yn,'ro', x,pk,'g--', x, x*0, 'k:');
axis([a-3,b+3,a-3,b+3]);
title("Interpolación Newton");
