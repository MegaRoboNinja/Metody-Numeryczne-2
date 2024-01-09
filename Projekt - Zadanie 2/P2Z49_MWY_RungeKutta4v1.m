function [x, y] = P2Z49_MWY_RungeKutta4v1(l, r, a, b, Y0, N, RK)
% Projekt 2, zadanie 49
% Miłosz Wysocki, 324572
%
% Przybliżanie rozwiązania liniowego równania różniczkowego dowolnego rzędu 
% na przedziale [l,r] za pomocą metody Rungego-Kutty 4. rzędu 
% z zastosowaniem metody określonej daną tablicą Butchera RK. Równanie to 
% jest postaci:
%   a_{m+1}(x)*y^(m) + a_{m}(x)*y^(m-1) + ... + a_2(x)*y' + a_1(x)*y = b(x)
% WEJŚCIE 
%   l  - lewy koniec przedziału, na kórym rozwiązujemy równianie
%   r  - prawy koniec przedziału, na kórym rozwiązujemy równianie
%   a  - wektor komórkowy (cell array) zawierająca uchwyty do funkcji
%               { a_1 a_2, ... a_m, a_{m+1} }
%        uwaga: współcznnik przy y^(i) to a_{i+1}
%   b  - uchwyt do funkcji b (patrz wyżej)
%   Y0 - wektor zwierający wartości punkt x0 i początkowe funkcji y i jej
%        pochodnych występujących w równaniu, w punkcie x0. Jest on
%        postaci:
%               [ y(x0), y'(x0), y''(x0) ... y^(m-1)(x0) ]^Ts
%   N  - liczba punktów, w których zostanie przybliżona wartość y(x)
%   RK - uchwyt do funkcji zwracającej tablicę butchera definiująca metodę
%        jaką należy zastosować.
% WYJŚCIE
%   x  - wektor równoodległych punktów z przedziału [a,b]
%   y  - wektor zawierający przybliżenia wartości szukanej funkcji y(x)
%        w punktach na odpowiadającej pozycji w wektorze x

% Jeśli konkretna metoda nie została wyspecyfikowana to Ralston
if nargin == 6
    RK = @Ralston;
end

% Pobranie tablicy Butchera i podzielenie jej na wektor C i macierz A
B = RK();
C = B(:,1);
A = B(:,2:end);

% Prealokacja wektorów wynikowych
x = linspace(l, r, N);
y = zeros(N, 1);
y(1) = Y0(1);

Ylast = Y0;

for k = 2:N % w notatkach wyznacza się k+1 więc wszystko jest przesunięte
    % długość kroku
    h = x(k) - x(k-1);

    K0 = F(x(k), Ylast);
    K1 = F(x(k), Ylast + h*A(2,1)*K0);
    K2 = F(x(k), Ylast + h*(A(3,1)*K0 + A(3,2)*K1));
    K3 = F(x(k), Ylast + h*(A(4,1)*K0 + A(4,2)*K1 + A(4,3)*K2));

    Yk = Ylast + h * (C(1)*K0 + C(2)*K1 + C(3)*K2 + C(4)*K3);
    
    % zapisanie kolejnego przybliżenia
    y(k) = Yk(1);

    Ylast = Yk;
end

function Res = F(x, Y)
% Najwyższy rząd  pochodnej (potrzebny funkcji f)
m = length(a) - 1;

if length(Y) >= 2
    Res = [ Y(2:end) f(x, Y)]; 
else
    Res = [ f(x, Y) ];
end

function res = f(x, Y)
    % Wynacza funkcję f
    res = b(x);
    for i = 1:m
        ai = a{i};
        res = res - ai(x)*Y(i);
    end
    am = a{m+1};
    res = res * 1/(am(x));
end % function f
end % function F


end % function P2Z49_MWY_RungeKutta4v1