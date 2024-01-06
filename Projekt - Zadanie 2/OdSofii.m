function yres = rungekutty4order(a, b, n, bx, a_k, y0)
% Obliczanie przybliżonego rozwiązania liniowego równania
% różniczkowego postaci:
% a_m(x)*y^{m} + a_{m-1}(x)*y^{m-1} + ... + a_1(x)*y' + a_0(x)*y = bx(x)
% za pomocą klasycznej metody Rungego-Kutty 4-tego rzędu
% WEJŚCIE:
%   a,b  - końce przedziału, na którym przybliżamy rozwiązanie
%   n    - liczba kroków do wykonania
%   bx   - uchwyt do funkcji bx(x)
%   a_k  - wektor typu cell array
%          zawierający uchwyty do funkcji a_1(x),...,a_m(x),gdzie
%          funkcja a_m nie zeruje się w przedziale [a,b]
%   y0   - wektor warunków początkowych x0,y_1,y_2,...,y_m
%          gdzie x0 = a, y_1 = y(x0) oraz y_i = y^{i-1}(x0) dla i = 2...m 
% WYJŚCIE:
%   yres - poziomy wektor wyznaczonych przybliżeń wartości funkcji y(x)
%          w punktach postaci a + kh, gdzie h = (b - a)/n, 0<=k<=n,
%          yres(1) = y(x0) jest wartością funkcji w x0, wziętą z wektora
%          warunków początkowych

end % function
