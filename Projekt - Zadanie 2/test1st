clearvars;

% dy/dx = 0
a = { @(x) 0, @(x) 1 };
b = @(x) 0;
Y0 = [ 5 ]; % (x0) y(x0) y'(x0) y''(x0) ... y^(m-1)
[~,yv1] = P2Z49_MWY_RungeKutta4v1(0, 5, a, b, Y0, 10, Classic);
[x,yv2] = P2Z49_MWY_RungeKutta4(0, 5, a, b, [0 Y0], 10, Classic);
yprec = 5*ones(length(x),1);

figure(1);
plot(x, yv1, x, yv2, x, yprec, LineWidth=2);
legend('przybliżenie m. bez x w Y','przybliżenie m. z x w Y', 'dokładna wartość');