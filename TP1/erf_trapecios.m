function result = erf_trapecios(x, n)
  h = x/n;
  xj = h;
  S = 0;
  for j = 1 : n - 1
    xj2 = xj * xj;
    S += exp(-xj2);
    xj += h;
  end
  S = 1 + 2*S + exp(-1);
  result = h*S / sqrt(pi);
endfunction
   