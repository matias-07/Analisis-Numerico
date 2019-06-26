function error_segun_metodo_arranque(metodo, f, a, b, h, y0, arranque)  
  yfinal_lsode = lsode(f, y0, a:h:b);
  y_metodo = feval(metodo, f, a, b, h, y0, arranque);
  
  rownum = rows(yfinal_lsode);
  errores = zeros(rownum, length(y0));
  
  for i = 1 : rownum
  
    errores(i, :) = yfinal_lsode(i, :) -  y_metodo(i, :);
    
  end
  
  error_t2 = errores(rownum, :);
  fprintf("(e_x1, e_x2) = (%.8f, %.8f)\n", error_t2(1), error_t2(3));
  
end