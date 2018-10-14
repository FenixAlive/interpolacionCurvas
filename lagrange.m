xn=  [-2.00  -1.6300  -1.2600 -.8900  -.53  -.16 .21 .58 .95 1.32 1.68 2.05];
y= [3.5000 4.8700 5.4500 7.7600 7.4000 7.8600 8.7300 8.6700 10.3200 11.0000 10.7000 11.7800];

k=7;
V = xn(2:end);

V = [xn(1:(k-1)),xn((k+1):end)]
Lt=(poly(V)/prod(xn(k)-V))
%L =poly(V)/prod(xn(1)-V);
poly2str(Lt,'x') % no es necesario solo lo hace bonito pero viene de matlab
