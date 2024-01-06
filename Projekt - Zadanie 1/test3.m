function test3()
% wielomiany rzędu wyższego niż 4 lub 4

fprintf("================================= TEST 3" + ...
        " ==================================\n\n");
fprintf("Porównanie z wartościami całek wielomianów rzędu 4" + ...
        " lub większego niż 4\nobliczonymi analitycznie\n");
n = 300;
fprintf("Obszar całkowania" + ...
        " - trójkąt o wierzchołkach (0,0), (2,0), (2,2)\n");
fprintf("n = %d\n\n", n);

p = [ 0,0 ; 2,0 ; 2,2 ];
%Funkcja f(x,y) = x^4
compare(@(x,y) x^4, p, n, 'x^4', 10 + 2/3);
%Funkcja f(x,y) = x^3 + y^4
compare(@(x,y) x^3 + y^4, p, n, 'x^3 + y^4', 8.5 + 1/30);
%Funkcja f(x,y) = x^6 + y^4
compare(@(x,y) x^6 + y^4, p, n, 'x^6 + y^4', 512/15);
%Funkcja f(x,y) = x^4 + y^6
compare(@(x,y) x^4 + y^6, p, n, 'x^4 + y^6', 320/21);
%Funkcja f(x,y) = x^41 + y^37
compare(@(x,y) x^41 + y^37, p, n, 'x^41 + y^37', 6529724679454720/31863);

