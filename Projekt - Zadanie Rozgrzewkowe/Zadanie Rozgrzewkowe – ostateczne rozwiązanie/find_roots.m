function roots = find_roots(func, left, right, intrv_num)
% Zadanie R
% Miłosz Wysocki, 324572
%
% Znajdowanie miejsc zerowych funkcji func na przedziale [left, right]
% poprzez podział na intrv_num równych podprzedziałów 
% i szukanie na każdym z nich najwyżej jednego miejsca zerowego
% za pomocą metody bisekcji
% WEJŚCIE
%   func      - funkcja ciągła (patrz wyżej)
%   left      - lewy kraniec przedziału (patrz wyżej)
%   right     - prawy kraniec przedziału (patrz wyżej)
%   intrv_num - liczba podprzedziałów, na każdym z których będziemy
%               szukać co najwyżej jednego miejsca zerowego (patrz wyżej)
% WYJŚCIE
%   roots     - wektor znalezionych na tym przedziale miejsc zerowych
%               funkcji func

roots = zeros(2000, 1);

% Podział przedziału na podprzedziały równej długości
intervals = linspace(left, right, intrv_num);

% Obliczenie wartości funkcji na granicach podprzedziałów
f_bounds = func(intervals);

% Szukanie miejsc zerowych na każdym z podprzedziałów
nextInd = 1;
for i = 1:(intrv_num - 1)
    % Sprawdzenie warunku obecności miejsca zerowego na podprzedziale
    if f_bounds(i) * f_bounds(i + 1) < 0 &&...
            isreal(f_bounds(i)) && isreal(f_bounds(i + 1))

        % Wykonanie bisekcji na podprzedziale
        new_root = bisection(func, intervals(i), intervals(i + 1));
        
        % Dopisanie wyniku do wektora znalezionych miejsc zerowych
        if ~isnan(new_root)
            roots( nextInd ) = new_root;
            nextInd = nextInd + 1;
        end
    end
end

% "Wycięcie" wykorzystanej części wektora (był prealokowany "na zapas")
roots = roots( 1:(nextInd - 1) );

end % function