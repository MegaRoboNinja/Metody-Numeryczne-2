function draw(p, n, Triangles)
% Projekt 1, zadanie 22
% Miłosz Wysocki, 324572
%
% Rysowanie trójkąta podzielonego na n^2 podobnych do niego trójkątów
% WEJŚCIE 
%   p         - macierz zawierająca współrzędne wierzchołków trójkąta 
%               p(i,:) - współrzędne punktu pi
%   n         - liczba określająca podział tego trójkąta - zostanie on
%               podzielony na n^2 mniejszych trójkątów przystających
% WYJŚCIE
%   Triangles - macierz trójwymiarowa zawierająca współrzędne mniejszych 
%               trójkątów (ich relatywna pozycja w macierzy odpowiada
%               pozycji w trójkącie)
%   

clf;
figure(1);
hold on
% narysujmy trójkąt, który będziemy potem dzielić
drawTriangle(p, 'g', 4);

% narysujmy wierzchołki na podstawie których podzielimy trójkąt
for i = 1:size(Triangles, 1)
    for j = 1:(size(Triangles, 2)+1-i)
        plot(Triangles(i, j, 1), Triangles(i, j, 2) ...
            ,'bo-', 'LineWidth', 2, 'MarkerSize', 2)
    end
end

% narysujmy mniejsze trójkąty dzielące duży trójkąt na n^2 części
for column = 1:n
    for row = 1:(n+1-column)
        triangle = ...
          [ Triangles(column, row, 1) Triangles(column, row, 2)    ;
            Triangles(column, row+1, 1) Triangles(column, row+1, 2);
            Triangles(column+1, row, 1) Triangles(column+1, row, 2)];
        drawTriangle(triangle, 'b', 2);
    end
    for row = 2:(n+1-column)
        if column == n+1
            break;
        end
        triangle = ...
          [ Triangles(column+1, row-1, 1) Triangles(column+1, row-1, 2);
            Triangles(column+1, row, 1) Triangles(column+1, row, 2)    ;
            Triangles(column, row, 1) Triangles(column, row, 2)        ];
        drawTriangle(triangle, 'b', 1);
    end
end
