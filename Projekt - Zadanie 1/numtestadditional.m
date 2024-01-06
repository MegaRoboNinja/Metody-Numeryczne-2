function numtest3()
% porównanie z całkami obliczonymi analitycznie
fprintf("============================== EKSPERYMENT NUMERYCZNY 3" + ...
        " ===============================\n\n");
fprintf("Porównanie błędu obliczeń dla obszarów o różnym rozmiarze");

fprintf("Obszar całkowania" + ...
        " - trójkąt o wierzchołkach (0,0), (2,0), (2,2)\n");
p = [ 0,0 ; 2,0 ; 2,2 ];

nspan = [100];
num = [1 2 3];
errPerc = zeros(length(nspan),1);
func = @(x,y) x.^6 + y.^4;
for i = 1:length(nspan)
    fprintf("dla n = %d\n\n", nspan(i));
    [~, errPerc(i)] = ...
        compare(func, p, nspan(i), 'x^6 + y^4', 512/15);
end

fprintf("Obszar całkowania" + ...
        " - trójkąt o wierzchołkach (0,0), (200,0), (200,200)..." + ...
        "(sto razy większy)\n");
errPerc2 = zeros(length(nspan),1);
p = [ 0,0 ; 200,0 ; 200,200 ];
for i = 1:length(nspan)
    fprintf("dla n = %d\n\n", nspan(i));
    [~, errPerc2(i)] = ...
        compare(func, p, nspan(i), 'x^6 + y^4', (960006400*10^9)/3);
end

fprintf("Obszar całkowania" + ...
        " - trójkąt o wierzchołkach (0,0), (2000000,0), (2000000,200)..." + ...
        "(milion razy większy)\n");
errPerc2 = zeros(length(nspan),1);
p = [ 0,0 ; 2000000,0 ; 2000000,2000000 ];
for i = 1:length(nspan)
    fprintf("dla n = %d\n\n", nspan(i));
    [~, errPerc2(i)] = ...
        compare(func, p, nspan(i), 'x^6 + y^4', 3.2*10^49);
end