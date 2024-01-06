function drawTriangle(p, colour, lineWidth)
% Projekt 1, zadanie 22
% Miłosz Wysocki, 324572
%
% Rysowanie trójkąta na podstawie wierzchołków
% WEJŚCIE 
%   p         - macierz zawierająca współrzędne wierzchołków trójkąta 
%               p(i,:) - współrzędne punktu pi
%   colour    - znak określający kolor w jakim ma zostać narysowany 
%               trójkąt (zgodnie ze specyfikacją funkcji line)
%   lineWidth - liczba określająca grubość lini jaką ma zostać narysowany 
%               trójkąt (zgodnie ze specyfikacją funkcji line)

% ustawmy wartości domyślne w razie nie podania dodatkowych argumentów
if nargin == 1 
    colour = 'r';
else 
    if nargin == 2
        lineWidth = 2;
    end
end

% narysujmy trójkąt
line(p(1:2, 1), p(1:2, 2), 'Color', colour, 'LineWidth', lineWidth);
line(p(2:3, 1), p(2:3, 2), 'Color', colour, 'LineWidth', lineWidth);
line(p(1:2:3, 1),p(1:2:3, 2), 'Color', colour, 'LineWidth', lineWidth);
