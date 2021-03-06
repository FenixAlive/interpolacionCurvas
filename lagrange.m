clear
xn=  -5:.625:5;
f = @(x)(55*sin(2*x)+x.^2+3*exp(-x));
yn= [f(xn)];
a = min(xn);
b = max(xn);
[f,c]=size(xn);
k = 13
V = [xn(1:(k-1)),xn((k+1):end)]
L =poly(V)/prod(xn(k)-V); %este es el puro polinomio de un grado
L
%polinomio completo

%polinomio inicial
v0 = [xn(2:end)]; % raices del polinomio
l0 = yn(1)*(poly(v0)/prod(xn(1)-v0)); %poly hace el polinomio con las raices y prod hace el producto de la resta de cada uno de los valores en el array
%polinomios intermedios
Li = 0;
for i = 2:(c-1)
    Vi = [xn(1:(i-1)),xn((i+1):end)];
    Li= Li+yn(i)*(poly(Vi)/prod(xn(i)-Vi));
end
%polinomio final
vf = [xn(1:end-1)]; % raices del polinomio
lf = yn(end)*(poly(vf)/prod(xn(end)-vf));
L = l0+Li+lf % toma el polinomio inicial mas los intermedio que se hacen el for mas el final
poly2str(L,'x') % tomar el resultado y ponerlo en p y ponerle un punto en el exponente
p = @(x)(-0.2192*x.^11 - 0.4026*x.^10 + 2.425*x.^9 + 3.663*x.^8 - 9.525*x.^7 - 11.03*x.^6 + 15.76*x.^5 + 12.36*x.^4 - 9.669*x.^3 - 3.926*x.^2 + 2.834*x + 8.368);
x = a-3:.001:b+3;
plot(xn,yn,'ro', x, p(x), 'b');
axis([a-3,b+3,min(yn)-3,max(yn)+3]);
title("Lagrange")