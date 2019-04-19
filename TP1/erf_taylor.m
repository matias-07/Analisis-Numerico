function result = erf_taylor( x, n )
  x2 = x * x;
  ak = x;
  S = x;
  for k = 1 : n
    ak *= -x2/k;
    S += ak / (2*k + 1);
  end
    result = 2*S / sqrt(pi);
endfunction