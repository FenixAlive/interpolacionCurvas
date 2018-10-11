% problema inventado
%x = -1:0.1:5;
%xn = -1:5;
%f = @(x)(3*x.^3-2*x.^2+x)
%y = f(x); yn=f(xn)+10*rand(size(xn))-20
%plot(x,y,'g',xn,yn,'ro');[xn' yn']


xn =[    -1.00000   -21.45398
     0.00000   -17.02430
     1.00000   -16.02433
     2.00000     2.26705
     3.00000    52.65701
     4.00000   152.14008
     5.00000   317.27852];

%si el modelo es exponencial el yn hacerlo logaritmico pero solo si los 'y' no son negativos
%si el modelo es de grado n la matriz a es igual a (1 xn xn.^2 xn.^n)
%para ver el error se saca el error cuadrado medio o la diferencia gaussiana

yn =xn(:,2)
xn = xn(:,1)
%polinomio grado k
k =2
A =[ones(size(xn))]

for i=1:k
  A =[A xn.^i]
end

AB = [inv(A'*A)*(A'*yn)]
% y estimados ir agregando exponenciales
yest = AB(1)+AB(2)*xn+AB(3)*xn.^2
% hacer for

% error cuadrado medio
ECM = mean((yest-yn).^2)
