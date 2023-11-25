function draw(p, n, Triangles)
% Zobaczmy czy rzeczywiście udało się podzielić trójkąt na mniejsze
clf;
figure(1);
hold on
% narysujmy obszar całkowania
drawTriangle(p, 'r', 4);
% narysujmy wierzchołki na podstawie których podzielimy trójkąt
for i = 1:size(Triangles, 1)
    for j = 1:(size(Triangles, 2)+1-i)
        plot(Triangles(i,j,1), Triangles(i,j,2),'bo-', 'LineWidth', 2, 'MarkerSize', 6)
    end
end

% narysujmy te małe trójkąty o które nam chodziło
for column = 1:n
    for row = 1:(n+1-column)
        triangle = ...
          [ Triangles(column, row, 1) Triangles(column, row, 2)    ;
            Triangles(column, row+1, 1) Triangles(column, row+1, 2);
            Triangles(column+1, row, 1) Triangles(column+1, row, 2)
            ];
        drawTriangle(triangle,'b',2);
    end
    for row = 2:(n+1-column)
        if column == n+1
            break;
        end
        triangle = ...
          [ Triangles(column+1, row-1, 1) Triangles(column+1, row-1, 2);
            Triangles(column+1, row, 1) Triangles(column+1, row, 2)    ;
            Triangles(column, row, 1) Triangles(column, row, 2)
            ];
        drawTriangle(triangle,'g',1);
    end
end
