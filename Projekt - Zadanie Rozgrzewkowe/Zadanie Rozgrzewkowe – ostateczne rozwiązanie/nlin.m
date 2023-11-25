function roots = nlin(func)
% Zadanie R
% Miłosz Wysocki, 324572
% Total minipoints score: 770.1
%
% Znajdowanie rzeczywistych miejsc zerowych funkcji func
% poprzez wykorzystanie metody bisekcji na przedziałach
% WEJŚCIE
%   func - funkcja ciągła
% WYJŚCIE
%   roots - wektor zawierający znalezione miejsca zerowe

roots = zeros(15000, 1);
next_ind = 1;

% Generowanie wektora przedziałów
bounds_vctr = [ logspace(-2, 10, 13) 10^18 ];
bounds_vctr = [ -1 * bounds_vctr( length(bounds_vctr):-1:1 ) bounds_vctr ];
% w funkcji find_roots każdy przedział podzielimy na intrv równych części
intrv = 200000;

% Tworzenie wektora miejsc zerowych
for i = 1:(length(bounds_vctr) - 1)
    % Szukanie miejsc zerowych na przedziale
    new_roots = find_roots(func, bounds_vctr(i), bounds_vctr(i+1), intrv);

    % Dopisywanie wyników do wektora miejsc zerowych
    roots( next_ind:(next_ind + length(new_roots) - 1) ) = new_roots;
    next_ind = next_ind + length(new_roots);
end

% "Wycięcie" wykorzystanej części wektora (był prealokowany "na zapas")
roots = roots( 1:(next_ind - 1) );

end % function