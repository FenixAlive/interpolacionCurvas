clear
clc


%si el modelo es exponencial el yn hacerlo logaritmico pero solo si los 'y' no son negativos
%si el modelo es de grado n la matriz a es igual a (1 xn xn.^2 xn.^n)
%para ver el error se saca el error cuadrado medio o la diferencia gaussiana
%k representa el grado del modelo a representar
% cambiar xn y yn para el problema especifico



%xn =[    -1.00000   -21.45398
%       0.00000   -17.02430
%       1.00000   -16.02433
%       2.00000     2.26705
%       3.00000    52.65701
%       4.00000   152.14008
%       5.00000   317.27852];
%xn = xn(:,1);
%yn =xn(:,2);

%----------------------------------------------------------
% todo esto es para sacar los puntos x y y
%f = @(x)(1./(1+x.^2)); %función real
%a = -2; %punto uno de interpolacion
%b = 2;  %punto dos de interpolacion
%p = 9;  %numero de puntos a considerar
%h = ((b-a)/(p-1)); %tamaño de paso separacion entre cada punto deseado
%xn = (a+(0:(p-1))*h)' %valores en x hacerlos filas
%yn = [f(xn)]  %valores en y
%x =((a-1):.001:(b+1))';
%y = f(x);
%-------------------------------------------------------------
xn=  [-2.00  -1.6300  -1.2600 -.8900  -.53  -.16 .21 .58 .95 1.32 1.68 2.05];
yn= [3.5000 4.8700 5.4500 7.7600 7.4000 7.8600 8.7300 8.6700 10.3200 11.0000 10.7000 11.7800];
xn = xn';
yn = yn';
[l,p] = size(yn);
a = min(xn);
b = max(xn);
%polinomio grado k
k =12;
A = [ones(l,p)];

for i=1:l
  A =[A xn.^i];
end
A
AB = [inv(A'*A)*(A'*yn)]
%modelo exponencial
%yest = AB(1)+AB(2)*xn+AB(3)*xn.^2+AB(i+1)*xn.^i;
yest = AB(1);
for i=1:(k)
  yest = yest+AB(i+1)*xn.^i;
end

plot(xn,yn,'ro', xn, yest, 'bo');
axis([a-3,b+3,a-3,b+3]);
% error cuadrado medio
ECM = mean((yest-yn).^2)
