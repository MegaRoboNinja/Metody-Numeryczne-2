% wynikiem jest x^2 
N = 10;
l = 1;
r = 10;

a = { @(x) 0, @(x) 1, @(x) -x  };
b = @(x) 0;
Y0 = [ 1 2 ]; % x0 y(x0) y'(x0) y''(x0) ...  y^(m-1)
[x,yv2] = P2Z49_MWY_RungeKutta4(l, r, a, b, [l Y0], N, Ralston);
% z jakiegoś powodu tutaj lepiej sprawdzała się metoda klasyczna
yprec = x.^2;

figure(1);
plot( x, yv2, x, yprec, LineWidth=2);
legend('przybliżenie', 'dokładna wartość');

fprintf("yv2(end) - yprec(end)");
disp(max (abs(yv2 - yprec')) );