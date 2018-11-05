 %función
%a = -2;
%b = 2;
%k = 5;
%h = ((b-a)/(k-1));%tamaño de paso
%xn = a+(0:(k-1))*h;
%yn = [f(xn)];
xn=  -5:.625:5;
f = @(x)(55*sin(2*x)+x.^2+3*exp(-x));
yn= [f(xn)];
a = min(xn);
b = max(xn);
[l,k] = size(yn);
x = (a-3):.0001:(b+3);
An = [];
Ax = [];
for i = 0:(k-1)
    An=[An; xn.^i];
    Ax=[Ax; x.^i];
end
An = An';
Ax=Ax';
C = inv(An)*yn'
Px=Ax*C;
plot(xn,yn,'ro',x,Px,'b'); 
axis([a-3,b+3,a-3,b+3]);
