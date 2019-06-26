function [Y] = nystrom(f, a, b, h, y0, metodo_arranque)
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
  
  ARRANQUE = feval(metodo_arranque, f, a, b, h, y0);
  
  # obtuvimos valor de arranque
  Y(2, :) = ARRANQUE(2, :); 
  
  for i = 3 : k + 1
    
    y_n_1 = Y(i-2, :);
    yprima_n = feval(f, Y(i - 1, :)); 
    
    Y(i, :) = y_n_1 + 2 * h * yprima_n;
    
  end
end