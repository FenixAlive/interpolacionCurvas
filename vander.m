function v = vander(x, y)
  % función del polinomio de vandermonde
  % v = vander(x, y) donde x y y son arrays lineales del mismo tamaño con los valores correspondientes a los puntos
  if(length(x) == length(y))
    l = length(x);
    A = ones(l);
    B = y';
    for i = 1:l
      for j = 2:l
         A(i,j) = x(i)^(j-1);
      end
    end
    v = A\B;
  else
    fprintf("\n\n\tlos valores x no corresponden a los valores y\n\n")
end
