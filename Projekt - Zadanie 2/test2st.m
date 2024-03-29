% dy^2/d2x + dy/dx = x
N = 300;
l = 4;
r = 50;

a = { @(x) 0, @(x) 1, @(x) 1  };
b = @(x) x;
Y0 = [ 1 1 ]; % x0 y(x0) y'(x0) y''(x0) ...  y^(m-1)
[~,yv1] = P2Z49_MWY_RungeKutta4v1(l, r, a, b, Y0, N, Ralston);
[x,yv2] = P2Z49_MWY_RungeKutta4(l, r, a, b, [l Y0], N, Ralston);
% z jakiegoś powodu tutaj lepiej sprawdzała się metoda klasyczna
yprec = 0.5*x.^2 - x - 2*exp(-x) + 3;

figure(2);
plot(x, yv1, x, yv2, x, yprec, LineWidth=2);
legend('przybliżenie m. bez x w Y','przybliżenie m. z x w Y', 'dokładna wartość');

disp(max (abs(yv2 - yprec')) );