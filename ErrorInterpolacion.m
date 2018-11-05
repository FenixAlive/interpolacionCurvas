%Y = [8.069716;9.9441244;9.8874492;9.1029864;8.2509389;7.3820541;6.689818;6.0611708;5.5205461;5.0693449;4.6987975;4.3362729;4.0808602;3.8126041];
%X = [0.5,0.8538462,1.2076923,1.5615385,1.9153846,2.2692308,2.6230769,2.9769231,3.3307692,3.6846154,4.0384615,4.3923077,4.7461538,5.1];
format rat
X = linspace(-2,15,13)
Y = [663/399 2957/191 1459/81 4696/57 5897/20 67805/92 29887/20 82071/31 38551/9 97252/15 55991/6 167847/13 86537/5]'

format longG
M1 = [ones(size(X')),X']; 
M2 = [ones(size(X')),X',X'.^2]; 
M3 = [ones(size(X')),X',X'.^2,X'.^3];

B1=inv(M1'*M1)*(M1'*Y);
B2=inv(M2'*M2)*(M2'*Y);
B3=inv(M3'*M3)*(M3'*Y);

Err1 = norm(M1*B1-Y)
Err2 = norm(M2*B2-Y)
Err3 = norm(M3*B3-Y)
%xx=(-2:0.01:2)';Mx = [ones(size(xx)),xx,xx.^2];
%xx=(-2:0.01:2)';Mx = [ones(size(xx)),xx,xx.^2,xx.^3];
%plot(xx,Mx.*B,'r:',X,Y,'b+',X,M*B,'g-*');