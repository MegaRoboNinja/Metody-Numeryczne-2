function [err, errPerc] = compare(f, p, n, fname, expected, obtained)
fprintf("f(x,y) = %s\n", fname);
if nargin == 5
    calculated = P1Z22_MWY_triangInt(f, p, n);
else
    calculated = obtained;
end
fprintf("Oczekiwano: %.1e", expected);
fprintf("\tOtrzymano: %.1e", calculated);
err = abs(calculated - expected);
errPerc = abs(calculated - expected)/expected;
fprintf("\tBłąd: %.1e\t (Wzgl: %.2e)\n", err, errPerc); 