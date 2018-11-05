%x = linspace(0,1.6875,10)
syms x
k = 9;
xn=  [-4/3 -2/3 0 2/3 4/3 5/3 2 7/3 8/3 10/3];
fx = @(x)(cos(x.^2)+x.^3-3.*x.^2+exp(-2.*x));
fk(x) = diff(fx,x,(k+1))
%fk = @(x)(-23040.*x.^8.*sin(x.^2)+403200.*x.^4.*sin(x.^2)-30240.*sin(x.^2)-1024.*x.^10.*cos(x.^2)+161280.*x.^6.*cos(x.^2)-302400.*x.^2.*cos(x.^2)+1024.*exp(-2.*x))
%fk = -sin(x)
a = min(xn);
b = max(xn);
M = max(abs(fk(xn)))
error = double((1/(4*(k+1)))*M*(((b-a)/k)^(k+1)))