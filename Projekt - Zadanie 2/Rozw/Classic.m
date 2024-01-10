function B = Classic()
% Projekt 2, zadanie 49
% Miłosz Wysocki, 324572
%
% WYJŚCIE
% B - Tablica Butchera dla metody klasycznej

%   [ 0 ; 1/2 ; 1/2 ; 1 ];
C = [ 1/6 ; 1/3 ; 1/3 ; 1/6 ];
A = [ 0          0           0          0;
      1/2        0           0          0;
      0          1/2         0          0;
      0          0           1          0];

B = [C A];