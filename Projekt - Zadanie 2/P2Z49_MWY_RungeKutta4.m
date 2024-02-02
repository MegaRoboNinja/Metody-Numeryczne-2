function [x, y] = P2Z49_MWY_RungeKutta4(l, r, a, b, Y0, N, RK)
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
%               [ x0 y(x0), y'(x0), y''(x0) ... y^(m-1)(x0)]^Ts
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
y(1) = Y0(2);

Ylast = Y0;

for k = 2:N % W notatkach wyznacza się k+1 więc wszystko jest przesunięte
    % Długość kroku
    h = x(k) - x(k-1);

    % Wyznaczenie współczynników
    K0 = F(Ylast);
    K1 = F(Ylast + h*A(2,1)*K0);
    K2 = F(Ylast + h*(A(3,1)*K0 + A(3,2)*K1));
    K3 = F(Ylast + h*(A(4,1)*K0 + A(4,2)*K1 + A(4,3)*K2));

    % Obliczenie kolejnego wektora Yk
    Yk = Ylast + h * (C(1)*K0 + C(2)*K1 + C(3)*K2 + C(4)*K3);
    
    % Zapisanie kolejnego przybliżenia
    y(k) = Yk(2);

    Ylast = Yk;
end

function Res = F(Y)
% Najwyższy rząd  pochodnej (potrzebny funkcji f)
m = length(a) - 1;

% Stworzenie wektora F(Y)
if length(Y) >= 3
    Res = [1 Y(3:end) f(Y)]; 
else
    Res = [1 f(Y)];
end

function res = f(Y)
    % Wynacza funkcję f
    % Y(1) to punkt xk
    res = b(Y(1));
    for i = 1:m
        ai = a{i};
        res = res - ai(Y(1))*Y(i+1);
    end
    am = a{m+1};
    res = res * 1/(am(Y(1)));
end % function f
end % function F
end % function P2Z49_MWY_RungeKutta4