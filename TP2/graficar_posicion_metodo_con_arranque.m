function graficar_posicion_metodo_con_arranque(metodo, f, a, b, h, y0, arranque)
  % Grafica las trayectorias obtenidas con el método elegido para hallar solución.
  % Recibe:
  %  -> metodo = función que resuelve
  %  -> f = f(y, t)
  %  -> a, b extremos del intervalo
  %  -> h step
  %  -> y0 vector de condiciones iniciales
  
  Y = feval(metodo, f, a, b, h, y0, arranque);
  
  # para mostrar trayectoria respecto al tiempo (izq a der)
  x1 = Y(:, 1);  
  x2 = Y(:, 3);
  
  plot(x1, x2, sprintf(";h = %d;", h));
  
  xlabel("x1")
  ylabel("x2")
  title(["r = (x1, x2) - " metodo])
  axis("tight")
  grid("on")
  box("off")
  
  hold on
  
end