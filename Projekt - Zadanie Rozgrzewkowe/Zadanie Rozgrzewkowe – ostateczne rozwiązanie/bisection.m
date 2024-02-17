function root = bisection(f, left, right) 
% Zadanie R
% Miłosz Wysocki, 324572
%
% Znajdowanie pojedynczego miejsca zerowego funkcji f
% na przedziale [left, right] za pomocą metody bisekcji
% (przy założeniu, że na przedziale jest co najmniej jedno miejsce zerowe)
% STAŁE 
%   MAXI        - maksymalna liczba iteracji, po której bisekcja zostaje
%                 przerwana i zostaje zwrócony przybliżony wynik 
%   PREC        - najmniejsza szerokość przedziału na którym przechodzimy
%                 do kolejnego kroku bisekcji
% WEJŚCIE 
%   f           - funkcja ciągła (patrz wyżej)
%   left, right - lewy i prawy kraniec przedziału (patrz wyżej)
% WYJŚCIE
%   root        - pojedyncze miejsce zerowe funkcji f

MAXI = 50;
PREC = eps * 1000;
i = 0;

while ( i < MAXI )
    middle = (left + right) / 2;

    if (right - left) < PREC 
        i = MAXI;
    else
        if f(middle) * f(left) < 0
            right = middle;
        else
            left = middle;
        end
    end

    i = i + 1;
end

root = middle;

end % function