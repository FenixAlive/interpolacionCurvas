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
xn= linspace(-2,15,13);
yn= [663/399 2957/191 1459/81 4696/57 5897/20 67805/92 29887/20 82071/31 38551/9 97252/15 55991/6 167847/13 86537/5];
xn = xn';
yn = yn';
[l,p] = size(yn);
a = min(xn);
b = max(xn);



%racional
% y = b / (1+ax) se convierte  y = b - a*x*y
%Ar = [ones(1,p) ]
%polinomio grado k
k =1;
A = [ones(l,p)];

for i=1:k
  A =[A xn.^i];
end
A;
AB = [inv(A'*A)*(A'*yn)]
%exponencial
Ae = [inv(A'*A)*(A'*log(yn))]
%

%modelo polinomial
%yest = AB(1)+AB(2)*xn+AB(3)*xn.^2+AB(i+1)*xn.^i;
yest = AB(1);
yexp = Ae(1);
for i=1:(k)
  yest = yest+AB(i+1)*xn.^i;
  yexp = yexp+Ae(i+1)*xn.^i;
end
% exponencial
yexp=exp(yexp)

plot(xn,yn,'ro', xn, yest, 'b', xn, yest, 'go');
title("Polinomial")
axis([a-3,b+3,min(yn)-3,max(yn)+3]);
figure(2)
plot(xn,yn,'ro', xn, yexp, 'b');
title("Exponencial")
axis([a-3,b+3,min(yn)-3,max(yn)+3]);
% error cuadrado medio
ECMn = mean((A*AB-yn).^2)
ECMne = mean((A*AB-log(yn)).^2)
Ec = norm(A*AB-yn)
ECM = mean((yest-yn).^2)
ECMe = mean((log(yexp)-log(yn)).^2)