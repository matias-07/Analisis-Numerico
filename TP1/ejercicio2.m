1;

function iteraciones = cifras_significativas_trapecios(file_id, d)
  n = 1;
  erf1 = erf(1);
  do
    resultado_trapecios = erf_trapecios(1, n);
    error_trapecios = erf1 - resultado_trapecios;
    n++;
  until (abs(error_trapecios) < 10^(-d));
  iteraciones = --n;
  fprintf(file_id, ...
      "Iteraciones de erf_trapecios para %d cifras significativas: %d\n resultado=%.10f error=%.10e\n\n"...
      , d, iteraciones, resultado_trapecios, error_trapecios);
endfunction

file_id = fopen('resultados.txt', 'w');
erf1 = erf(1);
fprintf(file_id, "erf(1) = %.10f (octave) \n\n", erf1);

fprintf(file_id, "%3s %17s %17s %17s %17s\n","n","res_taylor","error_taylor","res_trapecios","error_trapecios");
for n = 1:10
  resultado_taylor = erf_taylor(1,n);
  error_taylor = erf1 - resultado_taylor;
  resultado_trapecios = erf_trapecios(1,n);
  error_trapecios = erf1 - resultado_trapecios;
  fprintf(file_id, "%3d %17.10f %17.10e %17.10f %17.10e\n", n, resultado_taylor, error_taylor, resultado_trapecios, error_trapecios);
end

fprintf(file_id, "\n\n");
for cifras_significativas = 5:8
  cifras_significativas_trapecios(file_id, cifras_significativas);
end
fclose(file_id);




