function [Y] = rk4(f, a, b, h, y0)
  % Recibe:
  %  -> f = yprima
  %  -> a, b extremos del intervalo
  %  -> h paso
  %  -> y0 vector de condiciones iniciales
  % Devuelve:
  %  -> Y matriz donde cada fila es el correspondiente vector yk = y(tk)
  % y(i+1) = y(i) + 1 / 6 * h * (k1 + 2k2 + 2k3 + k4)
  % k1 = feval(f, y)
  % k2
  
  t = a:h:b;
  k = (b - a) / h;
  
  Y = zeros(k, length(y0));
  Y(1, :) = y0;
  
  for i = 2 : k + 1
    
    y_n = Y(i-1, :);
    yprima_n = feval(f, Y(i - 1, :)); 
    
    q1 = yprima_n;
    q2 = feval(f, y_n + 0.5 * h * q1);
    q3 = feval(f, y_n + 0.5 * h * q2);
    q4 = feval(f, y_n + h * q3);
    
    Y(i, :) = y_n + (1 / 6) * h * (q1 + 2 * q2 + 2 * q3 + q4);
    
  end
end