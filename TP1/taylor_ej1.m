function result = taylor_ej1(x)
  x0 = pi / 6
  f = e**x0 * cos(x0)
  # primer derivada
  f1 = e**x0 * (cos(x0) - sin(x0))
  # segunda derivada
  f2 = (-2 * e**x0 * sin(x0))
  f3 = (-2 * e**x0 * (sin(x) + cos(x))) 
  
  p0 = f
  p1 = f1 * (x - x0)
  p2 = (f2 / factorial(2)) * (x - x0)**2
  error = (f3 / factorial(3)) * (x - x0)**3
  
  result = p0 + p1 + p2
endfunction
  
