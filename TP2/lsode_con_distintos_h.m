function lsode_con_distintos_h(yprima, a, b, h, y0)
  % Grafica las trayectorias obtenidas con lsode para distintos valores de h.
  % Recibe:
  %  -> yprima = f(y, t)
  %  -> a, b extremos del intervalo
  %  -> h vector con distintos valores de paso
  %  -> y0 vector de condiciones iniciales
  
  for h_i = h
    Y = lsode(yprima, y0, a:h_i:b);
    x1 = Y(:, 1);
    x2 = Y(:, 3);
    plot(x1, x2, sprintf(";h = %d;", h_i));
    hold on
  end
end