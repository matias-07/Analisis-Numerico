function [Y] = euler(f, a, b, h, y0)
  % Recibe:
  %  -> f = yprima
  %  -> a, b extremos del intervalo
  %  -> h paso
  %  -> y0 vector de condiciones iniciales
  % Devuelve:
  %  -> Y matriz donde cada fila es el correspondiente vector yk = y(tk)
  
  t = a:h:b;
  k = (b - a) / h;
  
  Y = zeros(k, length(y0));
  Y(1, :) = y0;
  for i = 2 : k + 1
    Y(i, :) = Y(i-1, :) + h*feval(f, Y(i-1, :));
  end
end