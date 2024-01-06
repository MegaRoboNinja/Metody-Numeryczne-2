function S = MonteCarlo(f, p, n, maximum, minimum)
% Projekt 1, zadanie 22
% Miłosz Wysocki, 324572
%
% Obliczanie przybliżonej wartości całki podwójnej funkcji f 
% na trójkącie z zastosowaniem metody Monte Carlo
% WEJŚCIE 
%   f - uchwyt do funkcji f dwóch zmiennych, całkowalnej w sensie 
%          Riemanna na obszarze całkowania (patrz wyżej)
%   p - macierz zawierająca współrzędne wierzchołków trójkąta 
%          (obszaru całkowania) p(i,:) - współrzędne punktu pi
%   n - liczba losowanych punktów
% WYJŚCIE
%   S - przybliżona wartość całki podwójnej funkcji f na trójkącie
%          określonym przez przez punkty p1 p2 p3

% Losowanie punktów, które będziemy badać
X = zeros(n,1);
Y = zeros(n,1);
Z = zeros(n,1);
for i = 1:n
    Z(i) = rand() * (maximum - minimum) + minimum; % losowa liczba z zakresu [min, max]
    % losowanie "z trójkąta"
    while 1 
        xmax = max(p(:,1));
        xmin = min(p(:,1));
        ymax = max(p(:,2));
        ymin = min(p(:,2));
        rx = rand() * (xmax - xmin) + xmin;
        ry = rand() * (ymax - ymin) + ymin;
        if isInTriangle([rx, ry], p)
            break;
        end
    end
    X(i) = rx; Y(i) = ry;
end

% Sprawdzanie ile wylosowanych punktów jest pod wykresem funkcji
count = 0;
for i = 1:n
    if Z(i) < f(X(i), Y(i))
        count = count + 1;
    end
end


% Pole obszaru całkowania
A = [ 1, 1, 1  ;
      p(:, 1)' ;
      p(:, 2)' ];
P = 1/2 * abs( det(A) );
% Wysokość obszaru całkowania
H = maximum - minimum;
% Przybliżona wartość całki
S = (count / n) * P * H;