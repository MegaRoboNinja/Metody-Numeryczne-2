function test2(n, write)
% porównanie z całkami obliczonymi analitycznie

if nargin == 0
    n = 100;
else 
    if nargin == 2
        if write ~= 'n'
            fprintf("================================= TEST 2" + ...
                    " ==================================\n\n");
            fprintf("Porównanie z wartościami całek wielomianów" + ...
                    " rzędu mniejszego niż 4\nobliczonymi analitycznie\n");
            fprintf("Obszar całkowania" + ...
                    " - trójkąt o wierzchołkach (0,0), (2,0), (2,2)\n");
            fprintf("n = %d\n\n", n);
        end
    end
end

p = [ 0,0 ; 2,0 ; 2,2 ];

% Funkcja f(x,y) = 1
compare(@(x,y) 1, p, n, '1', 2);
%Funkcja f(x,y) = x
compare(@(x,y) x, p, n, 'x', 2+2/3);
%Funkcja f(x,y) = x + y
compare(@(x,y) x + y, p, n, 'x + y', 4);
%Funkcja f(x,y) = x^3
compare(@(x,y) x^3, p, n, 'x^3', 6.4);
%Funkcja f(x,y) = x^2 + y
compare(@(x,y) x^2 + y, p, n, 'x^2 + y', 5 + 1/3); % tu była literówka 5.(4) zamiast 5.(3)
%Funkcja f(x,y) = x^2 + y^2
compare(@(x,y) x^2 + y^2, p, n, 'x^2 + y^2', 5 + 1/3);
%Funkcja f(x,y) = x^3 + y^2
compare(@(x,y) x^3 + y^2, p, n, 'x^3 + y^2', 232/30);
%Funkcja f(x,y) = x^3 + y^3
compare(@(x,y) x^3 + y^3, p, n, 'x^3 + y^3', 8);



