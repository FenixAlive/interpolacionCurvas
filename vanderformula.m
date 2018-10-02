clear all
f = @(x)(1./(1+x.^2)); %función
a = -2;
b = 2;
k = 9;
h = ((b-a)/(k-1));%tamaño de paso
xn = a+(0:(k-1))*h;
yn = [f(xn)];
x = -3:.001:3;
An = [];
Ax = [];
for i = 0:(k-1),An=[An; xn.^i];Ax=[Ax; x.^i];end
An = An';Ax=Ax';C=inv(An)*yn';
Px=Ax*C;
plot(x,f(x),'b:',xn,yn,'go',x,Px,'r'); 
axis([-3,3,0,2]);
