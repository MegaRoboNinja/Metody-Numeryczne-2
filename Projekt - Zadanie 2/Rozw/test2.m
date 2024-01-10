function test2()
fprintf("================================= TEST 2 ==================================\n\n");
fprintf("Porównanie metody RK4 ze wzorem Ralstona oraz klasycznej\n\n");

% Funkcja 1
fprintf("\tdy^2/d2x + dy/dx = x   na przedziale [0, 20], 100 kroków\n");
a = { @(x) 0, @(x) 1, @(x) 1  };
b = @(x) x;
Y0 = [ 0 1 1 ];
[xR, y] = P2Z49_MWY_RungeKutta4(0, 20, a, b, Y0, 100, Ralston);
yprec = 0.5*xR.^2 - xR - 2*exp(-xR) + 3;
globErr1 = abs(yprec(end) - y(end));
fprintf("Błąd globalny metody Ralstona:   %.3e\n", globErr1)

[xR, y] = P2Z49_MWY_RungeKutta4(0, 20, a, b, Y0, 100, Classic);
yprec = 0.5*xR.^2 - xR - 2*exp(-xR) + 3;
globErr2 = abs(yprec(end) - y(end));
fprintf("Błąd globalny metody klasycznej: %.3e\n\n", globErr2);

% Funkcja 2
fprintf("\tdy^2/d2x + 2 * dy/dx + y = exp(-x)  na przedziale [0, 100], 100 kroków\n");
a = { @(x) 1, @(x) 2, @(x) 1  };
b = @(x) exp(-x);
Y0 = [ 0 0 1 ];
[xR, y] = P2Z49_MWY_RungeKutta4(0, 100, a, b, Y0, 100, Ralston);
yprec = exp(-xR).*(xR-1);
globErr1 = abs(yprec(end) - y(end));
fprintf("Błąd globalny metody Ralstona:   %.3e\n", globErr1)

[xR, y] = P2Z49_MWY_RungeKutta4(0, 100, a, b, Y0, 100, Classic);
yprec = exp(-xR).*(xR-1);
globErr2 = abs(yprec(end) - y(end));
fprintf("Błąd globalny metody klasycznej: %.3e\n\n", globErr2);
