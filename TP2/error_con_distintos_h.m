function error_con_distintos_h()
  y0 = [1.2 0 0 -0.8];
  yfinal_verdadero = lsode("yprima", y0, 0:0.01:2)(201,:);
  H = 0.001:0.001:0.01;
  errores = [];
  for h = 0.001:0.001:0.01
    printf("%d\n", h);
    Y = euler("yprima", 0, 2, h, y0);
    yfinal_actual = Y(size(Y)(1), :);
    error_actual = norm(yfinal_verdadero - yfinal_actual);
    errores(size(errores)(2) + 1) = error_actual;
  end
  plot(H, errores);
  xlabel("h");
  ylabel("Norma del error absoluto");
end