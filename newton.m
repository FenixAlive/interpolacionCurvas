clear
clc
 %función real
%h = ((b-a)/(k-1)); %tamaño de paso separacion entre cada punto deseado
%xn = a+(0:(k-1))*h; %valores en x
%yn = [f(xn)];  %valores en y

xn=  [-4/3 -2/3 0 2/3 4/3 5/3 2 7/3 8/3 10/3];
f = @(x)(cos(x.^2)+x.^3-3*x.^2+exp(-2*x));
yn= [f(xn)]
a = min(xn); %punto uno de interpolacion
b = max(xn);  %punto dos de interpolacion
[r,k] = size(yn);  %numero de puntos a considerar
x =(-1.5:.000001:3.5)';

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
%norm(abs(pk-f(x)))
%err = norm(abs(pk-yn(x)'))

plot(x, f(x),xn,yn,'r*', x,pk,'r:', x, x*0, 'k:');
axis([a-.5,b+.5,-6,25]);
title("Interpolación Newton");

