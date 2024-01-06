function res = F(Y)
% Projekt 2, zadanie 49
% Miłosz Wysocki, 324572
%
% ZMIENNE GLOBALNE
%   Y0 - wektor zwierający wartości początkowe funkcji y i jej
%        pochodnych występujących w równaniu, w punkcie x0. Jest on
%        postaci:
%               [y(x0), y'(x0), y''(x0) ... y^(m-1)(x0)]^T
%        (patrz P2Z49_MWY_RungeKutta4)
%   a  - wektor komórkowy (cell array) zawierająca uchwyty do funkcji
%               { a_1 a_2, ... a_m, a_{m+1} }
%        uwaga: współcznnik przy y^(i) to a_{i+1}
%        (patrz P2Z49_MWY_RungeKutta4)
%   b  - uchwyt do funkcji b (patrz P2Z49_MWY_RungeKutta4)
% WEJŚCIE
%   Y  - wektor Y
% WYJŚCIE
%   F  - uchwyt do funkcji F

% Najwyższy rząd  pochodnej (potrzebny funkcji f)
m = length(a) - 1;

if length(Y) >= 3
    res = [1 Y(3:end) f(Y)]; 
else
    res = [1 f(Y)];
end

function res = f(Y)
    % Wynacza funkcję f
    % Y(1) to punkt x
    res = b(Y(1));
    for i = 1:m
        ai = a{i};
        res = res - ai(Y(1))*Y(i);
    end
    am = a{m+1};
    res = res * 1/(am(Y(1)));
end % function f
end % function getF