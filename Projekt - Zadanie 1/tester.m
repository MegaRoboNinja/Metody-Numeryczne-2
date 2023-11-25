% P1Z22_MWY_triangInt  -- MASTER --

tic
P1Z22_MWY_triangInt(@(x,y) x*sin(y), [1 7; 9 -2; 51 9], 10);
toc
tic
P1Z22_MWY_triangInt(@(x,y) x+y, [1 7; 9 -2; 51 9], 20);
toc
tic
P1Z22_MWY_triangInt(@(x,y) x^y, [1 7; 0 0; 0 0], 100)
toc