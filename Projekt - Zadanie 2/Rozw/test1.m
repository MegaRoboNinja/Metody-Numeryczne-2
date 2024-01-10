function test1()
fprintf("================================= TEST 1 ==================================\n\n");
fprintf("Rząd Metody\n");
fprintf("Metoda jest rzędu czwartego. Błąd globalny powinien więc być proporcjonalny\n");
fprintf("do h^4 (h to długość kroku).\n"); %Natomiast błąd lokalny do h^5.\n

% Funkcja 1
fprintf("dy^2/d2x + dy/dx = x \t na przedziale [0, 100]\n");
a = { @(x) 0, @(x) 1, @(x) 1  };
b = @(x) x;
Y0 = [ 0 1 1 ];
[x, y] = P2Z49_MWY_RungeKutta4(0, 100, a, b, Y0, 60, Ralston);
yprec = 0.5*x.^2 - x - 2*exp(-x) + 3;
globErr1 = abs(yprec(end) - y(end));
fprintf("\tBłąd globalny metody o 50 krokach: %.1e\n", globErr1)

[x, y] = P2Z49_MWY_RungeKutta4(0, 100, a, b, Y0, 80, Ralston);
yprec = 0.5*x.^2 - x - 2*exp(-x) + 3;
globErr2 = abs(yprec(end) - y(end));
fprintf("\tBłąd globalny metody o 100 krokach: %.1e\n", globErr2);

fprintf("Spodziewany stosunek: %.3f\n", (4/3)^4);
fprintf("Otrzymany stosunek:   %.3f\n", globErr1/globErr2);