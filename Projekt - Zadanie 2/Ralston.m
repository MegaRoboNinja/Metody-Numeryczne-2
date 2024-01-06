function B = Ralston()
% Projekt 2, zadanie 49
% Miłosz Wysocki, 324572
%
% WYJŚCIE
% B - Tablica Butchera dla metody Ralstona (współczynniki z wikipedii)

%   [ 0 ; 0.4 ; 0.45573725 ; 1 ];
C = [ 0.17476028 ; -0.55148066 ; 1.20553560 ; 0.12118478 ];
A = [ 0          0           0          0;
      0.4        0           0          0;
      0.29697761 0.15875964  0          0;
      0.21810040 -3.05096516 3.83286476 0];

B = [C A];