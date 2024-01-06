syms x y(x);

dxdy = diff(x,y);

eqn = 3*dxdy == 0;

cond = 5;

dsolve(eqn, cond)
