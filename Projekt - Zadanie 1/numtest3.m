% NUMTEST 3

triangle = [0,0;2,0;2,2];
n = 10000000;

func = @(x,y) exp(x) + y;
min = 0;
max = exp(2)+2; % na tym obszarze
prec_val = 7/3 + exp(2);
tic
%S = MonteCarlo(func, triangle, n ,max, min);
%compare(func, triangle, n, 'exp(x) + y', prec_val, S);
compare(func, triangle, 5, 'exp(x) + y', prec_val );
toc

% func = @(x,y) x^100+y^30;
% min = 0;
% max = exp(2) + 2; % na tym obszarze
% prec_val = 78594337214150222892802443837440/1581;
% S = MonteCarlo(func, triangle, n ,max, min);
% compare(func, triangle, n, 'x^6+y^7', prec_val, S);
% toc
% tic
% compare(func, triangle, 5, 'x^6+y^7', prec_val );
% toc

% prec_val = 106496/9; dla x^6+y^7
% 
% func = @(x,y) x^41 + y^37;
% min = 0;
% max = 2^41 + 2^37; % na tym obszarze
% prec_val = 6529724679454720/31863;
% tic
% S = MonteCarlo(func, triangle, n ,max, min);
% compare(func, triangle, n, 'x^41 + y^37', prec_val, S);
% compare(func, triangle, 200, 'x^41 + y^37', prec_val );
% toc



% func = @(x,y) sin(x)*sin(y);
% min = 0;
% max = 2; % na tym obszarze
% prec_val = 2*sin(1)^4;
% tic
% S = MonteCarlo(func, triangle, n ,max, min);
% compare(func, triangle, n, 'sin(x)*sin(y)', prec_val, S);
% compare(func, triangle, 5, 'sin(x)*sin(y)', prec_val );
% toc
