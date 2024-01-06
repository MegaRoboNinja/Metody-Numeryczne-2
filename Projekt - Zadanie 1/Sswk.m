function S = Sswk(f,p)
% Projekt 1, zadanie 22 
% Miłosz Wysocki, 324572
%
% Formuła całkowa przybliżająca całkę podwójną funkcji na trójkącie   
% WEJŚCIE 
%   f   - uchwyt do funkcji f dwóch zmiennych, całkowalnej w sensie 
%         Riemanna na obszarze całkowania (patrz wyżej)
%   p   - macierz zawierająca współrzędne wierzchołków trójkąta 
%         (obszaru całkowania) p(i,:) - współrzędne punktu pi
% WYJŚCIE
%   S   - przybliżona wartość całki podwójnej funckji f na trójkącie 
%         określonym przez macierz p
%   

% Obliczmy P - pole obszaru całkowania (trójkąta)
A = [ 1, 1, 1  ;
      p(:, 1)' ;
      p(:, 2)' ];

P = 1/2 * abs( det(A) );
%P = 1/2 * ...
%    ( (p(1,1)-p(3,1))*(p(2,2)-p(3,2)) - (p(1,2)-p(3,2))*(p(2,1)-p(3,1)) );

% Teraz obliczmy punkty pośrednie p12 p23 p13 p123
% w których będziemy liczyć wartość funkcji
p12 = 1/2 * ( p(1, :) + p(2, :) );
p23 = 1/2 * ( p(2, :) + p(3, :) );
p13 = 1/2 * ( p(1, :) + p(3, :) );
p123 = 1/3 * ( p(1, :) + p(2, :) + p(3, :) );


% Aby wyznaczyć przybliżoną wartość całki skorzystajmy ze wzoru

S = P/60 * ( 27 * f( p123(1), p123(2) ) + ...
             3 * ( f( p(1, 1), p(1, 2) ) + f( p(2, 1), p(2, 2) ) ...
                   + f( p(3, 1), p(3, 2) ) ) + ...
             8 * ( f( p12(1), p12(2) ) + f( p23(1), p23(2) ) ...
                   + f( p13(1), p13(2) ) ) ... % (*)
             );

% (*) - tu była literówka : f( p13(1), p13(1) ) )