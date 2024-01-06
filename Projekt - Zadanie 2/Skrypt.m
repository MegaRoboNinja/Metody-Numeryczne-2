clearvars;
%jest błąd

% dy/dx = 0
a = { @(x) 0, @(x) 1 };
b = @(x) 0;
Y0 = [ 0 5 ]; % x0 y(x0) y'(x0) y''(x0) ... y^(m-1)
[~,yC] = P2Z49_MWY_RungeKutta4(0, 5, a, b, Y0, 10, Classic);
[x,yR] = P2Z49_MWY_RungeKutta4(0, 5, a, b, Y0, 10, Ralston);
yprec = 5*ones(length(x),1);

figure(1);
plot(x, yC, x, yR, x, yprec, LineWidth=2);
legend('przybliżenie m. klasyczną','przybliżenie m. Ralstona', 'dokładna wartość');

% dy^2/d2x + dy/dx = x
a = { @(x) 0, @(x) 1, @(x) 1  };
b = @(x) x;
Y0 = [ 0 1 1 ]; % x0 y(x0) y'(x0) y''(x0) ...  y^(m-1)
[~,yC] = P2Z49_MWY_RungeKutta4(0, 5, a, b, Y0, 10, Classic);
[x,yR] = P2Z49_MWY_RungeKutta4(0, 5, a, b, Y0, 10, Ralston);
yprec = 0.5*x.^2 - x - 2*exp(-x) + 3;

figure(2);
plot(x, yC, x, yR, x, yprec, LineWidth=2);
legend('przybliżenie m. klasyczną', 'przybliżenie m. Ralstona', 'dokładna wartość');