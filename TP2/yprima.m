function [f]=yprima(y, t)
    mu = 1 / 81.3;
    eta = 1 - mu;
    d1 = sqrt((y(1) + mu)^2 + y(3)^2);
    d2 = sqrt((y(1) - eta)^2 + y(3)^2);
    f(1)= y(2);
    f(2)= 2*y(4) + y(1) - eta*((y(1) + mu)/d1^3) -  mu*((y(1)-eta)/d2^3);
    f(3)= y(4);
    f(4)= -2*y(2) + y(3) - eta*(y(3)/d1^3) -  mu*(y(3)/d2^3);
end