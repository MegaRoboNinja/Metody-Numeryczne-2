function B = Ralston()
% Projekt 2, zadanie 49
% Miłosz Wysocki, 324572
%
% WYJŚCIE
% B - Tablica Butchera dla metody Ralstona (współczynniki z wikipedii)

%   [ 0 ; 0.4 ; 0.45573725 ; 1 ];
C = [ 0.174760282262690 ; -0.551480662878733 ; 1.205535599396524 ;  0.171184781219519 ];
A = [ 0                  0                  0                0;
      0.4                0                  0                0;
      0.296977609247754  0.158759644971036  0                0;
      0.218100388225921 -3.050965148692931 3.832864760467010 0];

B = [C A];