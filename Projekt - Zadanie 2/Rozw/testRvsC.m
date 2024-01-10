% dy^2/d2x + dy/dx = x
% Classic vs Ralston
N = 35; % Przy niższych niż 35 wariuje
l = 0;
r = 100;

a = { @(x) 0, @(x) 1, @(x) 1  };
b = @(x) x;
Y0 = [ 1 1 ]; % x0 y(x0) y'(x0) y''(x0) ...  y^(m-1)
[~,yv1] = P2Z49_MWY_RungeKutta4(l, r, a, b, [0 Y0], N, Ralston);
[x,yv2] = P2Z49_MWY_RungeKutta4(l, r, a, b, [0 Y0], N, Classic);
yprec = 0.5*x.^2 - x - 2*exp(-x) + 3;

figure(2);
plot(x, yv1, x, yv2, x, yprec, LineWidth=2);
legend('Ralston', 'Klasyczna', 'dokładna wartość');