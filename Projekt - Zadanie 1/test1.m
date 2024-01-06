function test1()
% rysunek

fprintf("================================= TEST 1" + ...
        " ==================================\n\n");
P1Z22_MWY_triangInt(@(x, y) y*sin(x), [1 7; 9 -2; 51 9], 10, 'y');
fprintf("Na rysunku widać podział obszaru całkowania\n");
fprintf("(rysunek powinien wyświetlić się w nowym oknie)\n\n");