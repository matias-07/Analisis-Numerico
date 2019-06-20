function [f] = f(y)
  % Recibe:
  %   -> y = [x1; v1; x2; v2]
  % Devuelve:
  %   -> y' = f(y, t)
  
  u = 1/81.3;
  n = 1 - u;
  
  d1 = sqrt((y(1) + u)^2 + y(3)^2);
  d2 = sqrt((y(1) - n)^2 + y(3)^2);
  
  f(1) = y(2);
  f(2) = 2*y(4) + y(1) - n*(y(1) + u)/d1^3 - u*(y(1) - n)/d2^3;
  f(3) = y(4);
  f(4) = -2*y(2) + y(3) - n*y(3)/d1^3 - u*y(3)/d2^3;
end