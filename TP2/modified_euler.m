function [Y] = modified_euler(f, a, b, h, y0)
  % Recibe:
  %  -> f = yprima
  %  -> a, b extremos del intervalo
  %  -> h paso
  %  -> y0 vector de condiciones iniciales
  % Devuelve:
  %  -> Y matriz donde cada fila es el correspondiente vector yk = y(tk)
  
  t = a:h:b;
  k = int64((b - a) / h);
  
  Y = zeros(k, length(y0));
  Y(1, :) = y0;
  
  for i = 2 : k + 1
    
    y_n = Y(i-1, :);
    yprima_n = feval(f, Y(i - 1, :)); 
    
    q1 = yprima_n;
    q2 = feval(f, y_n + h * yprima_n);
    
    Y(i, :) = y_n + (h / 2) * (q1 + q2);
    
  end
end