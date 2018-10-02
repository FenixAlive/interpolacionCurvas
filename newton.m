f = @(x)(1./(1+x.^2)); %función
a = -2;
b = 2;
k = 9;
h = ((b-a)/(k-1));%tamaño de paso
xn = a+(0:(k-1))*h;
yn = [f(xn)];
A = ones(k,1)
%A = [A xn-xn(1)]
%A = [A A(:,2).*(xn-xn(2))]
for i = 1:(k-1)
  A = [A A(:,i).*(xn-xn(i))]
end
