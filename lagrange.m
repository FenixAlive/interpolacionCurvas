xn = [1,2,3];
yn = [9.4,.5,9];
k=1;

V = xn(2:3);
% V = [xn(1:(k-1)),xn((k+1):end)]
L =poly(V)/prod(xn(1)-V)
poly2str(L,'L') % no es necesario solo lo hace bonito pero viene de matlab
