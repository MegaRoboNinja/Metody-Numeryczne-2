function S = P1Z22_MWY_triangInt(f, p, n, drawPicture)
% Projekt 1, zadanie 22
% Miłosz Wysocki, 324572
%
% Obliczanie przybliżonej wartości całki podwójnej funkcji f 
% na trójkącie z zastosowaniem złożonej kwadratury rzędu 4-go 
% przy podziale obszaru na mniejsze trójkąty przystające
% WEJŚCIE 
%   f    - uchwyt do funkcji f dwóch zmiennych, całkowalnej w sensie 
%          Riemanna na obszarze całkowania (patrz wyżej)
%   p    - macierz zawierająca współrzędne wierzchołków trójkąta 
%          (obszaru całkowania) p(i,:) - współrzędne punktu pi
%   n    - liczba określająca podział obszaru całkowania - zostanie on
%          podzielony na n^2 mniejszych trójkątów przystających
%   draw - argument opcjonalny, napis, jeśli jest równy 'y'
%          to funkcja narysuje podział obszaru całkowania
% WYJŚCIE
%   S - przybliżona wartość całki podwójnej funkcji f na trójkącie
%          określonym przez przez punkty p1 p2 p3

% Podzielmy obszar całkowania (trójkąt) na n^2 podobnych do niego 
% a przystających do siebie mniejszych trójkątów
Triangles = divide(p, n);

% Narysujmy to aby sprawdzić, czy rzeczywiście działa
if nargin == 4 && drawPicture == 'y'
    draw(p, n, Triangles);
end

% Mamy już wierzchołki małych podobszarów (trójkątów)
% możemy więc na każdym wykonać kwadraturę prostą
S = 0;
for column = 1:n
    for row = 1:(n+1-column)
        triangle = ...
          [ Triangles(column, row, 1) Triangles(column, row, 2)    ;
            Triangles(column, row+1, 1) Triangles(column, row+1, 2);
            Triangles(column+1, row, 1) Triangles(column+1, row, 2)];
        S = S + Sswk(f, triangle);
    end
    for row = 2:(n+1-column)
        if column == n+1
            break;
        end
        triangle = ...
          [ Triangles(column+1, row-1, 1) Triangles(column+1, row-1, 2);
            Triangles(column+1, row, 1) Triangles(column+1, row, 2)    ;
            Triangles(column, row, 1) Triangles(column, row, 2)        ];
        S = S + Sswk(f, triangle);
    end
end