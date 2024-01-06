function Triangles = divide(p, n)
% Projekt 1, zadanie 22
% Miłosz Wysocki, 324572
%
% Podział trójkąta na n^2 podobnych do niego 
% a przystających do siebie mniejszych trójkątów 
% WEJŚCIE 
%   p         - macierz zawierająca współrzędne wierzchołków trójkąta 
%               p(i,:) - współrzędne punktu pi
%   n         - liczba określająca podział obszaru całkowania - zostanie on
%               podzielony na n^2 mniejszych trójkątów przystających
% WYJŚCIE
%   Triangles - macierz trójwymiarowa zawierająca współrzędne mniejszych 
%               trójkątów (ich relatywna pozycja w macierzy odpowiada
%               pozycji w trójkącie)
%               Triangles(i,j,:) - współrzędne wierzchołka

% To będzie macierz trójwymiarowa w której będziemy przechowywać
% wierzchołki mniejszych trójkątów
Triangles = zeros(n+1, n+1, 2);
Triangles(1, 1, :) = p(1, :);
Triangles(1, n+1, :) = p(2, :);
Triangles(n+1, 1, :) = p(3, :);

% Ustawiamy współrzędne wszystkich wierzchołów (na granicy obszaru
% całkowania) na prostych między p1 a p2 oraz p1 a p3
for i = 2:n
    Triangles(1, i, :) = ( (n-i+1) * p(1, :) + (i-1) * p(2, :) ) / n;
    Triangles(i, 1, :) = ( (n-i+1) * p(1, :) + (i-1) * p(3, :) ) / n;
end

% teraz podzielmy wewnętrzny obszar trójkąta oraz krawędź p2-p3
% zrobimy to przechodząc pętlą przez poszczególne "warstwy"
for layer = 2:n
    for row = 1:(layer-1)
        Triangles(layer+1-row , row+1, :) = ...
            ( ...
                (layer-row)*Triangles(layer+1, 1, :) + ...
                (row)*Triangles(1, layer+1, :) ...
            ) ...
            / layer;
    end
end
