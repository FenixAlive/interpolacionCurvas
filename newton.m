clear all
f = @(x)(1./(1+x.^2)); %función
a = -2; %punto uno de interpolacion
b = 2;  %punto dos de interpolacion
k = 9;  %numero de puntos a considerar
h = ((b-a)/(k-1)); %tamaño de paso separacion entre cada punto deseado
xn = a+(0:(k-1))*h  %valores en x
yn = [f(xn)]  %valores en y

x =((a-3):.0001:(b+3))';

A = ones(k,1); %matriz de una columna y tantas filas como puntos
Ax = ones(size(x),1);
for i = 1:(k-1)
  A = [A A(:,i).*(xn-xn(i))'];
  Ax = [Ax Ax(:,i).*(x-x(i))];
end
% matriz
A
s = inv(A)*yn'
%Ax = triu(Ax);
pk =Ax*s;

plot(xn,yn,'ro',x,f(x),'b', x, pk, 'r')
%title("Newton")
