function [Y] = nystrom(f, a, b, h, y0, metodo_arranque)
  % Recibe:
  %  -> f = yprima
  %  -> a, b extremos del intervalo
  %  -> h paso
  %  -> y0 vector de condiciones iniciales
  % Devuelve:
  %  -> Y matriz donde cada fila es el correspondiente vector yk = y(tk)
  
  t = a:h:b;
  k = (b - a) / h; # cantidad de pasos
  
  # error de truncamiento local de nystrom es O(h^2), entonces tolerancia: O(h^3)
  tolerancia = h ^ 3;
  max_iter = 1000;
  iteraciones = 1;
  
  Y = zeros(k, length(y0));
  Y(1, :) = y0;
  
  # obtengo y1 mediante el metodo de arranque
  ARRANQUE = feval(metodo_arranque, f, a, b, h, y0);
  Y(2, :) = ARRANQUE(2, :); 
  
  for i = 3 : k + 1 
    
    y_anterior = Y(i -1, :);
    y_anterior_anterior = Y(i - 2, :);
    
    y_local_anterior = Y(i -1, :);
    yprima_n = feval(f, Y(i - 1, :)); 
    y0_local = Y(i - 2, :) + 2 * h * yprima_n;
    
    while (y0_local - y_anterior > tolerancia || iteraciones < max_iter)
      
      y_local_anterior = y0_local;
      y0_local = 2 * y_anterior - y_anterior_anterior + h^2 * ((y_local_anterior - y_anterior_anterior) / (2 * h) - y_anterior);
      
      iteraciones += 1;
      
    end
    
    Y(i, :) = y0_local; 
    
  end
  
  
end