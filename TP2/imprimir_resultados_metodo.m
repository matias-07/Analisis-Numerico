function imprimir_resultados_metodo(metodo, f, a, b, h, y0, filename)
    % Imprime en un .txt los resultados de aplicar un método numérico
    
    Y = feval(metodo, f, a, b, h, y0);
    file_id = fopen(filename, 'w');
    
    fprintf(file_id, "[a, b] = [%d, %d]\n", a, b);
    fprintf(file_id, "h = %.3d \n \n", h);
    
    fprintf(file_id, "%3s %13s %13s %13s %13s\n", "n", "x1", "v1", "x2", "v2")
    for i = 1 : rows(Y)
      resultado = Y(i, :);
      fprintf(file_id, "%3d %13.6f %13.6f %13.6f %13.6f\n", i, Y(i,1), Y(i,2), Y(i,3), Y(i,4));
    end
    
    fprintf(file_id, "\n \n");
    fclose(file_id);
        
endfunction
